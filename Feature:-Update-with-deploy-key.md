# Update with deploy key

Included in [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20)

## Overview

Deploy keys allow repository workflows to make pushes that trigger workflows, [unlike the `GITHUB_TOKEN`](https://docs.github.com/en/actions/security-guides/automatic-token-authentication#using-the-github_token-in-a-workflow):

> When you use the repository's `GITHUB_TOKEN` to perform tasks, events triggered by the `GITHUB_TOKEN` will not create a new workflow run. This prevents you from accidentally creating recursive workflow runs. For example, if a workflow run pushes code using the repository's `GITHUB_TOKEN`, a new workflow will not run even when the repository contains a workflow configured to run when push events occur.

The easiest way to set up a deploy key (or lots of them) is via scripting.

This is possible using the [`gh` cli](https://cli.github.com/).

## Script

This script will:

- create an ssh key,
- add it as a deploy key to your repository (controlled by the `REPO` environment variable, or as automatically determined by the `gh` command),
- add a corresponding secret.

`create-check-spelling-deploy-key.sh`:

```sh
#!/bin/sh
# create-check-spelling-deploy-key.sh
set -e
REPO=${REPO:-$(gh repo view --json 'nameWithOwner' -q .nameWithOwner)}
SECRET_NAME=${SECRET_NAME:-CHECK_SPELLING}
scratch=$(mktemp -d)
ssh-keygen -f "$scratch/check-spelling" -q -N "" -C "check-spelling key for $REPO"
gh repo deploy-key add "$scratch/check-spelling.pub" -R "$REPO" -w -t 'check-spelling-talk-to-bot'
cat "$scratch/check-spelling" | gh secret -R "$REPO" set "$SECRET_NAME"
rm -rf "$scratch"
```

## Steps

1. Run `create-check-spelling-deploy-key.sh` from the repository to which you want to add the key (or use `REPO=...` to specify it).
2. In the `update` job of the `.github/workflows/spelling.yml` workflow, add a reference to the secret created by the script:

```diff
   update:
     name: Update PR
     permissions:
       contents: write
       pull-requests: write
     runs-on: ubuntu-latest
     if: ${% raw %}{{{% endraw %}
         github.event_name == 'issue_comment' &&
         github.event.issue.pull_request &&
         contains(github.event.comment.body, '@check-spelling-bot apply')
       }}
     concurrency:
       group: spelling-update-${% raw %}{{{% endraw %} github.event.issue.number }}
       cancel-in-progress: false
     steps:
     - name: checkout
       uses: actions/checkout@v2
+      with:
+        ssh-key: "${% raw %}{{{% endraw %} secrets.CHECK_SPELLING }}"
     - name: check-spelling
       uses: check-spelling/check-spelling@main
       with:
         experimental_apply_changes_via_bot: 1
```

## Improvements in [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21)

The advice is now tailored to based on the workflow configuration.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
