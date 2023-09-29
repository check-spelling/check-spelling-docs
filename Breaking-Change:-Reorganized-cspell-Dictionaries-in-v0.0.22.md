# Reorganized cspell Dictionaries in v0.0.22

check-spelling uses [streetsidesoftware/cspell-dicts](https://github.com/streetsidesoftware/cspell-dicts) as the basis for its extra dictionaries. At some point, the files in cspell-dicts were reorganized.

This means that `cspell:` paths that reference the old locations are likely to break.

You are likely to encounter a [`dictionary-not-found`](https://github.com/check-spelling/check-spelling/wiki/Event-descriptions#dictionary-not-found) error which should walk you through the steps necessary to resolve the problem.
