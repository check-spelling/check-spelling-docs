# GitHub Action Events

Supported GitHub actions:

* [push](#push)
* [pull_request_target](#pull_request_target)
* [pull_request](#pull_request) :warning:
* [schedule](#schedule)
* See [[Workflow Variables|Configuration#Workflow_Variables]] 

### push

This is the easiest event to explain:

When the owner of a repository pushes a commit
(or tag, unless you exclude that -- which you may want to do),
the spell checker can run and comment on the commit.

Comments on commits will appear when those commits are offered
as part of a pull request to another repository.

:warning: Forks can disable actions,
and thus it's possible for this workflow
not to have been run by your contributors.

Example workflow snippet:

```workflow
on:
  push:
```

### pull_request_target

New in [0.0.17-alpha](https://github.com/check-spelling/check-spelling/releases/tag/0.0.17-alpha).

Example workflow snippet:

```workflow
on:
  push:
  pull_request_target:
    # this is recommended for all repositories that have PRs.
```

### pull_request

ℹ️ You should be able to migrate to [pull_request_target](#pull_request_target)
when you upgrade to 0.0.17-alpha.

:warning: Non-member contributors who create a pull request
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

```workflow
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

### schedule

This is basically a cron job run by GitHub.
It will look through open PRs and comment if they've been updated
since the last run (assuming the [timeframe](#timeframe) is correct).

See [timeframe](./Configuration:-Advanced#timeframe) for the configuration window.

Example workflow snippet:

```workflow
on:
  push:
  schedule:
    # * is a special character in YAML so you have to quote this string
    - cron: '15 * * * *'
```

Cons: There will not be a :x: for the PR, so you have to look
for a comment.