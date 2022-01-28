# `forbidden` Examples

```
# reject `m_data`
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

* [[Forbidden patterns|Feature: Forbidden patterns]]
* [[Configuration Examples: patterns]]

## Notes

* `forbidden` operate on a per line basis
* there is no support for multiline patterns, see [[Feature: Block Ignore]] for my current thoughts
