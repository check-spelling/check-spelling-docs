# Configuration

* [[Quick Start]]
* [Workflow Parameters](#workflow-parameters)
* [Files](#files)
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
| [only_check_changed_files](#only_check_changed_files) | If set, only check changed files |
| [dictionary_source_prefixes](#dictionary_source_prefixes) | prefixes for urls for dictionaries defined in [extra_dictionaries](#extra_dictionaries) |
| [extra_dictionaries](#extra_dictionaries) | Dictionaries to include |
| [check_extra_dictionaries](#check_extra_dictionaries) | If there are unknown words, see if they are in these additional dictionaries |
| [extra_dictionary_limit](#extra_dictionary_limit) | The number of [check_extra_dictionaries](#check_extra_dictionaries) to report |
| [event_aliases](#event_aliases) | Map an unsupported GitHub event to a known event |
| [suppress_push_for_open_pull_request](#suppress_push_for_open_pull_request) | If running from a `push` event and there's an open `pull_request`, stop working and rely on the `pull_request` handling to check the branch |
| [report_title_suffix](#report_title_suffix) | Appended to title (for use in [matrix configurations](https://docs.github.com/en/actions/learn-github-actions/workflow-syntax-for-github-actions#jobsjob_idstrategymatrix)) |
| [custom_task](#custom_task) | Workflow magic |
| [internal_state_directory](#internal_state_directory) | Workflow magic |
| [check_file_names](#check_file_names) | Spell check file paths |
| [anonymize_secpoll_source](#anonymize_secpoll_source) | Use public dns to check action security state |
| [ignore_security_advisory](#ignore_security_advisory) | Override action security state warning |
| [largest_file](#largest_file) | Ignore large files |
| [unknown_word_limit](#unknown_word_limit) | Limit the number of reports per unknown word |
| [disable_checks](#disable_checks) | Disable various check-spelling behaviors |
| [check_commit_messages](#check_commit_messages) | Check commit / PR metadata |
| [use_magic_file](#use_magic_file) | Detect binary files |
| [use_sarif](#use_sarif) | Generate SARIF Reports |

See [[Configuration: Advanced]] for additional options.

### GITHUB_TOKEN

Specify the token to be used when making API calls to GitHub.
By default the [GITHUB_TOKEN](https://docs.github.com/en/actions/reference/authentication-in-a-workflow#about-the-github_token-secret) is used.

⚠️ [@dependabot](https://github.com/dependabot) appears to be unfriendly to this token.

> **Note:** GitHub Actions get an automatic token which allows for read operations.
> If the Action is a [pull_request](#pull_request) and the originating repository isn't trusted, then the automatic token will not have write permission, 
> which means it won't be able to post a comment to the PR, there are three ways to address this:
> * Use [pull_request_target](./Configuration:-Workflows#pull_request_target) recommended as of [0.0.17-alpha](https://github.com/check-spelling/check-spelling/releases/tag/0.0.17-alpha)
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

This [[feature|Feature: Versioned dictionaries]] is new with [0.0.17](https://github.com/check-spelling/check-spelling/releases/tag/0.0.17-alpha).

### dictionary_version

If [dictionary_url](#dictionary_url) includes (`$DICTIONARY_VERSION`),
you can override the default version.

Over time, the default version will probably change.
See [[versioned dictionaries|Feature: Versioned dictionaries]]
for more information.

### experimental_apply_changes_via_bot

❗ As of [0.0.18](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.18), this feature is not ready for repositories with non members/other bots.
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

If you run your own VMs with more cores, you could use a higher number.

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

### only_check_changed_files

If you don't specify `only_check_changed_files: 1`, check-spelling will check all files that aren't filtered by `only` / `excluded`.

Some repositories are quite large and typically have very few files changing at once. Assuming a good baseline, or a willingness to force people to fix all typos in a file as they touch it, one can use this flag (in [`v0.0.20`](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20)+) to dramatically improve the time it takes to run.

With `only_check_changed_files: 1`, only the files changed (either by a PR, or since the previous commit tracked by GitHub for the branch/tag) will be checked.

Downside: if someone changes any of the config files, it's likely that they will have changed files that aren't being checked and you won't find out until they're touched at a later date. This can be frustrating for contributors (although, any linter can be frustrating).

### dictionary_source_prefixes

As of [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20), this holds a single prefix `cspell` which maps to `https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220427/dictionaries/`.

Future versions will select different tags for `cspell`, and you can mix and match them, e.g.:

```
        dictionary_source_prefixes: '{"cspell": "https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220427/dictionaries/","cspell1": "https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220814/dictionaries/"}'
        extra_dictionaries:
          cspell:lorem-ipsum/dictionary.txt
          cspell1:software-terms/src/software-terms.txt
```

> **Warning**
> If you don't override `check_extra_dictionaries`, you'll want to ensure that `cspell:` maps to something that has each of the items in it, otherwise check-spelling will be a bit upset...

Used with [extra_dictionaries](#extra_dictionaries) / [check_extra_dictionaries](#check_extra_dictionaries) to define supplemental dictionary urls in a compact form.

### extra_dictionaries

Extra dictionaries to be used when looking for unknown words.

This is a list of urls, additional url prefixes are defined by [`dictionary_source_prefixes`](#dictionary_source_prefixes).

See [Area dictionaries](https://github.com/check-spelling/check-spelling/wiki/Feature:-Area-dictionaries).

### check_extra_dictionaries

After unknown words are identified, they can be checked against additional dictionaries.

This enables users to choose additional dictionaries to add to [extra_dictionaries](#extra_dictionaries) in future runs.

### extra_dictionary_limit

In order to not drown in [check_extra_dictionaries](#check_extra_dictionaries) suggestions, only this number of dictionaries are suggested in reports. The rest are available in the generated artifact. If you find the number of listed dictionaries isn't sufficient, you can increase this number.

### event_aliases

GitHub has many many events, and Check Spelling isn't specifically designed for most of them. If you want to use it with an event that it doesn't recognize, you can map the event to one it does. As long as the event has enough fields to work, Check Spelling will treat it as if it is the mapped even.

This is mostly because `pull_request_target` was added by GitHub and realistically one should have been able to use Check Spelling with it based on its support for the `pull_request` event long before it was updated to use the `pull_request_target` event.

### suppress_push_for_open_pull_request

When running from a `push` event, check's to see if there's an open `pull_request` for the same branch.
If there is, it will stop the current run, yielding a message explaining it didn't actually check spelling and report a ✅.

The actual Check Spelling pass will happen in the pull request event (as long as it's properly configured and it's mergeable).

### report_title_suffix

When running in a [matrix configurations](https://docs.github.com/en/actions/learn-github-actions/workflow-syntax-for-github-actions#jobsjob_idstrategymatrix), each section will produce its own comment.

The report_title_suffix enables each comment to have a distinct bit to help hint that the comment is not just an accidental duplicate.

### custom_task

In order to run with restricted permissions under `pull_request_target`, check-spelling is split between two phases:

* `check-spelling` which has limited permissions but would include potentially untrusted content (this is the default task)
* `comment` this phase should have permission to post a comment (but the untrusted content shouldn't be checked out)

### internal_state_directory

As part of [custom_task](#custom_task), the default task returns its internal state. This needs to be passed to the `custom_task`: `comment` phase.

Use this parameter to indicate where the internal state was stashed.

Generally stashing is done via `actions/upload-artifact@v2` and unstrashing via `actions/download-artifact@v2`, but the action itself doesn't care, so if you want to use something else, you can.

### check_file_names

People misspell file names too. If you want, Check Spelling can complain about them too.

### anonymize_secpoll_source

As of [0.0.19](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.19), Check Spelling will check to see if the action is known to be unsafe to use. It does this using a DNS query.

If you don't want your DNS provider to be disclosed to the DNS servers hosting check-spelling, you can use this flag to ask it to pick a public dns server.

I don't expect anyone to use this feature, since on average check spelling runs inside GitHub hosted runners which means the IP addresses are incredibly uninteresting (and I have no intention of setting up a DNS server that logs queries).

That said, if you're running it in your own private infrastructure and want to be sure I can't check, you can use this flag.

### ignore_security_advisory

If the version of Check Spelling you're using is insecure, you really should update.

By default, Check Spelling will not run if it believes it's unsafe.

It's possible there isn't a fixed version available (this shouldn't be for very long), and perhaps you're using a private repository where you trust everyone. If that's the case, you can use this flag to override the security advisory.

Please don't use this flag. In general, it's a really bad idea to run known unsafe code.

A couple of typos are probably a better tradeoff than running known unsafe code for a short interval.

### largest_file

This is a file size limit in bytes. Files larger than this will be ignored.

### unknown_word_limit

Each instance of an unknown word up to this limit will be reported.

GitHub will try to attach annotations for the first couple of reported items.

The downside of this limit, of course, is that if there are more instances of a given misspelled word than this limit, you will have to find the others on your own and fix them as well. (Or just iterate with the action until it's happy...)

## Files

Note that each of the below items can either be a file with a `.txt` suffix,
or a directory, where each file with a `.txt` suffix will be merged together.

| File | Description |
| ------------- | ------------- |
| [advice](#advice) | This allows you to supplement the comment. |
| [allow](#allow) | This allows you to supplement the dictionary. |
| [dictionary](#dictionary) | This allows you to replace the dictionary. |
| [excludes](#excludes) | This allows you to skip checking files/directories. |
| [expect](#expect) | This defines the list of words in the repository that aren't in the dictionary. |
| [forbidden](#forbidden) | This allows you to define patterns of unacceptable strings. |
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

See [Area dictionaries](https://github.com/check-spelling/check-spelling/wiki/Feature:-Area-dictionaries) for other examples.

For entire reusable lists that don't live in your repository, you can use [extra_dictionaries](#extra_dictionaries) instead.

### dictionary

This replaces the [default dictionary](https://github.com/check-spelling/check-spelling/raw/dictionary/dict.txt).
One word per line.

If you want to include the default dictionary,
place it into the directory next to your own.

Alternatively, if you want to retrieve a dictionary from a remote URL,
see the workflow configuration values [dictionary_url](#dictionary_url) and [dictionary_version](#dictionary_version).

If you just want to supplement the dictionary, you can use [`extra_dictionaries`](#extra_dictionaries) or [allow](#allow).

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

### forbidden

Note: the file name is currently `line_forbidden.patterns` instead of `forbidden.txt`

This file contains Perl regular expressions.
Generally, one regular expression per line.
Lines that begin with `#` will be skipped.
They are merged using an `OR` (`|`).

Note that these are generally case-sensitive
unless you explicitly use `(?:(?i)...)` or
`[Gg]it[Hh]ub` or similar.

Tokens within files that match these expressions will be flagged.

See [[Configuration Examples: forbidden]] for examples.

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

## disable_checks

Introduced after v0.0.20:

This is a comma-delimited list of flags:

* `noisy-file` - [[Scan noisy files|Feature: Scan noisy files]]
* `word-collating` - [[Disable word collating|Feature: Disable word collating]]

## check_commit_messages

Introduced in [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21)

Check commit / PR metadata

You can specify multiple values

Value|Check
-|-
`commit` | The commit message for the latest commit
`commits` | The commit messages for pending commits
`title` | The PR title
`description` | The PR description

## use_magic_file

Introduced in [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21)

Quickly check if files are binary and skip them if they are.

(This is off by default because enabling it by default would be a behavior change and it would be hard to allow users to override it.)

## use_sarif

Introduced in [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21)

See [[Feature: Sarif output]]. This can be used as an alternative to having the tool generate
comments on PRs / commits (i.e. you could remove the comment `jobs`).

It integrates with GitHub's SARIF analysis and reporting.

The sarif reports can be made available for download (the spell-check-this sample workflow does this).

Note that GitHub's defaults to not making it easy for people who aren't collaborators to a repository
to see reports, so the experience may be slightly bumpy for projects w/ external contributors.
