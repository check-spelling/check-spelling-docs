# Restricted Permissions

Included in [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20)

GitHub introduced [permissions for GITHUB_TOKEN](https://github.blog/changelog/2021-04-20-github-actions-control-permissions-for-github_token/) which enables one to restrict tokens to just the necessary permissions.

check-spelling has a couple of distinct phases that have differing requirements.

It's better from a security perspective to use "least privilege".

## Requirements by phase

### checking

- `contents: read` -- to read the repository (to check it out) -- for a `pull_request_target`, this may include untrusted content (the merge)
- `pull-requests: read` -- to determine if this `push` event should be skipped in favor of a related `pull_request_target` event.

### commenting

- `contents: write` -- if it's commenting on a commit (i.e. `on: push`)
- `pull-requests: write` -- if it's commenting on a PR (i.e. `on: pull_request_target`)

### updating branches

- `contents: write` -- to write new commits
- `pull-requests: write` -- to collapse existing comments and write a new comment

## Workflow

- https://github.com/check-spelling/spell-check-this/blob/main/.github/workflows/spelling.yml defines a workflow that is compatible with these requirements
