# Dropping printf special cases

## Background

When the core for check-spelling was initially developed, it was a lot simpler and didn't have any support for [`patterns`](https://github.com/check-spelling/check-spelling/wiki/Configuration-Examples:-patterns).

As it was often run against C/C++ repositories, code was baked-in to handle `\n`, `\r`, and `\t`.

## Changes

If you're currently working around that special casing, you'll be able to remove your `patterns.txt` entries for them.

If you're currently relying on that special casing, you'll need to add entries to `patterns.txt`, something like:

```
(?<!\\)\\[nrt]
```

## Schedule

Expecting to deploy in [v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22)
