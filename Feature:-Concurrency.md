# Concurrency

## Background
Added in April 2021, [GitHub Actions: Limit workflow run or job concurrency](https://github.blog/changelog/2021-04-19-github-actions-limit-workflow-run-or-job-concurrency/).

You're welcome to use this however you choose. Note that at the time this page was written, the [feature](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#concurrency) was in beta.

## Recommended implementation

If you aren't using [[Only changes|Feature: Only changes]], you probably want to use `cancel-in-progress: true` for the main spell check job.

For [[Update expect list|Feature: Update expect list]], my recommended flow is to let both run but use concurrency to serialize the updates. I'm not sure if this is the right answer in general, and I don't know if this is the right answer for your project. I'm welcome implementation experience.