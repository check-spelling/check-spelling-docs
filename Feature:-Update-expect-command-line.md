# Update expect command-line

Shipped in [`v0.0.21`](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21)

## Background

There's an optional feature that lets users ask [@check-spelling-bot](https://github.com/check-spelling-bot) to update the expect files on the PR directly.

Previously the action generated a shell command that runs perl that users can use to update their expect file(s).
And if a commit/branch results in no new spelling errors, the output is sent to a log. While it might be possible to get the log to be consumable by the bot, it would have been a non-trivial amount of work.

A lot of users were hoping for a stable script one could get from the check-spelling repository which could consume the expect updates and apply them.

## Goals

&#x2611; Support URLs pointing to Markdown flavored comments

&#x2611; Support URLs pointing to GitHub action check logs

&#x2611; Support simple lists of adds/removes

&#x2611; Support excludes

&#x2611; Support spell-check-this

&#x2611; Support private repositories (you can't use `curl` to retrieve content from these w/o a token, and I don't want to task users for a token)

&#x2611; Enable switching from using a `comment` to using `github_step_summary`


&#x2611; Switch reported shell script / logged shell script to use this script instead


&#x2611; Support running on Windows


## Design choices

- The Windows goal means the script itself would want to be pure `perl`, and the program could be run as `perl apply.pl ARGS...`

- Retrieving the data will validate `gh` is present and authorized (`gh` insists on being logged in for most (all?) operations).
- Retrieving the script will assume `curl` is present to have it retrieve the script.
- The command assumes `perl` is in the path.
- Unconditionally replace the script each time it runs. If run from a file it will check to see if it's stale.

## Status

&#x2611; `main` generates something like `curl -L 'https://raw.githubusercontent.com/check-spelling/check-spelling/prerelease/apply.pl' |

perl - 'https://github.com/check-spelling/lit/actions/runs/3319354094/attempts/1'`
&#x2611; `main` talk-to-bot can handle such a url

  - [x] `main` validates that the url corresponds to its PR
  - [x] `main` consumes the url (and handle errors)
&#x2611; `main` generates comments of this form


---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
