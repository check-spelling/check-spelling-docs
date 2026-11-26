Upcoming changes will result in [pull_request_target blocked by default December 2, 2026](https://github.blog/changelog/2026-11-02-pull_request_target-blocked-by-default-december-2/).

## Temporary workaround

1. Visit https://github.com/organizations/:org-name/settings/actions/rules
2. Click `New policy`
3. Click `Import ruleset`
   Upload the following ruleset (you can adjust it to match your repository layout):

    <details><summary>`check-spelling-ruleset.json`</summary>

    ```json
    {
      "name": "allow check-spelling to work",
      "target": "actions",
      "source_type": "Organization",
      "enforcement": "active",
      "conditions": {
        "repository_name": {
          "exclude": [],
          "include": [
            "~ALL"
          ]
        },
        "workflow_path": {
          "exclude": [],
          "include": [
            ".github/workflows/spelling*.yml"
          ]
        }
      },
      "rules": [
        {
          "type": "restrict_action_events",
          "parameters": {
            "allowed_events": [
              "issue_comment",
              "pull_request",
              "pull_request_target",
              "push",
              "workflow_run"
            ]
          }
        }
      ],
      "bypass_actors": []
    }
    ```

    </details>

## Future

check-spelling prerelease includes support for a [split workflow](https://github.com/check-spelling/spell-check-this/tree/f7e8a481363df94f15c0bdf2d4da385e4ad4b0a7/.github/workflows):

- [`spelling.yml`](https://github.com/check-spelling/spell-check-this/blob/f7e8a481363df94f15c0bdf2d4da385e4ad4b0a7/.github/workflows/spelling.yml) -- readonly permissions:

    ```yaml
    permissions:
      contents: read
      pull-requests: read
      actions: read
    ```

- [`spelling-comment.yml`](https://github.com/check-spelling/spell-check-this/blob/f7e8a481363df94f15c0bdf2d4da385e4ad4b0a7/.github/workflows/spelling-comment.yml) (the name will be changed) -- write permissions:

  ```yaml
  comment-pr:
    name: Comment (PR)
    runs-on: ubuntu-slim
    permissions:
      actions: read
      pull-requests: write
      security-events: write
  ```

  If you aren't using the `push` comment block, you'd remove that from the workflow.

A [v0.0.27 release](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.27) should come by Sunday, November 29, 2026.
