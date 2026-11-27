# Disable word collating

Generally, dictionaries only have one form of a word (possibly: lowercase, Uppercase, or ALL) ranging from the most general to the most specific. To work with this constraint, check-spelling performs at least a case fold after checking for a perfect hit in the dictionary (this doesn't actually cover the Uppercase form, but it hasn't generally been a big problem).

Beyond that, the core for check-spelling assumed that it was useful to group related words together (this included plurals, possessives, and verbs in the past tense). Doing so could reduce the size of an `expect.txt` file, but it does lead to confusing behaviors when a root word comes/goes leaving only a plural form, or similarly, when one case of a word comes/goes while another remains.

If you're finding this behavior too confusing, or just want all forms to be listed individually, you can add:

```workflow
with:
  disable_checks: word-collating
```

to your configuration.

## Warning

There are actually two places where check-spelling does folding:

- dictionary checks - for this, the disable feature retains case folding but drops folding of `'` and `/[sd]$/`.
- expected output checks - for this, the disable feature case folding as well as folding of `'` and `/[sd]$/`.

## Sample consumers

[cspell compact-dictionaries workflow](https://github.com/check-spelling/cspell-dicts/commit/2a5b8bb057f4580749933060b29c466e92c93400#diff-f38bd48888fa3290eb90897dc1e21411b2bcf12a6538cd72bb583e7608787698R88)

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
