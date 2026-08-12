# Set event severity

## Background

check-spelling has a number of errors, warnings, and notices.

It's understood that not every user will agree with which items should be errors and which warnings.

Note that severities of events may be adjusted from release to release and the behavior of adding the same event name to multiple lists may change. As such, providing values for both `warnings` and `errors` should insulate you from such shifts. Please don't include the same event in multiple lists (`errors`, `warnings`, `notices`, `ignored`).

## Implementation

As of [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20),
you can specify which [events](Event-descriptions) should be treated as warnings using the `warnings` parameter.

As of [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21),
you can specify which [events](Event-descriptions) should be treated as notices using the `notices` parameter.

For versions [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20), [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21), and [v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22), see [Treat specific errors as warnings](./Feature:-Treat-specific-errors-as-warnings) for information on how the `warnings` and `notices` lists impact which events are treated as `errors`.

As of [v0.0.23](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.23),
you can specify which [events](Event-descriptions) should be treated as errors using the `errors` parameter.

As of [v0.0.23](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.23),
you can specify which [events](Event-descriptions) should be ignored using the `ignored` parameter.

## Default settings

Check the `action.yml` file in the version you're using to see its defaults.
Alternatively, you can check the workflow run to see the value used.
At the time of this note ([v0.0.23](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.23)),
the [settings](https://github.com/check-spelling/check-spelling/blob/v0.0.23/action.yml#L208-L223) had:

```yaml
  errors:
    description: "List of events to treat as errors"
    required: false
    default: ""
  warnings:
    description: "List of events to treat as warnings"
    required: false
    default: bad-regex,binary-file,deprecated-feature,large-file,limited-references,no-newline-at-eof,noisy-file,non-alpha-in-dictionary,token-is-substring,unexpected-line-ending,whitespace-in-dictionary,minified-file,unsupported-configuration
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
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
