# @dependabot

I believe this should work in [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20)

`@dependabot` creates commits in the host repository and triggers a special `push` -- where it _doesn't_ have permission to comment (_by default?_).

https://github.community/t/permissions-nesecary-to-comment-on-a-pr/179047/2

## Strategies

- The bot could recognize that the commit it is handling is empty and comment on the parent (this seems generally useful) -- this may require the bot to fetch additional commits (not a big deal, it already does that occasionally).

1. Maybe the workflow can ask for permission to comment:

   ```yaml
     permissions:
       issues: write
   ```

2. The bot could on failure, if it's a `push` for `@dependabot` (or listed accounts...):

   1. create an empty commit and push that.
   2. amend the current commit and force push it. (This might upset `@dependabot`)

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
