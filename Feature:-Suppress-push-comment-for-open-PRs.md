# Suppress push comment for open PRs

Included in [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20)

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

As this is a new feature, and it's possible it has bugs, it is currently opt-in.

```yaml
with:
  suppress_push_for_open_pull_request: 1
```

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
