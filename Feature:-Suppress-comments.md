# Suppress commenting

Some projects would like to have the CI ❌ behavior w/o the GitHub comments.

Especially for projects where people make lots of commits while a PR is open and don't squash-rebase as they go (before merge).

## Using

This would be a simple:

```
with:
  suppress-comments: true
```

or similar.

## CI State

The bot would still trigger the ❌ (which if the project enables blocking PRs for would be enough).

## Logs

The logs would still have the reporting.

## Comment after the fact

I could probably also once I turn on talk-to-bot include an option for `@check-spelling-bot report` or similar to have the bot post the comment. Or possibly even `@check-spelling-bot report REFERENCE` if the bot persists enough to be able to regenerate the comment w/o doing the work (this is something I'm close to doing for other stuff).