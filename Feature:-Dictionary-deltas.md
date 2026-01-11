# Dictionary deltas

Currently each project can use a default dictionary, or replace the default dictionary with their own sets of dictionaries.

At least one project has identified words that they'd like to remove from the dictionary.

As the initial implementation includes a `whitelist` of acceptable words, it seems reasonable to handle rejecting words by adding a `blacklist` which would remove words from the dictionary (instead of removing them from the corpus).

⚠️ See caveat about [Avoid using colors in names](./Feature:-Expectlist).

As this feature hasn't shipped, and as there's a desire/need for both additions and removals, I think I'm going to go with:

- `allow`
- `reject`

The order of operations will be:

- (base `dictionary` + `allow`) - `reject`

This means that if a word is in both `allow` and `reject`, it will end up _not_ being in the dictionary.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
