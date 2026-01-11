# Configuration Files

Note that each of the below items can either be a file with a `.txt` suffix,
or a directory, where each file with a `.txt` suffix will be merged together.

| File | Description |
| ------------- | ------------- |
| [advice](#advice) | This allows you to supplement the comment. |
| [allow](#allow) | This allows you to supplement the dictionary. |
| [block delimiters](#block-delimiters) | This allows you to define block delimiters. |
| [dictionary](#dictionary) | This allows you to replace the dictionary. |
| [excludes](#excludes) | This allows you to skip checking files/directories. |
| [expect](#expect) | This defines the list of words in the repository that aren't in the dictionary. |
| [forbidden](#forbidden) | This allows you to define patterns of unacceptable strings. |
| [only](#only) | This allows you to limit checking to certain files/directories. |
| [patterns](#patterns) | This allows you to define patterns of acceptable strings. |
| [reject](#reject) | This allows you to remove items from the default dictionary. |

## advice

This adds a supplemental portion to the comment
posted to GitHub. It's freeform. You can use
it to explain how contributors should decide
where to put new entries.

See [Configuration Examples: advice](./Configuration-Examples:-advice) for examples.

## allow

This allows you to add supplemental words to
the dictionary without replacing the core dictionary.
One word per line.

They're really words, just not in the ancient base dictionary. They might not be used today in your project, but there's no reason for the spell checker to complain to a contributor tomorrow because it's foreseeable that they might be.

Some candidates:

- every html tag & attribute
- the name of everyone in your company (and the name of your company)
- names of css attributes/properties
- C or JavaScript reserved words
- The names of all types/ functions from the C standard library

See [Area dictionaries](./Feature:-Area-dictionaries) for other examples.

For entire reusable lists that don't live in your repository, you can use [extra_dictionaries](Configuration#extradictionaries) instead.

## block delimiters

This allows you to define a pair of start/stop delimiters which will cause check-spelling to skip the contents of lines between start and stop delimiters.

See [Configuration Examples: block delimiters](./Configuration-Examples:-block-delimiters) for examples and [Feature: Block Ignore](./Feature:-Block-Ignore) for information about the feature.

## dictionary

This replaces the [default dictionary](https://github.com/check-spelling/check-spelling/raw/dictionary/dict.txt).
One word per line.

If you want to include the default dictionary,
place it into the directory next to your own.

Alternatively, if you want to retrieve a dictionary from a remote URL,
see the workflow configuration values [dictionary_url](#dictionaryurl) and [dictionary_version](#dictionaryversion).

If you just want to supplement the dictionary, you can use [`extra_dictionaries`](Configuration#extradictionaries) or [allow](#allow).

## excludes

This file contains Perl regular expressions.
Generally, one regular expression per line.
They are merged using an `OR` (`|`).

Note that these are generally case-sensitive
unless you explicitly use `(?:(?i)...)` or
`[Gg]it[Hh]ub` or similar.

Files matching these patterns will be skipped.

See [Configuration Examples: excludes](./Configuration-Examples:-excludes) for examples.

Lines that start with `#` will be ignored.

## expect

This contains of expected "words" that aren't in the dictionary, one word per line.

Some arbitrary strings that are in test files that aren't really words. They should be removed if the test are changed/removed.

Expected words that are not otherwise present in the corpus will be suggested for removal,
but will not trigger a failure.

Words that are present (i.e. not matched by the excludes file) in the repository
and which are not listed in the expect list will trigger a failure as part of **push** and
**pull_request** actions (depending on how you've configured this action).

### comments in expect

You can use `#` followed by text to add a comment at the end of a line.
Note that some automatic pruning may not properly handle this.

### expect - previous name

:warning: This was previously called `whitelist` -- that name is _deprecated_.
Support for the deprecated name may be removed in a future release.
Until then, warnings will be reported in the action run log.
At a future date, comments may report this as well.

### Allow vs Expect

Roughly if it's a proper noun of some sort of exists in the real world outside the project, it's a good candidate for `allow`. If it's just something you're temporally using that isn't really a word, it probably belongs in `expect`.

#### Note

The bot doesn't really care. You could put everything into `allow` or everything into `expect`. The difference is that the bot will help you remove unused items from expect and add new items to it. You could also periodically migrate items from expect to allow (think about it like Java object lifespan promotions).

## forbidden

Note: the file name is currently `line_forbidden.patterns` instead of `forbidden.txt`

This file contains Perl regular expressions.
Generally, one regular expression per line.
Lines that begin with `#` will be skipped.
They are merged using an `OR` (`|`).

Note that these are generally case-sensitive
unless you explicitly use `(?:(?i)...)` or
`[Gg]it[Hh]ub` or similar.

Tokens within files that match these expressions will be flagged.

See [Configuration Examples: forbidden](./Configuration-Examples:-forbidden) for examples.

## only

This file contains Perl regular expressions.
Generally, one regular expression per line.
They are merged using an `OR` (`|`).

Files not matching these patterns will be skipped.

See [Configuration Examples: only](./Configuration-Examples:-only) for examples.

Lines that start with `#` will be ignored.

## patterns

This file contains Perl regular expressions.
Generally, one regular expression per line.
Lines that begin with `#` will be skipped.
They are merged using an `OR` (`|`).

Note that these are generally case-sensitive
unless you explicitly use `(?:(?i)...)` or
`[Gg]it[Hh]ub` or similar.

Tokens within files that match these expressions will be skipped.

See [Configuration Examples: patterns](./Configuration-Examples:-patterns) for examples.

## reject

This allows you to remove words from the dictionary
without having to replace the core dictionary.

The order of operations is:

> `(dictionary + allows) - reject`

See [Configuration Examples: reject](./Configuration-Examples:-reject) for examples.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
