# Known Issues

- [Only changed doesn't work when PRs are initially created from forks](#only-changed-doesnt-work-when-prs-are-initially-created-from-forks)
- [Too many unrecognized words](#toomanyunrecognizedwords)
- [@dependabot can't comment](#dependabot-cant-comment)

## Only changed doesn't work when PRs are initially created from forks

When using [`only_check_changed_files`](Configuration.md#onlycheckchangedfiles) and a PR is _created_ from a **fork**, the initial check will probably not find files to check, producing a warning:

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

See [Automatically truncate comment](./Feature:-Automatically-truncate-comment.md)

👷 Upgrade to [v0.0.20](https://github.com/check-spelling/check-spelling/releases/v0.0.20) (or newer)

## @dependabot can't comment

### Cause

`@dependabot` makes special `push` events without the standard `comment` permission, as it's a really magical account. Normally a third party would have its own private fork, `push` to the fork and create a `pull_request` (+ `pull_request_target`) to the destination repository. But that isn't how `@dependabot` is implemented.

### Resolution

See [@dependabot](@dependabot.md)

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
