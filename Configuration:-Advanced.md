# Configuration: Advanced

| Variable | Description |
| ------------- | ------------- |
| VERBOSE | `1` if you want to be reminded of how many words are in your expect list for each run. |
| [bucket](#bucket) | file/url for which the tool has read access to a couple of files. |
| [project](#project) | a folder within `bucket`. This allows you to share common items across projects. |
| [GITHUB_TOKEN](#GITHUB_TOKEN) | Secret used to retrieve your code and comment on PRs/commits. |
| [timeframe](#timeframe) | number of minutes (default 60) to consider when a **schedule** workflow checks for updated PRs. |

## bucket

* unset - especially initially...
* `./path` - a local directory
* `ssh://git@*`, `git@*` - git urls (if the url isn't for github, you'll need to have set up credentials)
* `https://` (or `http://`) - curl compatible
* `gs://` - gsutil url

## project

* unset - especially initially
* branch - for git urls
* `./` - if you don't need an extra nesting layer
* directory - especially for sharing a general bucket across multiple projects

## GITHUB_TOKEN

GitHub Actions get an automatic token which allows for read operations.
If the Action is a [pull_request](#pull_request) and the originating repository isn't trusted, then the automatic token will not have write permission, which means it won't be able to post a comment to the PR.

There are three ways to address this:
* Use [pull_request_target](./Configuration:-Workflows#pull_request_target) recommended as of 0.0.17-alpha
* Create a custom Personal Access Token with `repo read` + `comment`
* Use [schedule](./Configuration:-Workflows#schedule) instead

## timeframe

Used by the **[schedule](./Configuration:-Workflows#schedule)** action. Any open pull requests from another repository
will be checked, and if the commit is within that timeframe, it will be processed.
