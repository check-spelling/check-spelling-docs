# ignore-next-line

Many spell checking tools have a magic token for skipping the next line.

## Implementation

An input (`ignore-next-line`) containing a whitespace delimited list of tokens.

### Workflow
```yaml:
with:
  ignore-next-line: |
    magic-token
    another-token
```

### Data

```html
Something else <!-- magic-token -->
"Cowabunga dudes."
```



---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
