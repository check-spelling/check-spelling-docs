# Name the files for what they act on

The names for the config files aren't particularly obvious to everyone.

## Details

1. What each file acts on isn't obvious (some act on the dictionary, some on file content, some on the results of the spell checker, some on the resulting comment)
2. The file format for each file isn't obvious (and it varies significantly)

## Status

This is a proposal, I'm still playing with it.

## File formats

Kind | Current | Proposed
-|-|-
Single word-per line | txt | words
Perl Regular Expression | txt | patterns
GitHub Markdown | txt | md

## Overview of changes

Category | Task | Format | Current | Proposed
-|-|-|-|-
Dictionary | [Replace base dictionary](./Feature:-Dictionary-deltas.md) | words | dictionary | dictionary
Dictionary | [Add items to dictionary](./Feature:-Allow.md) | words | allow | dictionary_additions
Dictionary | [Remove items from dictionary](./Configuration-Examples:-reject.md) | patterns | reject | dictionary_removals
Files | [Ignore files](./Configuration-Examples:-excludes.md) | patterns | excludes | file_ignore
Files | [Limit file checking](./Configuration-Examples:-only.md) | patterns | only | file_exclusive
Content | [Mask file content](./Configuration-Examples:-patterns.md) | patterns | patterns | line_masks
Content | [Forbidden patterns](./Feature:-Forbidden-patterns.md) | patterns | line_forbidden | line_objections
Output | [Acknowledge some word-like things that aren't in the dictionary](Configuration.md#expect) | words | expect | word_expectations
Output | [Help users respond to the bot](./Configuration-Examples:-advice.md) | md | advice | `?`

Raised in https://github.com/check-spelling/check-spelling/issues/10

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
