# `excludes` Examples

Note that regular expressions are generally case-sensitive. You can use `(?:(?i)...)` to make a line case-insensitive (currently all lines are treated together, so if you don't scope your item, it will carry through to the remaining lines, which is could be unexpected -- this is likely to change in the near future).

```
# Ignore directories (Golang) named `vendor`
(?:^|/)vendor/
# Ignore directories named `third_party`
(?:^|/)third_party/
# Ignore npm files
(?:^|/)package(?:-lock|)\.json$
# Ignore files named (yarn for Node.js) `yarn.lock`
(?:^|/)yarn\.lock$
# Ignore files named (rust) `Cargo.toml`
(?:^|/)Cargo\.toml$
# Ignore files or directories that case-insensitively have `LICENSE` somewhere in their path
(?:(?i)LICENSE)
# Ignore files ending in...
\.pdf$
\.png$
# Ignore Excel files (`.xsl` and `.xslx`)
\.xslx?$
# Ignore locales that aren't en / en_GB (roughly: keep en_US and drop everything else)
locales/(?!en)
locales/en_GB
# Ignore GitHub `CONTRIBUTING.md` in the root
^CONTRIBUTING\.md$
# Ignore the action's configuration data
^\.github/action/spelling/
# Ignore all GitHub workflow files
^\.github/workflows/
```

## Convert paths to regular expressions

As of [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20), if you have full file paths you want to exclude, you can wrap the path in `^\Q`...`\E$` and add it as a line in `excludes.txt`.

Note that `\Q`...`\E` notation is not compatible with [v0.0.19](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.19) / older releases, so during migration one should be sure not to use it.

Once you've upgraded, you can safely convert...

## Purpose

`excludes` is designed to enable check-spelling to skip files that match any of the patterns in `excludes`.

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
