# Avoid using colors in names

I received feedback that colors were problematic.

To address this, I've added support for:

- `expect` <=> `whitelist`

I've made this the primary term and am offering the old one for backward compatibility (along w/ making PRs to existing consumers to migrate).

In some ways, `expect` is actually more accurate as the action tries to prune the list of things which are no longer necessary.

Released in [0.0.16-alpha](https://github.com/check-spelling/check-spelling/releases/tag/0.0.16-alpha)

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
