# Breaking change: Dropping support for `on: schedule`

## History

The original workaround for not having permissions for pull requests from forks was to use the [`schedule` event](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows#schedule).

That was supplanted with the introduction of support for [pull_request_target](./Feature:-Support-pull_request_target).

There was other contemplated work [Limit schedule branches](./Feature:-Limit-schedule-branches) for the feature, but `pull_request_target` has proven to be considerably cleaner than `schedule` and at this point, `schedule` is mostly abandoned.

## Plan

### [v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22)

Deprecates `schedule`.

It will include a warning linking to this item.

### [v0.0.25](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.25)

Drops support for `schedule`.

## Migration

In most cases you should be able to refresh your workflow using https://raw.githubusercontent.com/check-spelling/spell-check-this/main/.github/workflows/spelling.yml adopting a standard [`on: pull_request_target`](./Feature:-Support-pull_request_target).

## Feedback

If you're actually using `schedule`, please [check for an issue](https://github.com/check-spelling/check-spelling/issues?q=is%3Aissue+is%3Aopen+schedule+event+created%3A%3E%3D2023-04-01). If there is one, please add your use case to it, if there isn't one, please open an issue and explain why you're using `schedule` instead of `push`/`pull_request`/`pull_request_target`.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
