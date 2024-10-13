# `base-path`

Currently check-spelling has an `experimental_path`. It should be converted to a more formal `base-path` to be used to mean something like _use this as the working directory for things to check_ without impacting the source for `config`.

Tentatively, all paths in `excludes` and `only` would be relative to `base-path`.

## Requested

https://github.com/ceph/ceph/pull/46824#issuecomment-1523640048

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
