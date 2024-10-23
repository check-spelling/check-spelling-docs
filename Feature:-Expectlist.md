# Avoid using colors in names

I received feedback that colors were problematic.

To address this, I've add support for:

- `expect` <=> `whitelist`

I've made this the primary term and am offering the old one for backward compatibility (along w/ making PRs to existing consumers to migrate).

In some ways, `expect` is actually more accurate as the action tries to prune the list of things which are no longer necessary.

Released in [0.0.16-alpha](https://github.com/check-spelling/check-spelling/releases/tag/0.0.16-alpha)

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
