# Name the files for what they act on

The names for the config files aren't particularly obvious to everyone.

## Details

1. What each file acts on isn't obvious (some act on the dictionary, some on file content, some on the results of the spell checker, some on the resulting comment)
2. The file format for each file isn't obvious (and it varies significantly)

## Status

This is a proposal, I'm still playing with it.

## Overview of changes

Category | Task | Format | Current | Proposed
-|-|-|-|-
Dictionary | [Replace base dictionary](https://github.com/check-spelling/check-spelling/wiki/Feature:-Dictionary-deltas) | text: single word-per line | dictionary | dictionary
Dictionary | [Add items to dictionary](https://github.com/check-spelling/check-spelling/wiki/Feature:-Allow) | text: single word-per line | allow | dictionary_additions
Dictionary | [Remove items from dictionary](https://github.com/check-spelling/check-spelling/wiki/Configuration-Examples:-reject) | Perl Regular Expression | reject | dictionary_removals
Files | [Ignore files](https://github.com/check-spelling/check-spelling/wiki/Configuration-Examples:-excludes) | Perl Regular Expression | excludes | file_ignore
Files | [Limit file checking](https://github.com/check-spelling/check-spelling/wiki/Configuration-Examples:-only) | Perl Regular Expression | only | file_exclusive
Content | [Mask file content](https://github.com/check-spelling/check-spelling/wiki/Configuration-Examples:-patterns) | Perl Regular Expression | patterns | line_pattern_masks
Output | [Acknowledge some word-like things that aren't in the dictionary](https://github.com/check-spelling/check-spelling/wiki/Configuration#expect) | text: single word-per line | expect | word_expectations
Output | [Help users respond to the bot](https://github.com/check-spelling/check-spelling/wiki/Configuration-Examples:-advice) | GitHub Markdown | advice | `?`

Raised in https://github.com/check-spelling/check-spelling/issues/10