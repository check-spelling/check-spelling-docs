# `forbidden` Examples

# Forbidden patterns

Since the spell checker has to run against all lines, there was a request to be able to reject a pattern, even though it is technically composed of valid words.

The canonical example was [m_data](https://github.com/nasa/fprime/discussions/855#discussion-3469739).

But there are definitely other examples, e.g., of a deprecated API.

## Sample consumers

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
