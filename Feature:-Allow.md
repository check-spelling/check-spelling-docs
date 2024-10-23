# Delta additions to the dictionary

`allow.txt` allows words to be added to the dictionary.

One word per line.
Words are at least partially case sensitive -- adding a proper name (e.g. `Microsoft`) doesn't result in the lowercase variant being accepted (you'd add that on another line).

## History

Prior to [0.0.16-alpha](https://github.com/check-spelling/check-spelling/releases/tag/0.0.16-alpha) when one wanted to supplement the dictionary, one had to copy the base dictionary and then add more items.

It is nicer if one can just supply the new words without having to maintain a complete copy of the dictionary.

Released in [0.0.16-alpha](https://github.com/check-spelling/check-spelling/releases/tag/0.0.16-alpha) as: `allow`.

Note that this is distinct from [expect](./Feature:-Expectlist.md).

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
