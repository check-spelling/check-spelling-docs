# Restricted Permissions

* [Workflow](#workflow)
* [Requirements by phase](#requirements-by-phase)
  * [Checking](#checking)
  * [Commenting](#commenting)
  * [Updating branches](#updating-branches)
* [History](#history)
* [Known issues](#known-issues)
  * [Versions before v0.0.26 are broken](#before-v0.0.26)

## Workflow

- If you don't need to comment on commits/pull requests, a single workflow with a single job without `contents: write` / `pull-requests: write` will generally work. (Uploading SARIF is another rough edge that seems to require `security-events: write` although ideally it shouldn't...)
  - https://raw.githubusercontent.com/check-spelling/spell-check-this/main/.github/workflows/spelling.yml -- delete non checking jobs
- Versions up to [v0.0.26](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.26) support a two job workflow where the checking job does not have `write` permissions and the second job has the required `write` permissions but doesn't check out the repository which should address concerns of handling untrusted content.
  - https://raw.githubusercontent.com/check-spelling/spell-check-this/1645aae0fda1e04e3c44f156334b628aa651aeb0/.github/workflows/spelling.yml defines a workflow that is compatible with these requirements
- Versions after [v0.0.26](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.26) should support a two workflow model where the checking workflow file / job does not have `write` permissions and the second workflow file / job responds to `workflow_run` and has any necessary `write` permissions

## Requirements by phase

### Checking

- `contents: read` -- to read the repository (to check it out) -- for a `pull_request_target`, this may include untrusted content (the merge)
- `pull-requests: read` -- to determine if this `push` event should be skipped in favor of a related `pull_request_target` event

### Commenting

- `contents: write` -- if it's commenting on a commit (i.e. `on: push`)
- `pull-requests: write` -- if it's commenting on a PR (i.e. `on: pull_request_target`)

### Updating branches

- `contents: write` -- to write new commits
- `pull-requests: write` -- to collapse existing comments and write a new comment

## History

Included in [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20)

GitHub introduced [permissions for GITHUB_TOKEN](https://github.blog/changelog/2021-04-20-github-actions-control-permissions-for-github_token/) which enables one to restrict tokens to just the necessary permissions.

check-spelling has a couple of distinct phases that have differing requirements.

It's better from a security perspective to use "least privilege".

## Known issues

### ⚠️ Versions before [v0.0.26](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.26) are broken - checks for forks always fail
<a name="before-v0.0.26"></a>

If you are running a version prior to [v0.0.26](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.26), you will erroneously receive this message. Please upgrade to [v0.0.26](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.26) or newer.

You should see a notice hinting about this of the form:

> ⚠️ Found note for version 0.0.25: 'If you accept PRs from forks, they won't work. Please upgrade to https://github.com/check-spelling/check-spelling/releases/v0.0.26'

As of April 2026, GitHub recently changed its API response for one of the checks that check-spelling used to identify write-access. Unfortunately this means that check-spelling will refuse to run on any PRs from cross repository forks.

- Tracked as [check-spelling#103](https://github.com/check-spelling/check-spelling/issues/103)
- secpoll was updated to explain the issue and now suggests upgrading
- Fixed in [v0.0.26](https://github.com/check-spelling/check-spelling/releases/v0.0.26) to use a different test

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
