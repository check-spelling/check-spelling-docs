# File line column notation

Through v0.0.20, file / line / column references were in human text

As of v0.0.21, the notation will be something like: `.github/workflows/spelling.yml:54:9 ... 21`

filename:line-number:initial-offset ... end-offset.

This should be friendlier to tools like `vi` or `VSCode`.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
