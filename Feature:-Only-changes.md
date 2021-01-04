# Only files changed in a commit / series

Currently this action scans the entire repository (or at least everything that isn't covered by `excludes` / skipped by `only`).

Some repositories may take ~20 (or even 60) minutes to scan. As GitHub bills by the minute, and this action is mostly interested in preventing users from adding new typos, it could be useful to only scan files changed recently (or even only the hunks that were changed recently).

## Recognizing expect misses

It could look at the _removed_ side of diffs and use that to keep a list of items from `expect` -- anything that it doesn't find in the _added_ side could be treated as suspect.

It could then do one round of checking the unchecked files (or all files if the initial check pass is only on the _added_ line hunks and not the entirety of the changed files) for just the that subset of `expect`. I think that should be faster than the full parse path, but I'd definitely make it an optional thing, and I'd probably implement it later.