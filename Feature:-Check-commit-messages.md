# Check commit messages

Commit messages are often converted into changelogs which are often then committed back into repositories.

If a repository has enabled incremental checking, then it wouldn't be terribly hard to check commit messages on PRs (or non-default branches).

This would be *optional*, and I **don't expect** it to be on by default.

It's somewhat similar to [[Feature: Check filenames and paths]].

## Potential modes

* latest commit
* n commits
* commits since last push / pr base
* PR description
* PR summary

Note: while PR description and PR summary aren't technically commit messages, there are a number of `commit` strategies (especially `Squash`) that will end up integrating them into a future commit, and thus it makes sense to offer to check them as well.

## Lazy hackish implementation

1. Create a branch w/ the selected items as files
2. push it
3. let check spelling run normally

## Presentation

* Possibly show the git commands to see the individual commit message, e.g.
  - `git show [SHA]`
  - curl api to get the pr description
* Possibly use GITHUB_STEP_SUMMARY
