# Only files changed in a commit / series

Included in [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20)

Originally, this action would scan the entire repository (or at least everything that isn't covered by `excludes` / skipped per `only`).

Some repositories may take ~20-40 (or even 60-180) minutes to scan. As GitHub bills by the minute, and this action is mostly interested in preventing users from adding new typos, it is useful to only scan files changed recently (or even only the hunks that were changed recently).

## Check changed files

First working implementation: [a0d13938e0ff519c1ebfd23284e8d19780bd8811](https://github.com/check-spelling/check-spelling/commit/a0d13938e0ff519c1ebfd23284e8d19780bd8811)

There are two modes:

- `push` - changes are according to the changes that GitHub suggests in the `compare` field, for a force-push this may be between a commit and a replaced commit. This may be a single commit, or a series.
- `pull_request_target` (or `pull_request`, although this isn't recommended) - the base of the pull request merge is checked. \*If you don't configure the workflow to checkout a merge commit, the behavior is unspecified.

### Enable

```yaml
  with:
    only_check_changed_files: 1
```

### Incompatible with

- [Concurrency](./Feature:-Concurrency.md) -> `cancel-in-progress`

## Future Work

### Recognizing expect misses

It could look at the _removed_ side of diffs and use that to keep a list of items from `expect` -- anything that it doesn't find in the _added_ side could be treated as suspect.

It could then do one round of checking the unchecked files (or all files if the initial check pass is only on the _added_ line hunks and not the entirety of the changed files) for just the that subset of `expect`. I think that should be faster than the full parse path, but I'd definitely make it an optional thing, and I'd probably implement it later.

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
