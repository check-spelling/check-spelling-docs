# Set event severity

## Background

check-spelling has a number of errors, warnings, and notices.

It's understood that not every user will agree with which items should be errors and which warnings.

Note that severities of events may be adjusted from release to release and the behavior of adding the same event name to multiple lists may change. As such, providing values for both `warnings` and `errors` should insulate you from such shifts. Please don't include the same event in multiple lists (`errors`, `warnings`, `notices`, `ignored`).

## Implementation

As of [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20),
you can specify which [events](Event-descriptions.md) should be treated as warnings using the `warnings` parameter.

As of [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21),
you can specify which [events](Event-descriptions.md) should be treated as notices using the `notices` parameter.

For versions [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20), [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21), and [v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22), see [Treat specific errors as warnings](./Feature:-Treat-specific-errors-as-warnings.md) for information on how the `warnings` and `notices` lists impact which events are treated as `errors`.

As of [v0.0.23](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.23),
you can specify which [events](Event-descriptions.md) should be treated as errors using the `errors` parameter.

As of [v0.0.23](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.23),
you can specify which [events](Event-descriptions.md) should be ignored using the `ignored` parameter.

## Default settings

Check the `action.yml` file in the version you're using to see its defaults.
Alternatively, you can check the workflow run to see the value used.
At the time of this note ([v0.0.23](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.23)),
the [settings](https://github.com/jsoref/check-spelling/blob/15ec25d13551ca9fe99c6658f1ea5a21e8e3cce0/action.yml#L208-L223) had:

```yaml
  errors:
    description: "List of events to treat as errors"
    required: false
    default: ""
  warnings:
    description: "List of events to treat as warnings"
    required: false
    default: bad-regex,binary-file,deprecated-feature,large-file,limited-references,no-newline-at-eof,noisy-file,non-alpha-in-dictionary,token-is-substring,unexpected-line-ending,whitespace-in-dictionary,minified-file,unsupported-configuration,unclosed-block-ignore-begin,unclosed-block-ignore-end
  notices:
    description: "List of events to treat as notices"
    required: false
    default: candidate-pattern
  ignored:
    description: "List of events to ignore"
    required: false
    default: ""
```

If you wanted to ignore `unrecognized-spelling` and treat `deprecated-feature` as an error, you could remove both from `warnings:`, and add `ignored: unrecognized-spelling` and `errors: deprecated-feature`:

```yaml
with:
  ignored: unrecognized-spelling
  warnings: bad-regex,binary-file,large-file,limited-references,no-newline-at-eof,noisy-file,non-alpha-in-dictionary,unexpected-line-ending,whitespace-in-dictionary,minified-file,unsupported-configuration
  errors: deprecated-feature
```

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
