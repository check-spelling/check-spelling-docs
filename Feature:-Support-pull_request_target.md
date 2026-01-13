# Support `pull_request_target`

## Background

[pull_request](https://docs.github.com/en/free-pro-team@latest/actions/reference/events-that-trigger-workflows#pull_request) gets a readonly `GITHUB_TOKEN` when a pull request is opened by a user from another repository who doesn't have write permissions to the destination repository. Because it's readonly, the action can't even _comment_ on the PR. This makes using a code-review action pretty painful.

To work around that restriction, this action used [`schedule`](https://docs.github.com/en/free-pro-team@latest/actions/reference/events-that-trigger-workflows#schedule) instead.

## pull_request_target

GitHub introduced [`pull_request_target`](https://docs.github.com/en/free-pro-team@latest/actions/reference/events-that-trigger-workflows#pull_request_target) as an improvement over [`pull_request`](https://docs.github.com/en/free-pro-team@latest/actions/reference/events-that-trigger-workflows#pull_request).

For this action, the key value is:

> This event allows you to do things like create workflows that label and comment on pull requests based on the contents of the event payload.

## Implementation

Implementing this shouldn't be particularly hard.

The entry-point needs to support the event, and then it's just a couple of changes to the workflow yaml:

```yaml
on:
  pull_request_target:
```

```yaml
    - uses: actions/checkout@v2
      with:
        ref: ${% raw %}{{{% endraw %} github.event.pull_request.head.sha }}
```

## Security considerations

I believe anyone using `schedule` today would be just as vulnerable as someone using `pull_request_target` once it's supported.

In general, from GitHub's perspective, there is a risk to this feature:

- https://securitylab.github.com/research/github-actions-preventing-pwn-requests

I don't believe that check-spelling is insecure (that's what everyone says, right?), although it'd be great if someone were to confirm. It does use shell and Perl which are a pair of languages which certainly don't have a great reputation in this area.

## Feature schedule

Released in [0.0.17-alpha](https://github.com/check-spelling/check-spelling/releases/tag/0.0.17-alpha).

[Breaking change: Dropping support for on: schedule](./Breaking-change:-Dropping-support-for-on:-schedule) should occur after
[v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22).

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
