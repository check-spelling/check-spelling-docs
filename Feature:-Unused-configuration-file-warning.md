# Unused configuration file warning

## Background

Different versions of check-spelling support different configuration files/names.

If you copy a config from a newer/older version than the version you're using, you may be surprised that things aren't working as expected.

check-spelling can't really *know* what a future version will support, but it does know which files it read, so it could inform users about files it didn't use.

## Implementation

check-spelling will keep track of which configuration files it's trying to use and compare that to the list of files in the configuration directory and provide an informative not about files that aren't recognized.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
