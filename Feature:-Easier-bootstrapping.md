# Easier bootstrapping

You should be able to copy the contents of https://github.com/check-spelling/spell-check-this/ into your repository and push.

Versions 0.0.20 and newer can offer to install [spell-check-this](https://github.com/check-spelling/spell-check-this/)'s template content.

Versions 0.0.17 and newer will walk you through improvements (as will that repository's template content).

## Historical information

Prior to 0.0.17, in order to get the shiny features from check-spelling, to get started, one needed to:

- specify `bucket` and `project` as part of the configuration.
- create an `expect` (or similar) file.

With 0.0.17, `bucket` and `project` are replaced by `config` which defaults to `.github/actions/spelling` (as if one had specified `bucket: .github/actions` and `project: spelling`). Note that `bucket` and `project` are still supported (and to retain backwards compatibility these override `config`).

With 0.0.17, the action will provide comments when it runs even if there is no `expect` (or similar) file. This should lead to a more natural flow.

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
