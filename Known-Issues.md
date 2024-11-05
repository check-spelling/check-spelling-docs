# Known Issues

- [Changes to the workflow will not be tested in a pull request if the workflow is configured to use `pull_request_target`](changes-to-the-workflow-will-not-be-tested-in-a-pull-request-if-the-workflow-is-configured-to-use-pull_request_target)
- [Only changed doesn't work when PRs are initially created from forks](#only-changed-doesnt-work-when-prs-are-initially-created-from-forks)
- [Too many unrecognized words](#Too_many_unrecognized_words)
- [@dependabot can't comment](#dependabot-cant-comment)

## Changes to the workflow will not be tested in a pull request if the workflow is configured to use `pull_request_target`

The [recommended configuration](https://github.com/check-spelling/spell-check-this/blob/main/.github/workflows/spelling.yml) for check-spelling uses `pull_request_target` which behaves differently from `pull_request` in a couple of ways.

One of those ways is that the configuration that's used for the workflow file itself is the one in the pull_request base as opposed to the pull request head. In order to test changes to the workflow itself, you'll need to `push` the workflow changes into a branch and review its output.

If you're using [`suppress_push_for_open_pull_request`](https://github.com/check-spelling/check-spelling/wiki/Configuration#suppress_push_for_open_pull_request), you should avoid pushing your change and immediately creating a PR into the same repository as the `push` event which would trigger a workflow run that would validate your changes will quit noting that it found the pull_request event which will not do what you want. Instead, just `push` the changes to a branch in your repository to verify that they do what you want, and then create a pull request to integrate them.

Note that for version upgrades, you may need to temporarily include additional entries either via `allow` or `expect` in order to enable the older version of check-spelling to tolerate things which the newer version may tolerate for other reasons.

## Only changed doesn't work when PRs are initially created from forks

When using [`only_check_changed_files`](https://github.com/check-spelling/check-spelling/wiki/Configuration#only_check_changed_files) and a PR is _created_ from a **fork**, the initial check will probably not find files to check, producing a warning:

> ⚠️ Was not provided any regular readable files

When the PR is updated triggering a _synchronize_ event, check-spelling should be able to properly identify changed files and report them (but this will miss any files only changed in the initial PR and not in the updates).

Reported in [v0.0.21](https://github.com/check-spelling/check-spelling/releases/v0.0.21) ([v0.0.22](https://github.com/check-spelling/check-spelling/releases/v0.0.22) was released around the time that v0.0.21 was added to the reporting repository).

ℹ️ This should generally not be a problem as of [v0.0.23](https://github.com/check-spelling/check-spelling/releases/v0.0.23).

### Workaround

Please test [prerelease](https://github.com/check-spelling/check-spelling/tree/prerelease). Feedback welcome.

## Too many unrecognized words

ℹ️ This should generally not be a problem as of [v0.0.20](https://github.com/check-spelling/check-spelling/releases/v0.0.20).

### Problem

If the generated comment exceeds GitHub's limit, it'll be rejected.

### Cause

Usually this happens when a bunch of binary files are added and are not in `excludes`.

### Indications

- For `push`, `pull_request`, and `pull_request_target`, there will be a :x: indicator, but there will not be a comment.
- The Action Log should include the information.

### Recommendations

- Use `excludes` or `patterns` to suppress some of the content.

### Resolution

See [[Automatically truncate comment|Feature: Automatically truncate comment]]

👷 Upgrade to [v0.0.20](https://github.com/check-spelling/check-spelling/releases/v0.0.20) (or newer)

## @dependabot can't comment

### Cause

`@dependabot` makes special `push` events without the standard `comment` permission, as it's a really magical account. Normally a third party would have its own private fork, `push` to the fork and create a `pull_request` (+ `pull_request_target`) to the destination repository. But that isn't how `@dependabot` is implemented.

### Resolution

See [[@dependabot]]
