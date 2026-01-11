# Autodetect valid word lengths

With [Heuristic exclude suggestions](./Feature:-Heuristic-exclude-suggestions), I've started reviewing what's worth checking.

For one, a significant portion of the two letter space is already in the dictionary.

For another, programmers often develop two letter sequences, either as abbreviations or identifiers.

In a recent pull request of mine, every single 2 letter pair that was flagged was valid.

I know of one repository with a run of `a`s that exceeds 32766 characters.

The checker (while reading the dictionary) will find the shortest and longest word lengths.

- Unless overridden, it will ignore things that are shorter than the shortest word length (at least 3).
- Unless overridden, it will ignore things that are longer than two characters longer than the longest word (this allows one to accidentally add two characters to a long word and still be flagged for a typo).

There are now two flags to configure the length of "words":

- `shortest_word` -- you can set this to `"2"` to restore the old behavior
- `longest_word` -- you could set this to some obscene number like `"32767"` to get closer to the old behavior

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
