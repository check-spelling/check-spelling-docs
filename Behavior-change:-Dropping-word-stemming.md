# Behavior change: Dropping word stemming

The engine behind the word splitter has code to group related words together (this is known as "stemming").

Word | Stem
--|--
`customwords` | `customword`
`customworded` | `customword` 
`customwordies` | `customwordy`

This allows one to add just a single entry (the stem) to a **dictionary** / **expect** list. It had a number of folds including

- `-s`
- `-ed`
- `-ies`

The downside to this stemming is that if a repo has both `potato` and `potatos`, the latter was treated as a stem of the former and they were collectively accepted if the former is in the dictionary.

As of [0.0.17-alpha](https://github.com/check-spelling/check-spelling/releases/tag/0.0.17-alpha), I'm removing this feature. Those upgrading will probably need to add extra items to their **dictionary** / **expect** files. For `check-spelling` itself, that amounted to 6 new entries out of under 100, so about 6%.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
