# Smaller cspell dictionaries

The cspell dictionaries that check-spelling can borrow aren't designed for cspell and just contain tokens that have been harvested by [streetsidesoftware/cspell-dicts](https://github.com/streetsidesoftware/cspell-dicts).

As check-spelling only wants words and not CamelCased tokens, any entry that has 🐫 or that has punctuation will be ignored, and thus is a waste of bandwidth and processing time. It hasn't really mattered a lot so far, but it turned out to be low-hanging fruit.

If you want to continue using your v0.0.20 configured cspell items, you can add this line to your workflow anywhere you have a reference to `cspell:`:

```yaml
with:
  dictionary_source_prefixes: '{"cspell": "https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220427/dictionaries/"}'
```

## Migrating

Old|New
-|-
`cspell:companies/companies.txt` | `cspell:companies/src/companies.txt`
`cspell:python/python.txt` | `cspell:python/src/python/python.txt` + `cspell:python/src/python/python-lib.txt` _probably_

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
