# Removed Dictionaries

## [v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22)

These two dictionaries include too many typos to be worth suggesting:

```diff
-      cspell:cpp/src/cpp.txt
-      cspell:win32/src/win32.txt
```

They're still supported in that the underlying repository still retains the files, so users upgrading to this version will not break.

The visible change for users is that by default these dictionaries will not be suggested by check-spelling.

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
