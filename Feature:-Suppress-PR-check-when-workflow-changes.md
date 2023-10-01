# Suppress PR check when workflow changes

## Background

Normally in a repository, it makes sense to skip running CI on a push if there's an open PR for the same source branch.

If the workflow itself changes and it would rely on `pull_request_target`, then the validity of the PR check is void.

## Simple workaround

Using `suppress_push_for_open_pull_request: ${{ github.actor != 'dependabot[bot]' && 1 }}` as in https://github.com/check-spelling/spell-check-this/commit/f9705e2732464173a9bbf92dadd978c75460c41a will result in new branches created by dependabot being checked which is a good start.

A smarter implementation would be for the engine itself to check to see if the workflow file has changed in the `push` handler and then ignore `suppress_push_for_open_pull_request`.

## See Also

[[Tolerate engine upgrades|Feature: Tolerate engine upgrades]]
