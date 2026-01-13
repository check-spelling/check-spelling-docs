# Dropping support for out of tree project files

## Background

check-spelling originally imagined people wouldn't want to have large `expect.txt` like files in their repositories, so the data was originally stored in a google cloud bucket.

Unfortunately, this model doesn't work well with any branching mode since it only supports a single state.

Thus, check-spelling evolved to focussing on in tree project files.

## Changes

[v0.0.25](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.25) does not support out of tree project files.

Anyone who needs to use out of tree project files can add steps before the check-spelling action to check out the repository and retrieve the project files, or they can simply commit the project files to the repository (typically in the `.github/actions/spelling` directory, although that is configurable with [`config`](Configuration#config).

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
