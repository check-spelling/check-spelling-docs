# @dependabot

`@dependabot` creates commits in the host repository and triggers a special `push` -- where it _doesn't_ have permission to comment (_by default?_).

https://github.community/t/permissions-nesecary-to-comment-on-a-pr/179047/2

## Strategies

* The bot could recognize that the commit it is handling is empty and comment on the parent (this seems generally useful) -- this may require the bot to fetch additional commits (not a big deal, it already does that occasionally).

1. Maybe the workflow can ask for permission to comment:

   ```yaml
     permissions:
       issues: write
   ```

2. The bot could on failure, if it's a `push` for `@dependabot` (or listed accounts...):

   1. create an empty commit and push that.
   2. amend the current commit and force push it. (This might upset `@dependabot`)