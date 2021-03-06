# Update expect list

Prior to 0.0.18, the action reports a comment which includes a posix(ish) shell command to update the expect list.

It would be much nicer if one could click something and have the action update the expect list.

As of 0.0.18, you can enable this with:

```yaml
    with:
      experimental_apply_changes_via_bot: 1
```

## Implementation

### Comment handling

This is implemented today in prerelease:

1. ðĪ posts a comment (as it does today)
1. ðĪ gets its url (ð implemented in prerelease)
1. ðĪ update the comment with the url and instructions saying roughly "reply quoting this line"  (ð implemented in prerelease)
1. ðĪš user performs the action above
1. ðĪ responds to the action by retrieving the comment (based on the url which is encoded in the reply)
1. âĄ proceed to work

### Commit implementation

1. Retrieve the shell script from the comment, run its equivalent, git add -u, commit.
1. The command (which used to be **posix shell**) is now [Perl](Feature: Other shells)
1. With the command retrieved from the comment
1. Perform the command equivalent (the command is refactored so that the same code can be shared between the two code paths)
1. I don't intend to delete empty files, as they represent structure even if they're temporarily empty.
1. Record the changes (`git add -u`)
1. Create a commit:

   * **Committer** will be the bot
   * **Author** will be the user who commented (need to get username + email address)
   * **Date** will be the comment's date
   * Message will be something like:

     ```
     Applying automated check-spelling metadata updates

     Commands as per <bot-comment-url>
     Accepted in <user-comment-url>
     ```

1. Git push

## Constraints

### Comment limit

GitHub returns an error if the comment is too long:
> "body is too long (maximum is 65536 characters)"

This functions as a limit on the number of words reported initially.

Also, duplicating the words to expect list is just ugly.

Once the comment is effectively self-aware, the command is able to retrieve the bullet list instead of encoding the words twice.

### CheckRunEvent: action

While it seems like it'd be nice to use:
GitHub's [CheckRunEvent: action](https://developer.github.com/v3/activity/events/types/#checkrunevent-api-payload)
which offers a way to implement fix-it functionality.

I'm not sure if that's available for GitHub Actions.

â I couldn't find a way to do this

### Reaction handling

It'd be really shiny if someone could click the ðķ and select the ð [Reaction](https://developer.github.com/v3/reactions/) to trigger this.

â Unfortunately, the [Reactions preview](https://developer.github.com/changes/2016-05-12-reactions-api-preview) doesn't appear to support this functionality.

### Create a PR for the PR / branch

I may need to add fallback code whereby I create / recycle a branch (based on the name of the PR/branch) and then open a PR against the original branch. (I'll revisit this based on feedback)

## Downsides

### Required checks
If you have set the spell checker check as mandatory, you're going to need to add a dummy commit to the end of the branch, otherwise the spell checker will not run again and validate that it's happy with the branch.

The best dummy change is a blank line in the expect file itself. It will have minimal impact on blame, should be an easy merge conflict to resolve, and another pass of this feature will wipe it out.

### Blind Updates
I see a lot of people running the commands blindly and missing the fact that there are real misspellings in the output.

* Part of this is that they aren't used to looking at the output.

