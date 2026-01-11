# Tolerate engine upgrades

Engine upgrades to date have been moderately bumpy and require a certain leap of faith.

There are two engines at work: the old one, and the new one. And often they have a difference of opinion about what's a misspelled word.

To the extent that the bot can recognize that it's being upgraded, I think it'd be nice if the bot could choose to run itself with the upgraded version instead of its current engine.

## Requirements

- The bot needs to know the path to the running workflow (I'm not sure how readily available this is).

## Process

1. The bot checks to see if this file is being changed.
2. It checks to see if the version of the bot is being changed
3. If it is, the bot retrieves the new version (probably by making a copy of the current version, and then fetching and updating to the destination version)
4. The bot calls the new version with its environment.

## Caveats

New environment variables from the new `action.yml` file won't be available and I don't expect `with` values would be either. It's really too hard to handle that case. (I'd have to reimplement `act`'s parsing which is probably overkill.)

## See Also

[Suppress PR check when workflow changes](./Feature:-Suppress-PR-check-when-workflow-changes)

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
