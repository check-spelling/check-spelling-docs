# Support `pull_request_target`

## Background

[pull_request](https://docs.github.com/en/free-pro-team@latest/actions/reference/events-that-trigger-workflows#pull_request) gets a readonly `GITHUB_TOKEN` when a pull request is opened by a user from another repository who doesn't have write permissions to the destination repository. Because it's readonly, the action can't even _comment_ on the PR. This makes using a code-review action pretty painful.

To work around that restriction, this action uses [schedule](https://docs.github.com/en/free-pro-team@latest/actions/reference/events-that-trigger-workflows#schedule) instead.

## pull_request_target

GitHub introduced [pull_request_target](https://docs.github.com/en/free-pro-team@latest/actions/reference/events-that-trigger-workflows#pull_request_target) as an improvement over [pull_request](https://docs.github.com/en/free-pro-team@latest/actions/reference/events-that-trigger-workflows#pull_request).

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

* https://securitylab.github.com/research/github-actions-preventing-pwn-requests

I don't believe that check-spelling is insecure (that's what everyone says, right?), although it'd be great if someone were to confirm. It does use shell and Perl which are a pair of languages which certainly don't have a great reputation in this area.

## Feature schedule

Once I get this working, `schedule` can be deprecated. I expect this feature will be available as a prerelease for a version, and then schedule will be deprecated for at least one version before potentially being removed.

Released in [0.0.17-alpha](https://github.com/check-spelling/check-spelling/releases/tag/0.0.17-alpha.

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
