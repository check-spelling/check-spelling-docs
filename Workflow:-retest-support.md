For workflows that are PR based (involving testing the merge head instead of the pr head), it'd be nice to be able to trigger a `retest` of the latest merge.

This could be because:

- the workflow points to a floating version of check spelling and thus retesting could give different results
- the base branch has changed
- the workflow is configured using external dictionaries that have changed

Conceptually this can be done using something like:

```yaml
on:
  #...
  issue_comment:
    types: [created]
#...

jobs:
  spelling:
    if: ${% raw %}{{{% endraw %}
        contains(github.event_name, 'pull_request') ||
        github.event_name == 'push' ||
        github.event_name == 'issue_comment' &&
        github.event.issue.pull_request &&
        contains(github.event.comment.body, '@check-spelling-bot retest')
      }}
```

To do this, a bit more glue would be necessary to teach the action side to treat this comment as a pull_request event...

I'm not entirely sure how much plumbing would be necessary from the action's side, there's already an event aliases option which might help a bit to map the comment to the pull_request handling...

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
