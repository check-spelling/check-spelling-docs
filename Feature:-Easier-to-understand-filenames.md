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
Dictionary | [Replace base dictionary](https://github.com/check-spelling/check-spelling/wiki/Feature:-Dictionary-deltas) | words | dictionary | dictionary
Dictionary | [Add items to dictionary](https://github.com/check-spelling/check-spelling/wiki/Feature:-Allow) | words | allow | dictionary_additions
Dictionary | [Remove items from dictionary](https://github.com/check-spelling/check-spelling/wiki/Configuration-Examples:-reject) | patterns | reject | dictionary_removals
Files | [Ignore files](https://github.com/check-spelling/check-spelling/wiki/Configuration-Examples:-excludes) | patterns | excludes | file_ignore
Files | [Limit file checking](https://github.com/check-spelling/check-spelling/wiki/Configuration-Examples:-only) | patterns | only | file_exclusive
Content | [Mask file content](https://github.com/check-spelling/check-spelling/wiki/Configuration-Examples:-patterns) | patterns | patterns | line_masks
Output | [Acknowledge some word-like things that aren't in the dictionary](https://github.com/check-spelling/check-spelling/wiki/Configuration#expect) | words | expect | word_expectations
Output | [Help users respond to the bot](https://github.com/check-spelling/check-spelling/wiki/Configuration-Examples:-advice) | md | advice | `?`

Raised in https://github.com/check-spelling/check-spelling/issues/10