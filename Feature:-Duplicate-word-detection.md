# Duplicate word detection

The classic example is `the the quick`

## Proposal

`/\b([A-Za-z](?:[A-Z]{2,}|[a-z]{2,})\s+\g{-1}\b/`

### Cons

I fully expect this to have a significant performance penalty (and it has to be done fairly early, before any other parsing...)