⚠️ This feature will probably be [[renamed|Feature: Expectlist]]

# Update whitelist

Presently, the action reports a comment which includes a posix shell command to update the whitelist.

It would be much nicer if one could click something and have the action update the whitelist.

## User trigger implementation paths

### CheckRunEvent: action

GitHub's [CheckRunEvent: action](https://developer.github.com/v3/activity/events/types/#checkrunevent-api-payload)
offers a way to implement fix-it functionality.

I'm not sure if that's available for GitHub Actions. I'm hoping it does

### Comment handling

It's definitely possible for the bot to respond to a comment. This is my fallback plan.

## Commit implementation paths

I'm tentatively planning to retrieve the shell script from the comment, run it, git add/remove, commit.

### Git push

The "easiest path" is to push straight to the branch

### Create a PR for the PR / branch

I may need to add fallback code whereby I create / recycle a branch (based on the name of the PR/branch) and then open a PR against the original branch.

## Downsides

I see a lot of people running the commands blindly and missing the fact that there are real misspellings in the output.

* Part of this is that they aren't used to looking at the output.
* Part of this is that the current release (0.0.15-alpha) doesn't highlight certain cases (this is fixed in a prerelease, I expect it to be available in 0.0.16-alpha shortly).