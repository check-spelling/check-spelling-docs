# GitHub Action Events

## Permissions

If your spelling workflow & action haven't been updated to [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20), it may not have permissions specified.

[Organizations](https://docs.github.com/en/organizations/managing-organization-settings/disabling-or-limiting-github-actions-for-your-organization#configuring-the-default-github_token-permissions) and [Repositories](https://docs.github.com/en/actions/security-guides/automatic-token-authentication#modifying-the-permissions-for-the-github_token) can set default permissions for workflows to be read-only.

If you see this error (instead of getting comments):

> curl: (6) Could not resolve host: null

That's probably the problem. The fix is to [upgrade the workflow](https://raw.githubusercontent.com/check-spelling/spell-check-this/main/.github/workflows/spelling.yml).

Note that this can happen in a fork even if things are working fine in the upstream repository as default permissions can vary from organization to organization or repository to repository.

## Supported GitHub flows

- [push](#push)
- [pull_request_target](#pullrequesttarget)
  - [Checking potential merges for PRs](#checking-prs-by-their-merge-commit)
    - [checkout (built-in)](#built-in)
    - [actions/checkout](#using-actionscheckout)
- [pull_request](#pullrequest) ⚠️
- [issue_comment](#issuecomment)
- [schedule](#schedule) 🙅

### Notes

- [Ignore Draft PRs](#draft)
- See [Workflow Variables](Configuration#workflowvariables)

### push

This is the easiest event to explain:

When the owner of a repository pushes a commit
(or tag, unless you exclude that -- which you may want to do),
the spell checker can run and comment on the commit.

Comments on commits will appear when those commits are offered
as part of a pull request to another repository.

⚠️ Forks can disable actions,
and thus it's possible for this workflow
not to have been run by your contributors.

Example workflow snippet:

```yaml
on:
  push:
```

### pull_request_target

New in [0.0.17-alpha](https://github.com/check-spelling/check-spelling/releases/tag/0.0.17-alpha).

Example workflow snippet:

```yaml
on:
  push:
  pull_request_target:
    # this is recommended for all repositories that have PRs.
```

### Checking PRs by their merge commit

If you use `actions/checkout` to get the source for checking, `push` and `pull_request` will naturally do the right thing.
However, `pull_request_target` will check out the _base_ of the PR, not the **HEAD**.

The downsides of `pull_request` are that you can't use any `write` features (classically that was creating a `comment`, but with current versions of check-spelling, that's publishing a SARIF report).

#### Built-in

If you want to check the results of a potential merge, you need something fancier:

```yaml
on: pull_request_target

jobs:
  spelling:
    runs-on: ubuntu-latest
    steps:
    - name: Check Spelling
      uses: check-spelling/check-spelling@main
      with:
        checkout: 1
```

#### Using actions/checkout

You can use whichever version of `actions/checkout` is current...

```yaml
on: pull_request_target

jobs:
  spelling:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout code
      uses: actions/checkout@v4
      with:
        ref: ${% raw %}{{{% endraw %} github.event.pull_request && format('refs/pull/{0}/merge', github.event.pull_request.number) || github.event.ref }}
    - name: Check Spelling
      uses: check-spelling/check-spelling@main
```

### pull_request

ℹ️ You should be able to migrate to [pull_request_target](#pullrequesttarget)
when you upgrade to 0.0.17-alpha.

⚠️ Non-member contributors who create a pull request
from a forked repository will trigger an action run with a
special [read-only github token](https://docs.github.com/en/actions/configuring-and-managing-workflows/authenticating-with-the-github_token#permissions-for-the-github_token).
This token is enough to retrieve and process the pull request,
including generating annotations,
but it doesn't have permission to post a comment.

This action will spit out the comment it tried to post
(escaped for posting) into the action log,
so you can retrieve it and manually reason through it.

This is understandably less than ideal.

Example workflow snippet:

```yaml
on:
  push:
  pull_request:
    # this is not recommended because comments will not work for
    # PRs from forks by non members.
```

It's possible to create a Personal Access Token and configure it
with permission to comment, but that's a fairly high bar
(I haven't done it myself).

Instead, for projects that receive PRs, I've settled on using a
[schedule](#schedule) which will be able to comment.

### issue_comment

If you want to let user [update the expect list](./Feature:-Update-expect-list) from a PR ([smoothly with a deploy key](./Feature:-Update-with-deploy-key)), you can use a job like this:

```yml
on:
  issue_comment:
    types:
    - 'created'

jobs:
  update:
    name: Update PR
    permissions:
      contents: write
      pull-requests: write
      actions: read
    runs-on: ubuntu-latest
    if: ${% raw %}{{{% endraw %}
        github.event_name == 'issue_comment' &&
        github.event.issue.pull_request &&
        contains(github.event.comment.body, '@check-spelling-bot apply')
      }}
    steps:
    - name: apply spelling updates
      uses: check-spelling/check-spelling@main
      with:
        experimental_apply_changes_via_bot: 1
        checkout: true
        ssh_key: "${% raw %}{{{% endraw %} secrets.CHECK_SPELLING }}"
```

- `contents: write` is mostly for forks as the `ssh_key: "${% raw %}{{{% endraw %} secrets.CHECK_SPELLING }}"` will be used if possible to push the generated commit.
- `pull-requests: write` enables collapsing the triggering comment.
- `actions: read` is needed for private repositories.

### schedule

🙅 [Breaking change: Dropping support for on: schedule](./Breaking-change:-Dropping-support-for-on:-schedule) after [v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22)

This is basically a cron job run by GitHub.
It will look through open PRs and comment if they've been updated
since the last run (assuming the [timeframe](./Configuration:-Advanced#timeframe) is correct).

See [timeframe](./Configuration:-Advanced#timeframe) for the configuration window.

Example workflow snippet:

```yaml
on:
  push:
  schedule:
    # * is a special character in YAML so you have to quote this string
    - cron: '15 * * * *'
```

Cons: There will not be a ❌ for the PR, so you have to look
for a comment.

### Draft

If you don't want PRs to be spell checked eagerly, you can do something like:

```yaml
name: Spell checking
on:
  pull_request_target:
    branches:
      - "**"
    types: ['opened', 'reopened', 'synchronize', 'ready_for_review']

jobs:
  build:
    name: Spell checking
    runs-on: ubuntu-latest
    if: github.event.pull_request.draft == false
...
```

There are two sides to this:

1. An additional `if:` condition for `github.event.pull_request.draft == false` -- this suppresses checks while the PR is in draft (note that any initial `push` events will still run and may trigger scanning / reporting if it's unhappy, but subsequent runs once a PR is opened will be suppressed by check-spelling's `suppress_push_for_open_pull_request`)
2. `on:` / `pull_request_target:` / `types:` / `'ready_for_review'` -- this triggers a check when someone converts the PR from draft to ready for review (otherwise you'd have to wait for an additional push, which would be frustrating).

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
