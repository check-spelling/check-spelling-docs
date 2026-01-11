# Scan noisy files

Sometimes you may want to scan a file even if it has more unrecognized words than recognized words.

By default, the [Autodetect noisy files](./Feature:-Autodetect-noisy-files) feature would talk about these files,
and suggest adding them to `excludes.txt`.

If, you need these files to be checked, you can add:

```workflow
with:
  disable_checks: noisy-file
```

to your configuration.

## Sample consumers

[cspell compact-dictionaries workflow](https://github.com/check-spelling/cspell-dicts/commit/2a5b8bb057f4580749933060b29c466e92c93400#diff-f38bd48888fa3290eb90897dc1e21411b2bcf12a6538cd72bb583e7608787698R88)

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
