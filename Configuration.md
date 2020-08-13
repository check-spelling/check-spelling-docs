* [Workflow Variables](#Workflow_Variables)
* [Files](#Files)
* See [[Configuration: Workflows]] for the general workflow modes

## Workflow Variables

See [[Configuration: Workflows]] for the supported GitHub workflows.

| Variable | Description |
| ------------- | ------------- |
| [config](#config) | directory with config files |
| [dictionary_url](#dictionary_url) | url for primary dictionary |
| [dictionary_version](#dictionary_version) | version of primary dictionary |
| [GITHUB_TOKEN](#GITHUB_TOKEN) | Secret used to retrieve your code and comment on PRs/commits. |
| [timeframe](#timeframe) | number of minutes (default 60) to consider when a **schedule** workflow checks for updated PRs. |

See [[Configuration: Advanced]] for additional options.

### config

Default: `.github/actions/spelling`

In this directory, you can place [files](#Files) to influence the spell checker.

### dictionary_url

If you don't define a dictionary using [dictionary](#dictionary) files,
the spell checker will retrieve a dictionary. You can provide a different url
if you have a preferred base. The default includes a variable (`$DICTIONARY_VERSION`)
for a [version](#dictionary_version).

This [[feature|Feature: Versioned dictionaries]] is new with 0.0.17.

### dictionary_version

If [dictionary_url](#dictionary_url) includes (`$DICTIONARY_VERSION`),
you can override the default version.

Over time, the default version will probably change.
See [[versioned dictionaries|Feature: Versioned dictionaries]]
for more information.

### GITHUB_TOKEN

GitHub Actions get an automatic token which allows for read operations.
If the Action is a [pull_request](#pull_request) and the originating repository isn't trusted, then the automatic token will not have write permission, which means it won't be able to post a comment to the PR.

There are two ways to address this:
* Create a custom Personal Access Token with `repo read` + `comment`
* Use [schedule](#schedule) instead

### timeframe

Used by the **[schedule](#schedule)** action. Any open pull requests from another repository
will be checked, and if the commit is within that timeframe, it will be processed.

## Files

Note that each of the below items can either be a file w/ a `.txt` suffix,
or a directory, where each file with a `.txt` suffix will be merged together.

| Variable | Description |
| ------------- | ------------- |
| [advice](#advice) | This allows you to supplement the comment. |
| [allow](#allow) | This allows you to supplement the dictionary. |
| [dictionary](#dictionary) | This allows you to replace the dictionary. |
| [excludes](#excludes) | This allows you to skip checking files/directories. |
| [expect](#expect) | This defines the list of words in the repository that aren't in the dictionary. |
| [only](#only) | This allows you to limit checking to certain files/directories. |
| [patterns](#patterns) | This allows you to define patterns of acceptable strings. |
| [reject](#reject) | This allows you to remove items from the default dictionary. |

### advice

This adds a supplemental portion to the comment
posted to github. It's freeform. You can use
it to explain how contributors should decide
where to put new entries.

### allow

This allows you to add supplemental words to
the dictionary without replacing the core dictionary.

### dictionary

This replaces the [default dictionary](https://github.com/check-spelling/check-spelling/raw/dictionary/dict.txt).
One word per line.

If you want to include the default dictionary,
place it into the directory next to your own.

### excludes

This file contains Perl regular expressions.
Generally, one regular expression per line.
They are merged using an `OR` (`|`).

Files matching these patterns will be skipped.

See [[Configuration Examples: excludes]] for examples.

Lines that start with `#` will be ignored.

### expect

This contains of expected "words" that aren't in the dictionary, one word per line.
Expected words that are not otherwise present in the corpus will be suggested for removal,
but will not trigger a failure.

Words that are present (i.e. not matched by the excludes file) in the repository
and which are not listed in the expect list will trigger a failure as part of **push** and
**pull_request** actions (depending on how you've configured this action).

You can use `#` followed by text to add a comment at the end of a line..
Note that some automatic pruning may not properly handle this.

:warning: This was previously called `whitelist` -- that name is *deprecated*.
Support for the deprecated name may be removed in a future release.
Until then, warnings will be reported in the action run log.
At a future date, comments may report this as well.

### only

This file contains Perl regular expressions.
Generally, one regular expression per line.
They are merged using an `OR` (`|`).

Files not matching these patterns will be skipped.

See [[Configuration Examples: only]] for examples.

Lines that start with `#` will be ignored.

### patterns

This file contains Perl regular expressions.
Generally, one regular expression per line.
Lines that begin with `#` will be skipped.
They are merged using an `OR` (`|`).

Tokens within files that match these expressions will be skipped.

See [[Configuration Examples: patterns]] for examples.

### reject

This allows you to remove words from the dictionary
without having to replace the core dictionary.

The order of operations is:

> `(dictionary + allows) - reject`