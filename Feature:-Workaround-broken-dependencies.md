# Workaround broken dependencies

## Background

For a few weeks, a number of GitHub owned actions were triggering warnings.
There were Pull Requests or in some cases merged PRs that just hadn't been released.

This action, like those actions doesn't release daily, which means there was a risk
that this action might be forced to release tied to either an alternate (possibly
unmaintained) action, or point to an action that triggers warnings until a future
release updates the action reference

## Implementation

The `action.yml` will reference both the canonical action and an alternate
action. `secpoll.sh` gains the ability to check a given action and report
if a dns entry indicates that the canonical action is in good shape.

As with the main `secpoll` functionality, this relies on dns entries which
can be updated dynamically after the release.

## History

Each of:

- [github/codeql-action@v2](https://github.com/github/codeql-action/releases/tag/v2)
- [actions-download@v3](https://github.com/actions/download/releases/tag/v3)
- [actions-upload-artifact@v3](https://github.com/actions/upload-artifact/releases/tag/v3)

triggered warnings between the release of [`v0.0.20`](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20) and [`v0.0.21`](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21)

## Deployment

As of `v0.0.21`, there are no workarounds in active deployment.
A future release may rely on this feature...

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
