# Configuration: Advanced

| Variable                | Description                                                                                     |
| ----------------------- | ----------------------------------------------------------------------------------------------- |
| VERBOSE                 | `1` if you want to be reminded of how many words are in your expect list for each run.          |
| debug                   | If set, will print more debug messages in the job logs                                          |
| [bucket](#bucket)       | file/url for which the tool has read access to a couple of files.                               |
| [project](#project)     | a folder within `bucket`. This allows you to share common items across projects.                |
| [timeframe](#timeframe) | number of minutes (default 60) to consider when a **schedule** workflow checks for updated PRs. |

ℹ️ These are additional items beyond the core items listed in [Configuration](Configuration.md).

## bucket

- unset - especially initially...
- `./path` - a local directory
- `ssh://git@*`, `git@*` - git urls (if the url isn't for github, you'll need to have set up credentials)
- `https://` (or `http://`) - curl compatible
- `gs://` - gsutil url

ℹ️ This has been superseded by [`config`](Configuration.md#config)

## project

- unset - especially initially
- branch - for git urls
- `./` - if you don't need an extra nesting layer
- directory - especially for sharing a general bucket across multiple projects

ℹ️ This has been superseded by [`config`](Configuration.md#config)

## timeframe

Used by the **[schedule](./Configuration:-Workflows.md#schedule)** action. Any open pull requests from another repository
will be checked, and if the commit is within that timeframe, it will be processed.

ℹ️ In general you shouldn't need to use this as there are more recent ways to achieve desired goals.

In [`v0.0.21`](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21), reports are available via the step summary w/o requiring any special permissions.

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
