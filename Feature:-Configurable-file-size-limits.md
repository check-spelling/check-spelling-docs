# Configurable file size limits

Included in [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20)

## Background

Historically, check-spelling would check any file it could open.

Some repositories have giant files.

Whether they're actually text files isn't relevant to check-spelling, unless they're excluded, it would process them.

## Implementation

Default is to exclude files over 1 mb.

Configurable via [`largest_file`](Configuration#largestfile).

Reported as `large-file`.

Files that are too large will be suggested for exclusion.

## Future

I might also want to have check-spelling time itself and warn when it takes too long to scan a file. -- This would also be configurable.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
