# Suppress PR check when workflow changes

## Background

Normally in a repository, it makes sense to skip running CI on a push if there's an open PR for the same source branch (see [`suppress_push_for_open_pull_request`](Configuration#suppresspushforopenpullrequest)) -- otherwise one can get two slightly conflicting reports and in general the reports from the PR side are more accurate wrt what a user should do.

If the workflow itself changes and the PR would rely on `pull_request_target`, then the validity of the PR check is void.

## Simple workaround

Using `suppress_push_for_open_pull_request: ${% raw %}{{{% endraw %} github.actor != 'dependabot[bot]' && 1 }}` as in https://github.com/check-spelling/spell-check-this/commit/f9705e2732464173a9bbf92dadd978c75460c41a will result in new branches created by dependabot being checked which is a good start.

A smarter implementation would be for the engine itself to check to see if the workflow file has changed in the `push` handler and then ignore `suppress_push_for_open_pull_request`.

## See Also

Note that the above doesn't actually solve problems for PRs from forks, that will need to be addressed by [Tolerate engine upgrades](./Feature:-Tolerate-engine-upgrades)

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
