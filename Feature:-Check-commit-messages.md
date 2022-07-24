# Check commit messages

Commit messages are often converted into changelogs which are often then committed back into repositories.

If a repository has enabled incremental checking, then it wouldn't be terribly hard to check commit messages on PRs (or non-default branches).

This would be *optional*, and I **don't expect** it to be on by default (although I may enable it in spell-check-this's workflow).

It's somewhat similar to [[Feature: Check filenames and paths]].

## Implemented modes

* latest commit
* commits since last push / pr base
* PR description
* PR summary

Note: while PR description and PR summary aren't technically commit messages, there are a number of `commit` strategies (especially `Squash`) that will end up integrating them into a future commit, and thus it makes sense to offer to check them as well.

# Future work

## Presentation

### Lazy hackish implementation

1. Create a branch w/ the selected items as files
2. push it
3. let check spelling run normally

### GitHub Step Summary

Use [`$GITHUB_STEP_SUMMARY`](https://github.blog/2022-05-09-supercharging-github-actions-with-job-summaries/)

* Possibly show the git commands to see the individual commit message, e.g.
  - `git show [SHA]`
  - curl api to get the pr description

## Potential additional modes
* n commits - This is trivial to implement, but without a use case, I don't intend to implement it
