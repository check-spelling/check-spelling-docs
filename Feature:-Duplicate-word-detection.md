# Duplicate word detection

The classic example is `the the quick`

## Proposal

This will be possible using [[Forbidden patterns|Feature: Forbidden patterns]]:

`line_objections.patterns`:
```
/\b([A-Za-z](?:[A-Z]{2,}|[a-z]{2,})\s+\g{-1}\b/
```

### Cons

I fully expect this to have a significant performance penalty (and it has to be done fairly early, before any other parsing...)