# Breaking Change: Dropping support for `whitelist.txt` and `advice.txt`

As of [v0.0.25](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.25)

Old|New|Supported since
-|-|-
`whitelist.txt`|`expect.txt`|[0.0.16-alpha](https://github.com/check-spelling/check-spelling/releases/tag/0.0.16-alpha)
`advice.txt`|`advice.md`|[v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20)

## Migration

You can simply rename the files in your configuration directory. For `advice.md`, you can include Markdown.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
