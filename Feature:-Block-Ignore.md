# Block Ignore

JSON/HTML/XML/Yaml/ssh keys often have nothing useful on a given line, but people still want to ignore a hunk.

This will not be implemented in the `patterns.txt` file as patterns isn't really compatible w/ such an extension.

## Constraints

- Running a regular expression against a very large file as a single string isn't viable
- Building a very complicated state machine isn't viable
- Dealing with the interactions between block ignore and normal patterns/forbidden patterns/unrecognized words itself is problematic as they expect to be able to report character positions and also reason over them, but it's really best if everything relating to a block is invisible to things.

## In scope

- `begin`/`end` tags that do not span lines (i.e. `<!\n--` is not a valid `begin` tag)
- if an `end` marker isn't found in a file, a warning can be logged but the `begin` tag will be honored (this isn't implemented)
- `begin`/`end` tags are fixed characters (effectively wrapped in `\Q`...`\E` Perl Regular Expression handling)
- no spell checking/pattern application for lines with `begin`/`end` tags

## Concerns

- Other scanners are likely to read the metadata file and will likely have complaints about portions of it (e.g. leak detection may object to patterns for the start/end of signature data). Hopefully those scanners have ways to tune them, if those mechanisms require inline/nearby annotations, it probably would be good to be able to support that.

## Not implemented

- Restricting by path (this unfortunately seems like something people will need -- a given rule could easily only apply to certain file extensions...)
- Disqualifying a block rule after encountering another token -- e.g. for only excluding something in a header block
- Complaining about multiple instances of the same `begin` token -- (first one probably wins, but this is not guaranteed and may be subject to change -- at a later date it'll likely result in the rules being discarded)

Sadly, these items argue that the initial file format will not work and something fancier will be needed. It'll probably be of the form:

`block-ignore.rules`:

```
name: (free text)
begin-token: (token)
end-token: (token)
file-path-pattern: (regular-expression)
stop-after: (token)
```

`block-ignore.toml`: (not strict toml, a minimal flavor)

```toml
[[block]]
name = (free text)
look-for-text = (token)
stop-at-text = (token)
look-for-pattern = (regular-expression)
stop-at-pattern = (regular-expression)
discontinue-at-text = (token)
file-path-pattern = (regular-expression)
```

Where `file-path-pattern` and `stop-after` would be optional fields, but `begin-token` and `end-token` would be mandatory. Whether `name` will be mandatory is unclear at this time -- this whole file format is currently just an idea.

## Out of scope

- `begin`/`end` tags that span lines (i.e. `<!\n--`)
- `begin`/`end` tags on the same line `<!--`..`-->` or `/*`...`*/`
- `begin`/`end` tags that use regular expressions
- spell checking/pattern application for lines with `begin`/`end` tags

## Design

Before applying patterns, check for any `begin` tag on the line. If one is hit, switch to a mode where the only way to leave the mode is EOF or the matching `end` tag (this means skipping all patterns and forbidden patterns and anything else) and plan to skip pattern/spell checking for the first line.

Once an `end` tag is hit, resume normal parsing (first for additional begin tags from the remainder of the line, and then for normal patterns/forbidden patterns/unknown words) on the next line.

## Status

Draft support in a file `block-delimiters.list`, format:

```block-delimiters.list
# Description of format 1
<begin token for format 1>
<end token for format 1>

# Description of format 2
<begin token for format 2>
<end token for format 2>
```

`\#` at the beginning of a line is treated as `#`, whereas `#` at the beginning of a line is treated as a comment.

This format is really lousy...

### Availability

This is not yet implemented as of [v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22)

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
