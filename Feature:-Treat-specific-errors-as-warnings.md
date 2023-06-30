# Treat specific errors as warnings

## Background
check-spelling has a number of errors and warnings.

It's understood that not every user will agree with which items should be errors and which warnings

## Implementation

As of [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20),
you can specify which [events](Event-descriptions.md) should be treated as warnings.

## Default settings

Check the `action.yml` file in the version you're using to see its defaults.
Alternatively, you can check the workflow run to see the value used.
At the time of this note ([v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21)),
the [setting](https://raw.githubusercontent.com/check-spelling/check-spelling/d7cd2973c513e84354f9d6cf50a6417a628a78ce/action.yml#L210-L213) had:

```yaml
  warnings:
    description: 'List of events that are warnings (items that are neither warnings nor notices will result in an :x:)'
    required: false
    default: bad-regex,binary-file,deprecated-feature,large-file,limited-references,no-newline-at-eof,noisy-file,non-alpha-in-dictionary,unexpected-line-ending,whitespace-in-dictionary,minified-file,unsupported-configuration
```

If you wanted to treat `unrecognized-spelling` as a warning and `deprecated-feature` as an error, you could add `unrecognized-spelling` and remove `deprecated-feature`:

```yaml
with:
  warnings: unrecognized-spelling,bad-regex,binary-file,large-file,limited-references,no-newline-at-eof,noisy-file,non-alpha-in-dictionary,unexpected-line-ending,whitespace-in-dictionary,minified-file,unsupported-configuration
```

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
