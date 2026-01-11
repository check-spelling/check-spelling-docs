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
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
