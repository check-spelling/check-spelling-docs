## Overview

Deploy keys allow repositories can make pushes that trigger workflows, [unlike the `GITHUB_TOKEN`](https://docs.github.com/en/actions/security-guides/automatic-token-authentication#using-the-github_token-in-a-workflow).

The easiest way to set up a deploy key (or lots of them) is via scripting.

This is possible using the [`gh` cli](https://cli.github.com/).

## Script

Here's a script that you can run which will create an ssh key, add it as a deploy key to your repository (controlled by the `REPO` environment variable, or as automatically determined by the `gh` command):

`create-check-spelling-deploy-key.sh`:
```
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
     if: ${{
         github.event_name == 'issue_comment' &&
         github.event.issue.pull_request &&
         contains(github.event.comment.body, '@check-spelling-bot apply')
       }}
     concurrency:
       group: spelling-update-${{ github.event.issue.number }}
       cancel-in-progress: false
     steps:
     - name: checkout
       uses: actions/checkout@v2
+      with:
+        ssh-key: "${{ secrets.CHECK_SPELLING }}"
     - name: check-spelling
       uses: check-spelling/check-spelling@v0.0.20-alpha5
       with:
         experimental_apply_changes_via_bot: 1
```
