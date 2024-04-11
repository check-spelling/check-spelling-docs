# Support gitignore

## Background

By default, check-spelling only checks files that are present in `git ls-files`, so, unless you've manually added files to a git repository and then have a pattern that would naturally prevent adding those same files in the future, you should rarely run into a case where this matters.

## Possible implementation

[Suggestion](https://github.com/check-spelling/check-spelling/issues/10#issuecomment-817354712) by @briandfoy is to use [Text::Gitignore](https://metacpan.org/pod/Text::Gitignore)

## Feedback welcome

If you have specific cases where you feel a need for this feature, please feel free to file a ticket describing your use case. It shouldn't be too hard to implement.

# ETA

None at this time. I'm still thinking it over. But it'll probably just happen one day.

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
