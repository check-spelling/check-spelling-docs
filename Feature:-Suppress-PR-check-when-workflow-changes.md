# Suppress PR check when workflow changes

## Background

Normally in a repository, it makes sense to skip running CI on a push if there's an open PR for the same source branch.

If the workflow itself changes and it would rely on pull_request_target, then the validity of the PR check is void.

## See Also

[[Tolerate engine upgrades|Feature: Tolerate engine upgrades]]

