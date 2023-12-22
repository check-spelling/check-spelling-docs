# Block Ignore

JSON/HTML/XML/Yaml/ssh keys often have nothing useful on a given line, but people still want to ignore a hunk.

I don't have a particular plan for how to handle this. I don't think I'll implement it in the `patterns.txt` file as the way I've implemented patterns isn't really compatible w/ such an extension.

I'm mostly concerned about having to run a regular expression against a very large file as a single string.

## In scope

* `begin`/`end` tags that do not span lines (i.e. `<!\n--` is not a valid `begin` tag)
* if an `end` marker isn't found in a file, a warning can be logged but the `begin` tag will be honored
* `begin`/`end` tags on the same line `<!--`..`-->` or `/*`...`*/`
* `begin`/`end` tags are fixed characters (effectively wrapped in `\Q`...`\E` Perl Regular Expression handling)

## Out of scope

* `begin`/`end` tags that span lines (i.e. `<!\n--`)
* `begin`/`end` tags that use regular expressions

## Design

Before applying patterns, check for any `begin` tag on the line. If one is hit, switch to a mode where the only way to leave the mode is EOF or the matching `end` tag (this means skipping all patterns and forbidden patterns and anything else).

Once an `end` tag is hit, resume normal parsing (first for additional begin tags from the remainder of the line, and then for normal patterns/forbidden patterns/unknown words).

## Status

This is not yet implemented as of [v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22)
