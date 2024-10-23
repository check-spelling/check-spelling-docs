# Minified file detection

At present, the algorithm compares the number of lines to the number of bytes in the file, if the average exceeds 1000, it will complain.

For a UTF-32 file, that only allows for 250 characters per line, but even that seems fairly long. -- Note that I don't expect check-spelling to be able to check a UTF-32 file in the first place, so if it runs across one, this heuristic would probably be good.

### Masked content will be excluded from accounting

In [v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22), runs of text that are masked by `patterns.txt` will not be counted in the bytes for the lines.

https://github.com/check-spelling/check-spelling/issues/53

### opt out

To disable, add `minified-file` to `disable_checks`, and please file a bug with a sample where you think it makes sense to check the file.

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
