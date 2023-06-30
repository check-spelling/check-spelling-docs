# Detect non-text files

Out of the box, check-spelling will scan everything. Whether that's a `.png` or `.zip`.

In general, users are requested to set up an `exclude` file.

It would be nice if the tool could recognize files that aren't interesting to it and suggest an `exclude` file, just as it can suggest things to add into the whitelist.

## Simple algorithm

If a file has more *non-words* than dictionary *words*, it's a good candidate for exclusion.

This is implemented in [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21) as part of [Autodetect noisy files](./Feature:-Autodetect-noisy-files.md)

### Implementation

1. Files would need to be scanned individually
1. Word counts would need to be maintained (currently the engine uses a hashset, it would have to switch to a hashtable where it would retrieve the value, increment, and store)
1. The fold phase(s) would need to merge the counts together (things like `foo`, `Foo`, and `foos` are merged into `foo` and mostly reported as a single entity)
1. When the dictionary pass is reached, as a word is found in the dictionary, its count would need to be added to a running total, and at the end, the count for the remaining tokens would need to be summed and compared
1. If there's an imbalance (51%?), a warning should be issued

## File patterns

This is implemented in [v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22) as part of [Heuristic exclude suggestions](./Feature:-Heuristic-exclude-suggestions.md)

Totals for files could be checked by *file extension*, *file infix*, *file prefix*, and *directory name*

Probably with a different threshold (75%?), or different thresholds for each

Suggestions could be made based on each of those categories:

`exclude.txt`:
```
# .png files:
\.png$
# .min. infix
\.min\.
# jquery prefix
/jquery-
# test-data directory:
/test-data/
```

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
