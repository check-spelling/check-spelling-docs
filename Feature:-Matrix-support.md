# Matrix support

In order to make the clock time for spell checking large repositories tolerable, you can use a matrix.

## Flags

You almost certainly want `fail-fast: false`, otherwise the first matrix branch to find an unrecognized word will kill all the others, and thus people would have to fix each thing to discover the next, instead of being told about all unrecognized words at once:
```yaml
    strategy:
      fail-fast: false
```

`report_title_suffix` is used to enable readers to distinguish between comments for different matrix items (if multiple trigger comments). It's also used by `experimental_apply_changes_via_bot` to determine which comment handler should handle the event.
```yaml
      with:
        report_title_suffix: (${{matrix.category}})
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
    name: Spell checking (${{matrix.category}})
    steps:
    - name: checkout-merge
      if: "contains(github.event_name, 'pull_request')"
      uses: actions/checkout@v2.0.0
      with:
        ref: refs/pull/${{github.event.pull_request.number}}/merge
    - name: checkout
      if: ${{ github.event_name == 'push' ||
        (contains(github.event.comment.body, '@check-spelling-bot apply') &&
          contains(github.event.comment.body, matrix.category)
        ) }}
      uses: actions/checkout@v2.0.0
    - uses: check-spelling/check-spelling@prerelease
      id: spelling
      if: ${{ github.event_name != 'issue_comment' ||
              (contains(github.event.comment.body, '@check-spelling-bot apply') &&
                contains(github.event.comment.body, matrix.category)
              ) }}
      with:
        config: .github/actions/spelling-${{matrix.category}}
        experimental_apply_changes_via_bot: 1
        suppress_push_for_open_pull_request: 1
        report_title_suffix: (${{matrix.category}})
```

### See also

* [[Configuration: Multiple languages]]