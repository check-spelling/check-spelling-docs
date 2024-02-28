Currently, by default check-spelling retrieves [https://raw.githubusercontent.com/check-spelling/check-spelling/dictionary/dict.txt](https://github.com/check-spelling/check-spelling/blob/dictionary/dict.txt) and then consumers can replace (using `dictionary`) or augment (`allow`) / redact (`reject`) additional words.

I plan to make to changes:

1. Only download the dictionary if users aren't supplying their own (using `dictionary`)
1. Give the dictionary a tag and have each release download a release pinned version

Going forward, this will enable me to update the dictionary by, e.g. removing [Archaic words](Archaic-words.md) or adding words that are commonly used by consumers.

When I make such updates, I'll be able to include the list of changes in the release notes 😄

🛠️ This is ready for release in 0.0.17-alpha

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
