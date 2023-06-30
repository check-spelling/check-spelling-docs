# Known Issues

* [Too many unrecognized words](#too-many-unrecognized-words)
* [@dependabot can't comment](#dependabot-cant-comment)

## Too many unrecognized words

ℹ️ This should generally not be a problem as of v0.0.20.

### Problem

If the generated comment exceeds GitHub's limit, it'll be rejected.

### Cause

Usually this happens when a bunch of binary files are added and are not in `excludes`.

### Indications

* For `push`, `pull_request`, and `pull_request_target`, there will be a :x: indicator, but there will not be a comment.
* The Action Log should include the information.

### Recommendations

* Use `excludes` or `patterns` to suppress some of the content.

### Resolution

See [Automatically truncate comment](./Feature:-Automatically-truncate-comment.md)

👷 Upgrade to [v0.0.20](https://github.com/check-spelling/check-spelling/releases/v0.0.20) (or newer)

## @dependabot can't comment

### Cause

`@dependabot` makes special `push` events without the standard `comment` permission, as it's a really magical account. Normally a third party would have its own private fork, `push` to the fork and create a `pull_request` (+ `pull_request_target`) to the destination repository. But that isn't how `@dependabot` is implemented.

### Resolution

See [@dependabot](@dependabot.md)

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
