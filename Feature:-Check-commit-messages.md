# Check commit messages

Commit messages are often converted into changelogs which are often then committed back into repositories.

If a repository has enabled incremental checking, then it wouldn't be terribly hard to check commit messages on PRs (or non-default branches).

This would be _optional_, and I **don't expect** it to be on by default (although I may enable it in spell-check-this's workflow).

It's somewhat similar to [Feature: Check filenames and paths](./Feature:-Check-filenames-and-paths.md).

## Status

🐛 Flaky in [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21).

See [Future work](#future-work) for thoughts on how to improve the implementation.

If you choose to use this feature today, you should either use [`only_check_changed_files`](./Configuration.md#onlycheckchangedfiles) or include text in [`advice.md`](./Configuration.md#advice) suggesting that commit message / PR items be added to [`allow.txt`](./Configuration.md#allow) instead of [`expect.txt`](./Configuration.md#expect).

## Implemented modes

- latest commit
- commits since last push / pr base
- PR description
- PR summary

ℹ️ Note: While PR description and PR summary aren't technically commit messages, there are a number of `commit` strategies (especially `Squash`) that will end up integrating them into a future commit, and thus it makes sense to offer to check them as well.

# Future work

Split the check pass for these objects from the main pass. In order to handle them, items really need to be added to `allow.txt`, otherwise a commit that adds a term to `expect.txt` to accept a commit message will then force the next PRs to remove the newly inserted `expect.txt` items.

## Improve commit retrieval performance

Currently check-spelling asks [actions/checkout](https://github.com/actions/checkout/) to retrieve the full commit history.

That's pretty inefficient, because for this feature, it doesn't need anything beyond the commit messages.
There's a clone mode `--filter=tree:0` which should allow for a much faster retrieval (on large repositories).
It's described in [Get up to speed with partial clone and shallow clone](https://github.blog/open-source/git/get-up-to-speed-with-partial-clone-and-shallow-clone/).

## Presentation

### Lazy hackish implementation

1. Create a branch w/ the selected items as files
2. push it
3. let check spelling run normally

### GitHub Step Summary

Use [`$GITHUB_STEP_SUMMARY`](https://github.blog/2022-05-09-supercharging-github-actions-with-job-summaries/)

- Possibly show the git commands to see the individual commit message, e.g.
  - `git show [SHA]`
  - curl api to get the pr description

## Potential additional modes

- n commits - This is trivial to implement, but without a use case, I don't intend to implement it
- commits since a specific sha or branch - This might be necessary in order to support adding items to [`expect.txt`](./Configuration.md#expect), although I'm convinced it makes more sense to use [`allow.txt`](./Configuration.md#allow) or [`patterns.txt`](./Configuration.md#patterns).

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
