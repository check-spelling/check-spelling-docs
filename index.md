# <img alt="check-spelling logo" src="https://raw.githubusercontent.com/check-spelling/art/main/logo/spell-check.png" width="30"> check spelling action

The [check-spelling](https://github.com/marketplace/actions/check-spelling) GitHub action enables you to catch misspellings.

Everyone makes typos. This includes people writing documentation and comments,
but it also includes programmers naming variables, functions, apis, classes,
and filenames.

Often, programmers will use `InitialCapitalization`, `camelCase`,
`ALL_CAPS`, or `IDLCase` when naming their things. When they do this, it makes
it much harder for naïve spelling tools to recognize misspellings, and as such,
with a really high false-positive rate, people don't tend to enable spellchecking
at all.

This action's tools are capable of tolerating all of those variations.
Specifically, [w](https://raw.githubusercontent.com/jsoref/spelling/main/w) understands
enough about how programmers name things that it can split the above conventions
into word-like things for checking against a dictionary.

- [Quick Start](Quick-Start.md)
- [Showcase](Showcase.md)
- [Event descriptions](Event-descriptions.md)
- [Configuration information](Configuration-information.md)
- [Possible features](Possible-features.md)
- [Security](Security.md)

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
