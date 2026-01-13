# Improve suggested dictionaries order

Ideally the suggested dictionaries should be the ones most useful to a user:

1. By coverage (descending📉)
2. By size (ascending📈)

Thus the first dictionary shown should offer the most words that would otherwise need to be included in `expect.txt`.
For ties, dictionaries first be as small as possible (thus be the most efficient dictionary to offer the same coverage).

And the last dictionary should be the largest dictionary that offers the worst coverage (potentially a very very very large dictionary that only covers a single word).

## Potential improvements

It's possible that dictionaries could be scored based on unique value. This isn't implemented yet.

The implementation is basically:

1. sort the union of all suggested dictionaries retaining only unique words
2. for each dictionary, score any word that is in that list

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
