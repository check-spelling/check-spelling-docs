# Detect non-text files

Out of the box, check-spelling will scan everything. Whether that's a `.png` or `.zip`.

In general, users are requested to set up an `exclude` file.

It would be nice if the tool could recognize files that aren't interesting to it and suggest an `exclude` file, just as it can suggest things to add into the whitelist.

## Simple algorithm

If a file has more _non-words_ than dictionary _words_, it's a good candidate for exclusion.

This is implemented in [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21) as part of [Autodetect noisy files](./Feature:-Autodetect-noisy-files)

### Implementation

1. Files would need to be scanned individually
1. Word counts would need to be maintained (currently the engine uses a hashset, it would have to switch to a hashtable where it would retrieve the value, increment, and store)
1. The fold phase(s) would need to merge the counts together (things like `foo`, `Foo`, and `foos` are merged into `foo` and mostly reported as a single entity)
1. When the dictionary pass is reached, as a word is found in the dictionary, its count would need to be added to a running total, and at the end, the count for the remaining tokens would need to be summed and compared
1. If there's an imbalance (51%?), a warning should be issued

## File patterns

This is implemented in [v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22) as part of [Heuristic exclude suggestions](./Feature:-Heuristic-exclude-suggestions)

Totals for files could be checked by _file extension_, _file infix_, _file prefix_, and _directory name_

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
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
