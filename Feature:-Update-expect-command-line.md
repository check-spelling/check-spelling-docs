# Update expect command-line

Currently the action generates a shell command that runs perl that users can use to update their expect file(s).

In prerelease, it's possible to ask [@check-spelling-bot](https://github.com/check-spelling-bot) to update the expect files on the PR directly.

Currently, if a commit/branch results in no new spelling errors, the output is sent to a log. While it might be possible to get the log to be consumable by the bot, it'd be a non-trivial amount of work.

At this point, it'd be helpful if there was a script one could get from the check-spelling repository which could consume the expect updates and apply them.

## Goals

- [x] Support URLs pointing to Markdown flavored comments
- [x] Support URLs pointing to GitHub action check logs (requires [[Log Check Run URL|Todo: Log Check Run URL]])
- [x] Support simple lists of adds/removes
- [x] Support excludes
- [x] Support spell-check-this
- [x] Support private repositories (you can't use `curl` to retrieve content from these w/o a token, and I don't want to task users for a token)
- [x] Enable switching from using a `comment` to using `github_step_summary`

- [x] Switch reported shell script / logged shell script to use this script instead

- [x] Support running on Windows

## Design choices

* The Windows goal means the script itself would want to be pure `perl`, and the program would be run as `perl apply.pl ARGS...`

* Retrieving the data will assume `gh` is present and authorized (`gh` insists on being logged in for most (all?) operations).
* Retrieving the script will assume `curl` is present to have it retrieve the script.
* I'll unconditionally replace the script each time it runs, if run from a file it will check to see if it's stale.

## Status

- [x] `prerelease` generates something like `curl -L 'https://raw.githubusercontent.com/check-spelling/check-spelling/prerelease/apply.pl' |
perl - 'https://github.com/check-spelling/lit/actions/runs/3319354094/attempts/1'`
- [x] `prerelease` talk-to-bot can handle such a url
  - [x] `prerelease` needs to validate that the url corresponds to its PR
  - [x] `prerelease` needs to consume the url (and handle errors)
- [x] `prerelease` will need to generate comments of this form
