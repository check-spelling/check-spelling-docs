# Only files changed in a commit / series

Currently this action scans the entire repository (or at least everything that isn't covered by `excludes`).

Some repositories may take ~20 minutes to scan. As GitHub bills by the minute, and this action is mostly interested in preventing users from adding new typos, it could be useful to only scan files changed recently (or even only the hunks that were changed recently).