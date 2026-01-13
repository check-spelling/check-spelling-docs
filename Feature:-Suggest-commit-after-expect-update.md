# Suggest commit after expect update

Included in [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20)

## Currently the flow is

1. User creates a PR.
2. This triggers a workflow which could add a ❌ status.
3. User uses [Update expect list](./Feature:-Update-expect-list) which triggers an additional commit.
4. This doesn't trigger a new workflow run because [GitHub doesn't want to risk triggering a loop](https://docs.github.com/en/actions/reference/authentication-in-a-workflow#using-the-github_token-in-a-workflow).

Thus, at this point it's likely that spell check would pass "now", but doesn't currently have a ✅ status.

## Problem

At this point, the check has most recently ❌ failed, and there's a new commit without checks.

If your repository has a mandatory check for this action, it would refuse to merge.

## Workaround

Users can just edit the `expect` file and add a blank line.

## Plan

The action will add a comment suggesting adding that blank line to trigger a new check pass (until a better approach is added).

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
