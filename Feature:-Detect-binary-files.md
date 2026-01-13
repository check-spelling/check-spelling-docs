# Detect binary files

The [`file`](https://linux.die.net/man/1/file) utility relies on [`magic`](https://linux.die.net/man/5/magic) to identify a file's format.

It's possible to ask `file` to not use all its heuristics (which allow it to precisely identify a file) and merely provide a broad categorization -- returned as a mime type. This enables a fairly good determination of whether a file is not text.

It is available in [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21).

To enable, include:

```yaml
      with:
        use_magic_file: 1
```

It is on by default as of [v0.0.23](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.23).

To disable, include:

```yaml
      with:
        use_magic_file: 0
```

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
