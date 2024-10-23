# Workflow Permissions

## `contents: read`

Generally speaking, check-spelling needs to be able to check out the repository with the source code.

The normal way to do that is with:

### Permissions

```yaml
permissions:
  contents: read
```

### Steps

```yaml
- uses: actions/checkout@...
```

or

```yaml
- uses: check-spelling/check-spelling@...
  with:
    checkout: 1
```

## `pull-requests: read`

In order to stop early when configured with [`suppress_push_for_open_pull_request`](Configuration.md#suppresspushforopenpullrequest),
check-spelling needs to be able to check for pull requests.

### Permissions

```yaml
permissions:
  pull-requests: read
```

## `actions: read`

In order to retrieve artifacts with [post_comment](Configuration.md#postcomment), check-spelling will need `actions: read`.

The normal way to do that is with:

### Permissions

```yaml
permissions:
  actions: read
```

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
