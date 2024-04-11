# Duplicate word detection

Included in [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20)

The classic example is `the the quick`

## Proposal

This is possible using [Forbidden patterns](./Feature:-Forbidden-patterns.md):

`line_objections.patterns`:

```
/\b([A-Za-z](?:[A-Z]{2,}|[a-z]{2,})\s+\g{-1}\b/
```

### Cons

I fully expect this to have a significant performance penalty (and it has to be done fairly early, before any other parsing...)

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
