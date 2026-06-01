# Only check changed hunks

Some workflows would like to be able to only send feedback to contributors about the changes they're making as opposed to preexisting unrecognized content.

## Background

As of [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21), you can use [`only_check_changed_files: true`](Configuration#onlycheckchangedfiles) to limit spell checking to changed files.

## Considerations

* If a change is made to a line (with a preexisting misspelling), should the preexisting misspelling be flagged?
* If a line/paragraph (with a preexisting misspelling) is moved to a different part of the same file, should the preexisting misspelling be flagged?
* If [block ignore](./Feature:-Block-Ignore) would apply to a block that's being changed, but the start marker isn't in the changed content, should new misspellings that would otherwise be ignored be flagged?

Offhand, I think `no` is the right answer for all three.

## Implementation

It should be fairly easy to use the equivalent of `git blame -s BASE..HEAD -- file` to identify which line numbers should be checked and only check them.

(It's possible the implementation will use porcelain output as opposed to actually using the naive `git blame BASE..HEAD`, but that's a minor implementation detail.)

### Fancier

Run check-spelling on before/after for the file, diff the report items, and only report new items.

Tradeoff: this is, obviously, slower than the naive implementation, but the results would be quieter, which is probably more valuable for the average user.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
