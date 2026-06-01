# Matrix support

Included in [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20)

In order to make the clock time for spell checking large repositories tolerable, you can use a matrix.

⚠️ You shouldn't need to use this as of the release after 0.0.19, as it should run much faster on its own.

## Flags

You almost certainly want `fail-fast: false`, otherwise the first matrix branch to find an unrecognized word will kill all the others, and thus people would have to fix each thing to discover the next, instead of being told about all unrecognized words at once:

```yaml
    strategy:
      fail-fast: false
```

`report_title_suffix` is used to enable readers to distinguish between comments for different matrix items (if multiple trigger comments). It's also used by `experimental_apply_changes_via_bot` to determine which comment handler should handle the event.

```yaml
      with:
        report_title_suffix: (${% raw %}{{{% endraw %}matrix.category}})
```

## Example

```workflow
name: Spell checking
on:
  pull_request_target:
  push:
  issue_comment:

jobs:
  spelling:
    runs-on: ubuntu-latest
    strategy:
      fail-fast: false
      matrix:
        category: ["other", "runtime", "test"]
    name: Spell checking (${% raw %}{{{% endraw %}matrix.category}})
    steps:
    - name: checkout-merge
      if: "contains(github.event_name, 'pull_request')"
      uses: actions/checkout@v2.0.0
      with:
        ref: refs/pull/${% raw %}{{{% endraw %}github.event.pull_request.number}}/merge
    - name: checkout
      if: ${% raw %}{{{% endraw %} github.event_name == 'push' ||
        (contains(github.event.comment.body, '@check-spelling-bot apply') &&
          contains(github.event.comment.body, matrix.category)
        ) }}
      uses: actions/checkout@v2.0.0
    - uses: check-spelling/check-spelling@prerelease
      id: spelling
      if: ${% raw %}{{{% endraw %} github.event_name != 'issue_comment' ||
              (contains(github.event.comment.body, '@check-spelling-bot apply') &&
                contains(github.event.comment.body, matrix.category)
              ) }}
      with:
        config: .github/actions/spelling-${% raw %}{{{% endraw %}matrix.category}}
        experimental_apply_changes_via_bot: 1
        suppress_push_for_open_pull_request: 1
        report_title_suffix: (${% raw %}{{{% endraw %}matrix.category}})
```

### See also

- [Configuration: Multiple programming languages](./Configuration:-Multiple-programming-languages)

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
