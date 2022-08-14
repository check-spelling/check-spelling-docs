# Disable word collating

Historically, the core for check-spelling assumed that it was useful to group related words together. Doing so could reduce the size of an `expect.txt` file, but it does lead to confusing behaviors when a root word comes/goes leaving only a plural form, or similarly, when one case of a word comes/goes while another remains.

If you're finding this behavior too confusing, or just want all forms to be listed individually, you can add:

```workflow
with:
  disable_checks: word-collating
```
to your configuration.

## Sample consumers

[cspell compact-dictionaries workflow](https://github.com/check-spelling/cspell-dicts/commit/2a5b8bb057f4580749933060b29c466e92c93400#diff-f38bd48888fa3290eb90897dc1e21411b2bcf12a6538cd72bb583e7608787698R88)
