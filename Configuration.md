# Configuration

* [[Quick Start]]
* [Workflow Parameters](#workflow-parameters)
* [Files](#Files)
* See [[Configuration: Workflows]] for the general workflow modes

## Workflow Parameters

See [[Configuration: Workflows]] for the supported GitHub workflows.

| Parameter | Description |
| ------------- | ------------- |
| [GITHUB_TOKEN](#github_token) | github credential secret for api requests |
| [config](#config) | directory with config files |
| [dictionary_url](#dictionary_url) | url for primary dictionary |
| [dictionary_version](#dictionary_version) | version of primary dictionary |
| [experimental_apply_changes_via_bot](#experimental_apply_changes_via_bot) | allow [@check-spelling-bot](https://github.com/check-spelling-bot) to update PRs |
| [experimental_parallel_jobs](#experimental_parallel_jobs) | parallelize spell checking file tasks |
| [shortest_word](#shortest_word) | minimum word length |
| [longest_word](#longest_word) | maximum word length |
| [post_comment](#post_comment) | post comment |
| [experimental_path](#experimental_path) | Directory root to check for spelling (note that bucket/project/config are independent of this) |
| [capture_output_unknown_words](#capture_output_unknown_words) | Capture unknown words (should be added to expect.txt) as an action output |
| [capture_output_stale_words](#capture_output_stale_words) | Capture stale words (should be removed from expect.txt) as an action output |
| [capture_output_skipped_files](#capture_output_skipped_files) | Capture skipped files (could be added to excludes.txt) as an action output |
| [experimental_commit_note](#experimental_commit_note) | If set, commit updates to expect automatically with this note |

See [[Configuration: Advanced]] for additional options.

### GITHUB_TOKEN

Specify the token to be used when making API calls to GitHub.
By default the [GITHUB_TOKEN](https://docs.github.com/en/actions/reference/authentication-in-a-workflow#about-the-github_token-secret) is used.

⚠️ [@dependabot](https://github.com/dependabot) appears to be unfriendly to this token.

> **Note:** GitHub Actions get an automatic token which allows for read operations.
> If the Action is a [pull_request](#pull_request) and the originating repository isn't trusted, then the automatic token will not have write permission, > which means it won't be able to post a comment to the PR.  
> There are three ways to address this:
> * Use [pull_request_target](./Configuration:-Workflows#pull_request_target) recommended as of 0.0.17-alpha
> * Create a custom Personal Access Token with `repo read` + `comment`
> * Use [schedule](./Configuration:-Workflows#schedule) instead

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

### experimental_apply_changes_via_bot

❗ As of 0.0.18, this feature is not ready for repositories with non members/other bots.
   - It will 💬 in response to other bot's comments or other accounts not associated with the
   PR explaining that it's confused.
   - If everyone in a repository is a member, or if PRs from externals are unlikely to receive
   comments from externals besides the PR author, and you don't have other bots that would
   write comments on PRs, then you could use it.

Allow [@check-spelling-bot](https://github.com/check-spelling-bot) to update PRs by
incorporating the feedback it reports.

### experimental_parallel_jobs

The number of concurrent spell checking tasks to run.

GitHub Linux/Windows VMs have 2 cores and thus the default is `2`.
GitHub's macOS VMs have 3 cores.

If you run your own VMs w/ more cores, you could use a higher number.

### shortest_word

The minimum word length to consider. The default is `3` (previously it was `2`).
Note that this will autotune to no shorter than the shortest word in the dictionary.

### longest_word

The longest word length to consider. The default is two characters longer than
the longest word in the dictionary. Previously strings that were thousands of characters long were flagged.

### post_comment

If you want to suppress commenting, you can use this.

Note: if you're using a split workflow, you will use this in the main task stage, and will not use it in the comment stage.

### experimental_path

If you want to specify the directory to test, and so to not test all the project files. Default is `.`.

### capture_output_unknown_words

Capture unknown words as an action output so it can be used in following actions. It would be stored in the variable `unknown_words`.

### capture_output_stale_words

Capture stale words as an action output so it can be used in following actions. It would be stored in the variable `stale_words`.

### capture_output_skipped_files

Capture skipped files as an action output so it can be used in following actions. It would be stored in the variable `skipped_files`.

### experimental_commit_note

Used as the commit body when a commit is created.

## Files

Note that each of the below items can either be a file w/ a `.txt` suffix,
or a directory, where each file with a `.txt` suffix will be merged together.

| File | Description |
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
posted to GitHub. It's freeform. You can use
it to explain how contributors should decide
where to put new entries.

See [[Configuration Examples: advice]] for examples.

### allow

This allows you to add supplemental words to
the dictionary without replacing the core dictionary.
One word per line.

They're really words, just not in the ancient base dictionary. They might not be used today in your project, but there's no reason for the spell checker to complain to a contributor tomorrow because it's foreseeable that they might be.

Some candidates:

* every html tag & attribute
* the name of everyone in your company (and the name of your company)
* names of css attributes/properties
* C or JavaScript reserved words
* The names of all types/ functions from the C standard library

See [Area dictionaries](https://github.com/check-spelling/check-spelling/wiki/Feature%3A-Area-dictionaries) for other examples (and my plan for eventually making this easier).

### dictionary

This replaces the [default dictionary](https://github.com/check-spelling/check-spelling/raw/dictionary/dict.txt).
One word per line.

If you want to include the default dictionary,
place it into the directory next to your own.

Alternatively, if you want to retrieve a dictionary from a remote URL,
see the workflow configuration values [dictionary_url](#dictionary_url) and [dictionary_version](#dictionary_version).

### excludes

This file contains Perl regular expressions.
Generally, one regular expression per line.
They are merged using an `OR` (`|`).

Note that these are generally case-sensitive
unless you explicitly use `(?:(?i)...)` or
`[Gg]it[Hh]ub` or similar.

Files matching these patterns will be skipped.

See [[Configuration Examples: excludes]] for examples.

Lines that start with `#` will be ignored.

### expect

This contains of expected "words" that aren't in the dictionary, one word per line.

Some arbitrary strings that are in test files that aren't really words. They should be removed if the test are changed/removed.

Expected words that are not otherwise present in the corpus will be suggested for removal,
but will not trigger a failure.

Words that are present (i.e. not matched by the excludes file) in the repository
and which are not listed in the expect list will trigger a failure as part of **push** and
**pull_request** actions (depending on how you've configured this action).

#### comments in expect

You can use `#` followed by text to add a comment at the end of a line.
Note that some automatic pruning may not properly handle this.

#### expect - previous name

:warning: This was previously called `whitelist` -- that name is *deprecated*.
Support for the deprecated name may be removed in a future release.
Until then, warnings will be reported in the action run log.
At a future date, comments may report this as well.

#### Allow vs Expect

Roughly if it's a proper noun of some sort of exists in the real world outside the project, it's a good candidate for `allow`. If it's just something you're temporally using that isn't really a word, it probably belongs in `expect`.

##### Note

The bot doesn't really care. You could put everything into `allow` or everything into `expect`. The difference is that the bot will help you remove unused items from expect and add new items to it. You could also periodically migrate items from expect to allow (think about it like Java object lifespan promotions).

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

Note that these are generally case-sensitive
unless you explicitly use `(?:(?i)...)` or
`[Gg]it[Hh]ub` or similar.

Tokens within files that match these expressions will be skipped.

See [[Configuration Examples: patterns]] for examples.

### reject

This allows you to remove words from the dictionary
without having to replace the core dictionary.

The order of operations is:

> `(dictionary + allows) - reject`

See [[Configuration Examples: reject]] for examples.
