# First run advice

* As of `0.0.17`, the action will suggest changes to `expect`.
* As of `0.0.18`, the action will suggest changes to `excludes`.

In general, the current recommendation is to copy the contents of https://github.com/check-spelling/spell-check-this/ into your repository as that should give you a good first-run experience.

## Historical information

Currently, messaging is basically done in the form of a GitHub Action Run log message.

This isn't particularly good...

If there's an `expect` file and no `excludes` file, I think I'll have it suggest an `excludes` file.
If there's an `expect` and an `excludes`, I might have it suggest a `patterns` file.

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
