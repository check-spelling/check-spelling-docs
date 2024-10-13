# Only check changed hunks

Some workflows would like to be able to only send feedback to contributors about the changes they're making as opposed to preexisting unrecognized content.

## Background

As of [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21), you can use [`only_check_changed_files: true`](Configuration.md#onlycheckchangedfiles) to limit spell checking to changed files.

## Implementation

It should be fairly easy to use the equivalent of `git blame BASE..HEAD -- file` to identify which line numbers should be checked and only check them.

(It's possible the implementation will use porcelain output as opposed to actually using the naive `git blame BASE..HEAD`, but that's a minor implementation detail.)

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
