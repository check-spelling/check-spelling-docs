# Concurrency

Documented for [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20) and included in the [recommended workflow](https://raw.githubusercontent.com/check-spelling/spell-check-this/main/.github/workflows/spelling.yml)

## Background

Added in April 2021, [GitHub Actions: Limit workflow run or job concurrency](https://github.blog/changelog/2021-04-19-github-actions-limit-workflow-run-or-job-concurrency/).

You're welcome to use this however you choose. Note that at the time this page was written, the [feature](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#concurrency) was in beta.

## Recommended implementation

If you aren't using [Only changes](./Feature:-Only-changes.md), you probably want to use `cancel-in-progress: true` for the main spell check job.

For [Update expect list](./Feature:-Update-expect-list.md), my recommended flow is to let both run but use concurrency to serialize the updates. I'm not sure if this is the right answer in general, and I don't know if this is the right answer for your project. I'm welcome implementation experience.

## Note

This "feature" doesn't involve any changes to the action itself, it's purely a function of the workflow.

You can see an implementation of it in [spell-check-this](https://github.com/check-spelling/spell-check-this/commit/0127a8b13e01b15ac458c362c1f03afecc818257).

When triggered, you'll get an event like this:

> Canceling since a higher priority waiting request for 'spelling-refs/heads/prerelease' exists

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
