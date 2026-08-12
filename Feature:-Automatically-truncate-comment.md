# Automatically truncate comment

Included in [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20)

## Background

GitHub comments are limited to 64k.

Typically, as part of the first-run experience, it's possible that there will be a very large number of unrecognized words in a lot of files that shouldn't be checked.

## Possible Approaches

- Split report into multiple comments. - I've chosen not to do this, it seems too annoying, and people already hate comments.

- Somehow truncate portions of the message

- Switch to GITHUB_STEP_SUMMARY

## Truncation

I'm currently truncating first the stale items, and then the misspelled items.

Generally during first run, the first thing to do is to tune `excludes`, and thus the focus should be on either adding excludes or adding dictionaries. Currently these two are not automatically truncated. If I get feedback that someone managed to have too many exclude suggestions, then I may add support for truncating that as well.

The log should include the truncated content.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
