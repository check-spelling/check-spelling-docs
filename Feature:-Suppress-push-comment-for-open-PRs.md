# Suppress push comment for open PRs

Introduced in [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20)

## Background

The design of check-spelling is such that if you push to a branch, you get instant feedback.

This is great, since it means you can fix otherwise embarrassing typos before you make a PR.

In order for a repository to reject additional typos, it needs to use `pull_request` or `pull_request_target`.
The latter is recommended for various reasons.

Unfortunately, if both are active, then one naturally receives duplicate comments.

## Solution

GitHub makes it possible to look for PRs associated with branches, so we check to see
if there's an open PR corresponding with the branch, if so, we cancel the `push`
check.

### Deployment

```yaml
with:
  suppress_push_for_open_pull_request: 1
```

### Rendering

You'll see something like:
#### ⏭️ Workflow skipped
See [`check-spelling pull_request_target` workflow (`.github/workflows/spelling.yml`)](https://github.com/check-spelling-sandbox/miniature-octo-spoon/actions/workflows/.github/workflows/spelling.yml?query=event:pull_request_target+branch:jsoref-patch-1) in PR [#1](https://github.com/check-spelling-sandbox/miniature-octo-spoon/pull/1).

https://github.com/check-spelling-sandbox/miniature-octo-spoon/pull/1/checks

---

The links should take you to the relevant pull request and enable you to reason through the checks.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
