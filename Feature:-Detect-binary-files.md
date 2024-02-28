# Detect binary files

The [`file`](https://linux.die.net/man/1/file) utility relies on [`magic`](https://linux.die.net/man/5/magic) to identify a file's format.

It's possible to ask `file` to not use all its heuristics (which allow it to precisely identify a file) and merely provide a broad categorization -- returned as a mime type. This enables a fairly good determination of whether a file is not text.

⚠️ This is off by default.

To enable, include:

```yaml
      with:
        use_magic_file: 1
```

This will be available in [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21)

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
