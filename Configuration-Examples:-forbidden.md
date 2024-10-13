# `forbidden` Examples

```
# reject `m_data`
# - vxworks defined it: https://github.com/qtproject/qt-solutions/blame/fb7bc42bfcc578ff3fa3b9ca21a41e96eb37c1c7/qtscriptclassic/src/qscriptbuffer_p.h#L46
\bm_data\b

# Javascript
\bJavascript\b

# MicroSoft

\bMicroSoft\b

# Duplicate words

# Reject duplicate words
\b(\w{3,})\s\g{-1}\b
```

## See also

- [Forbidden patterns](./Feature:-Forbidden-patterns.md)
- [Configuration Examples: patterns](./Configuration-Examples:-patterns.md)

## Notes

- `forbidden` operate on a per line basis
- there is no support for multiline patterns, see [Feature: Block Ignore](./Feature:-Block-Ignore.md) for my current thoughts

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
