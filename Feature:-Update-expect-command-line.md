# Update expect command-line

Currently the action generates a shell command that runs perl that users can use to update their expect file(s).

In prerelease, it's possible to ask [@check-spelling-bot](https://github.com/check-spelling-bot) to update the expect files on the PR directly.

Currently, if a commit/branch results in no new spelling errors, the output is sent to a log. While it might be possible to get the log to be consumable by the bot, it'd be a non-trivial amount of work.

At this point, it'd be helpful if there was a script one could get from the check-spelling repository which could consume the expect updates and apply them.

## Goals

* Supports 
* Support URLs pointing to Markdown flavored comments
* Support URLs pointing to GitHub action check logs (requires [[Log Check Run URL|Todo: Log Check Run URL]])
* Support simple lists of adds/removes
* Support private repositories (you can't use `curl` to retrieve content from these w/o a token, and I don't want to task users for a token)
* Enable switching from using a `comment` to using `github_step_summary`

* Potentially switch reported shell script / logged shell script to use this script instead

### Distant goals

* Support a version that would work on Windows.

## Design choices

* I think that the Windows goal means the script itself would want to be pure `perl`, and the program would be run as `perl update-check-spelling.pl ARGS...`

* Retrieving the data would probably assume `gh` is present and possibly authorized (for private repositories).
* Retrieving the script would probably assume `curl` is present to have it retrieve the script.
* I think I'd unconditionally replace the script each time I ran, and I'd probably have the code generate a filename that's based on the commit-sha of the running version of check-spelling so that it is _relatively hard_ for it to collide with anything else.

## Status

1. `prerelease` can currently report the action run -- e.g. `https://github.com/check-spelling/retrobot/actions/runs/3141578109` -- from which one can identify and retrieve the `check-spelling-comment.zip` artifact, e.g. `gh run download -R check-spelling/retrobot 3141578109 -n check-spelling-comment`.
2. As the comment is generated more or less directly from that artifact, it would be possible to recreate the data inputs from it.
3. I think I'm going to adjust the artifact content to provide the inputs that the comment pass uses (currently the comment pass performs some diff actions in order to generate the bits that it renders).
4. With that, it should be pretty easy to switch the step summary command to a thing that works -- from there, writing an actual command that retrieves the code and then runs it wouldn't be particularly hard.
