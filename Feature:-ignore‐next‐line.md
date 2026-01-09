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


