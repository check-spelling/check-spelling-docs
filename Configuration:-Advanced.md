# Configuration: Advanced

| Variable | Description |
| ------------- | ------------- |
| VERBOSE | `1` if you want to be reminded of how many words are in your expect list for each run. |
| debug | If set, will print more debug messages in the job logs |
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

## timeframe

Used by the **[schedule](./Configuration:-Workflows#schedule)** action. Any open pull requests from another repository
will be checked, and if the commit is within that timeframe, it will be processed.
