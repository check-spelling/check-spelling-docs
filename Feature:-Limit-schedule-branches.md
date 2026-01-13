# Limit schedule branches

⚠️ This feature was contemplated but abandoned.

Support for `schedule` will be removed before `1.0.0`.

## Problem space

1. Users should be able to get spell checking feedback without creating a PR.
   - Solution: use `push` to trigger spell checking
1. If one uses both `push` and `pull_request`, then things run twice, which looks bad (and is fairly confusing)
   - Solution: [Suppress push for open pull request](Configuration#suppresspushforopenpullrequest)
1. If users create forks that don't enable actions, then the `push` trigger can easily not run.
   - This is a social problem. Once a user interacts with an upstream, they can be encouraged to enable workflows in their fork.

## Background

I added `schedule` which goes in and looks for PRs and potentially checks things, ideally it should be able to suppress itself if there's already a run. I think that logic may be missing.

If `schedule` finds a PR that doesn't have spell checking configured, it imports its own settings and uses them. This is fine if the baseline is fairly error free. It's pretty overwhelming/confusing when that isn't the case -- because most complaints are about the baseline and not the PR changes.

---

I think `schedule` can be suppressed by adding an `only.txt` file to a target branch.

If I retain `schedule`, I probably need to introduce a way to define branches to check/ignore.

I expect that before a 1.0.0 release I will remove support for `schedule`. I've resolved the interaction between `push` and `pull_request_target` using [Suppress push for open pull request](Configuration#suppresspushforopenpullrequest).

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
