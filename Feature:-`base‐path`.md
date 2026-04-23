# `base-path`

Currently check-spelling has an `experimental_path`. It should be converted to a more formal `base-path` to be used to mean something like _use this as the working directory for things to check_ without impacting the source for `config`.

Tentatively, all paths in `excludes` and `only` would be relative to `base-path`.

## Requested

https://github.com/ceph/ceph/pull/46824#issuecomment-1523640048

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
