# Suggest dictionaries when dictionaries aren't available

## Background

When check-spelling upgrades, it occasionally changes its `cspell` alias to use a new set of dictionaries. When this happens, some dictionaries may no longer be available. Configured dictionaries as of [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21) must be available, otherwise it will quit with a fatal error.

Right now, it discards all dictionaries and doesn't clearly explain which ones it couldn't get vs which ones it no longer has was it's discarded all of them.

## Prerelease flow

In prerelease, check-spelling at least includes a GitHub Job Summary which leads to the Events page with enough information for how users can recover from this.

## Improved flow

It's possible for check-spelling to reset its `cspell` alias, its `extra_dictionaries` and `check_extra_dictionaries` and raise the `extra_dictionary_limit` and then run based on that.

Instead of discarding all dictionaries, it can use a file to report the original names of all the dictionaries it couldn't resolve. That'll make it possible to retain the resolved dictionaries, clean up the code a bit, and get to the next part.

When it's done, it can suggest removing the unavailable dictionaries and users can select from the suggested dictionaries.

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
