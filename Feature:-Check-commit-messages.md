# Check commit messages

Commit messages are often converted into changelogs which are often then committed back into repositories.

If a repository has enabled incremental checking, then it wouldn't be terribly hard to check commit messages on PRs (or non-default branches).

This would be _optional_, and I **don't expect** it to be on by default (although I may enable it in spell-check-this's workflow).

It's somewhat similar to [Feature: Check filenames and paths](./Feature:-Check-filenames-and-paths).

## Status

- 🐛 Flaky in [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21).
- 💅 Improved for [v0.0.26](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.26).

See [Future work](#future-work) for thoughts on how to improve the implementation.

If you choose to use this feature today, you should either use [`only_check_changed_files`](./Configuration#onlycheckchangedfiles) or include text in [`advice.md`](./Configuration#advice) suggesting that commit message / PR items be added to [`allow.txt`](./Configuration#allow) instead of [`expect.txt`](./Configuration#expect).

## Implemented modes

- latest commit
- commits since last push / pr base
- PR description
- PR summary

ℹ️ Note: While PR description and PR summary aren't technically commit messages, there are a number of `commit` strategies (especially `Squash`) that will end up integrating them into a future commit, and thus it makes sense to offer to check them as well.

## Improve commit retrieval performance

Implemented in [v0.0.23](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.23)
Previously check-spelling asked [actions/checkout](https://github.com/actions/checkout/) to retrieve the full commit history.

That's pretty inefficient, because for this feature, it doesn't need anything beyond the commit messages.

Switched to clone mode `--filter=tree:0` which should allow for a much faster retrieval (on large repositories).
It's described in [Get up to speed with partial clone and shallow clone](https://github.blog/open-source/git/get-up-to-speed-with-partial-clone-and-shallow-clone/).

## Improve reporting

Tentatively for [v0.0.26](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.26).

While unrecognized words in commit messages and pull requests are typos, treating exactly the same as unrecognized words in code doesn't quite work. Since `expect.txt` is processed against what is included in the codebase, items that would _transiently_ be seen in commit messages / pull requests really don't fit there.

As of [v0.0.26](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.26), such words will:
* be listed in details by their own distinct events###  ([`unrecognized-spelling-commit-message`](Event-descriptions#unrecognized-spelling-commit-message) / [`unrecognized-spelling-pr-description`](Event-descriptions#unrecognized-spelling-pr-description) / [`unrecognized-spelling-pr-title`](Event-descriptions#unrecognized-spelling-pr-title)
* not be suggested as additions to `expect.txt`
* not be reported in the list of unrecognized words

# Future Work

Split the check pass for these objects from the main pass. In order to handle them, items really need to be added to `allow.txt`, otherwise a commit that adds a term to `expect.txt` to accept a commit message will then force the next PRs to remove the newly inserted `expect.txt` items.

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
- commits since a specific sha or branch - This might be necessary in order to support adding items to [`expect.txt`](./Configuration#expect), although I'm convinced it makes more sense to use [`allow.txt`](./Configuration#allow) or [`patterns.txt`](./Configuration#patterns).


---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
