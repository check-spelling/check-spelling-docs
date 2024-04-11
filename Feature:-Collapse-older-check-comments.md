# Collapse older check comments

Included in [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20)

If a PR has a commit that introduces a spelling mistake, and then a new commit cleans it up, or introduces new misspellings, it'd be nice if the older comment were collapsed as **outdated**.

In v0.0.18, when one asks the bot to apply changes, the changes suggestion and request comments are collapsed, so the collapsing code is ready.

The implementation uses GraphQL to ask for the right comment and some filtering to find the comment node.

With the comment node, it's trivial to call the collapsing code.

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
