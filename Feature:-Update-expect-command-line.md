# Update expect command-line

Currently the action generates a shell command that runs perl that users can use to update their expect file(s).

In prerelease, it's possible to ask [@check-spelling-bot](https://github.com/check-spelling-bot) to update the expect files on the PR directly.

Currently, if a commit/branch results in no new spelling errors, the output is sent to a log. While it might be possible to get the log to be consumable by the bot, it'd be a non-trivial amount of work.

At this point, it'd be helpful if there was a script one could get from the check-spelling repository which could consume the expect updates and apply them.

## Goals

* Support URLs pointing to markdown flavored comments
* Support URLs pointing to GitHub action check logs (requires [[Log Check Run URL|Todo: Log Check Run URL]])
* Support simple lists of adds/removes

* Potentially switch reported shell script / logged shell script to use this script instead
