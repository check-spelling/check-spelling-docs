Each event should be listed in the [**Action Log**](https://docs.github.com/en/actions/monitoring-and-troubleshooting-workflows/using-workflow-run-logs#viewing-logs-to-diagnose-failures).

- [unrecognized-spelling](#unrecognized-spelling)
  - [Resolution](#resolution)
- [noisy-file](#noisy-file)
  - [Resolution](#resolution-1)
- [bad-regex](#bad-regex)
- [no-newline-at-eof](#no-newline-at-eof)
  - [Resolution](#resolution-2)
- [non-alpha-in-dictionary](#non-alpha-in-dictionary)
  - [Resolution](#resolution-3)
- [whitespace-in-dictionary](#whitespace-in-dictionary)
  - [Resolution](#resolution-4)
  - [Future](#future)
- [unexpected-line-ending](#unexpected-line-ending)
  - [Resolution](#resolution-5)
- [forbidden-pattern](#forbidden-pattern)
  - [Resolution](#resolution-6)
- [deprecated-feature](#deprecated-feature)
  - [Resolution](#resolution-7)
- [large-file](#large-file)
  - [Resolution](#resolution-8)
- [limited-references](#limited-references)
  - [Resolution](#resolution-9)
- [check-dictionary-not-found](#check-dictionary-not-found)
- [extra-dictionary-not-found](#extra-dictionary-not-found)
- [fallback-dictionary-not-found](#fallback-dictionary-not-found)
- [dictionary-not-found](#dictionary-not-found)
  - [503 (internal server error)](#503-internal-server-error)
    - [Resolution](#resolution-10)
  - [404 (file not found)](#404-file-not-found)
    - [Resolution](#resolution-11)
      - [Auto-detect](#auto-detect)
      - [Update](#update)
      - [Use older dictionaries](#use-older-dictionaries)
      - [Use multiple prefixes](#use-multiple-prefixes)
- [candidate-pattern](#candidate-pattern)
  - [Resolution](#resolution-12)
  - [candidate-pattern with check_file_names file with use_sarif](#candidate-pattern-with-check_file_names-file-with-use_sarif)
    - [Suggestions for candidate pattern matching paths-of-checked-files.txt](#suggestions-for-candidate-pattern-matching-paths-of-checked-filestxt)
- [unsupported-repo-notation](#unsupported-repo-notation)
- [unsupported-configuration](#unsupported-configuration)
  - [`only_check_changed_files` and `use_sarif`](#only_check_changed_files-and-use_sarif)
  - [`use_sarif` and `security-events: write`](#use_sarif-and-security-events-write)
    - [Resolution](#resolution-13)
  - [`use_sarif` and private repositories](#use_sarif-and-private-repositories)
    - [Resolution](#resolution-14)
  - [`use_sarif` and `act`](#use_sarif-and-act)
- [minified-file](#minified-file)
  - [Resolution](#resolution-15)
- [duplicate-extra-dictionary](#duplicate-extra-dictionary)
  - [Resolution](#resolution-16)
- [required-download-failed](#required-download-failed)
  - [Resolution](#resolution-17)
    - [Examples](#examples)
- [check-file-path](#check-file-path)
  - [Identifying the problematic items](#identifying-the-problematic-items)
  - [Resolution](#resolution-18)
- [token-is-substring](#token-is-substring)
  - [Resolution](#resolution-19)
- [summary-table-skipped](#summary-table-skipped)
  - [Resolution](#resolution-20)
- [slow-file](#slow-file)
  - [Resolution](#resolution-21)
- [ignored-expect-variant](#ignored-expect-variant)
  - [Resolution](#resolution-22)
- [no-files-to-check](#no-files-to-check)
  - [Resolution](#resolution-23)
- [noisy-file-list](#noisy-file-list)
  - [Resolution](#resolution-24)
- [utf16-surrogate](#utf16-surrogate)
  - [Resolution](#resolution-25)
- [utf16-surrogate-file](#utf16-surrogate-file)
  - [Resolution](#resolution-25)
- [sarif-generation-failed](#sarif-generation-failed)
  - [Resolution](#resolution-26)
- [unclosed-block-ignore](#unclosed-block-ignore)
  - [Resolution](#resolution-27)
- [unclosed-block-ignore-begin](#unclosed-block-ignore-begin)
  - [Resolution](#resolution-28)
- [unclosed-block-ignore-end](#unclosed-block-ignore-end)
  - [Resolution](#resolution-29)
- [missing-on-pull-request-event](#missing-on-pull-request-event)
  - [Resolution](#resolution-30)
- [missing-merge-head](#missing-merge-head)
  - [Resolution](#resolution-31)
- [missing-checkout](#missing-checkout)
  - [Resolution](#resolution-32)
- [excludes-generation-failed](#excludes-generation-failed)
  - [Resolution](#resolution-33)
- [binary-file](#binary-file)
  - [Resolution](#resolution-34)
- [missing-rule-definition](#missing-rule-definition)
  - [Resolution](#resolution-35)
- [single-line-file](#single-line-file)
  - [Resolution](#resolution-36)

ℹ️ As of [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20), workflows can [[configure whether specific events are treated as ❌Errors or ⚠️Warnings|Feature: Treat specific errors as warnings]].

# unrecognized-spelling

```
Warning: reffy.js:27:4 ... 17, Warning - `compatilibity` is not a recognized word. (unrecognized-spelling)
Warning: src/browserlib/extract-dfns.mjs:159:11 ... 20, Warning - `hyperlink` is not a recognized word. (unrecognized-spelling)
```

The token isn't in the dictionary

## Resolution

- If there's a correct word (e.g. `compatibility`), correct the spelling
- If the word should be in the dictionary, add it to `allow.txt`
- If a portion of the line shouldn't be checked, add a pattern to `patterns.txt` -- see [[Configuration Examples: patterns]]
- If it isn't really a word, but you're temporarily using it, add it to `expect.txt`

# noisy-file

```
Warning: bridge/client/app/\_models/metadata.ts:1:1 ... 1, Warning - Skipping `bridge/client/app/_models/metadata.ts` because there seems to be more noise (6) than unique words (3) (total: 6 / 7). (noisy-file)
```

This generally means that the file doesn't appear to be English.

Technically it means there are fewer unique dictionary words in the file than unique non-word tokens.

ℹ️ Info: [[Feature: Autodetect noisy files]]

## Resolution

- If the file shouldn't be in the repository, `git rm` it (recently the tool flagged a spurious `.mp4` file)
- If the file shouldn't be checked, add a matching entry to `excludes.txt`
- If the file should be checked, some combination of:
  - add entries to the dictionary (via `allow.txt`)
  - mask runs of noise (via `patterns.txt`)
- If you really just need to check the files, see [[Scan noisy files|Feature: Scan noisy files]]

# bad-regex

```
Warning: .github/actions/spelling/patterns.txt:5:1 ... 9, Warning - bad regex (bad-regex)
```

Perl 5 didn't like your regular expression.

The log should actually provide a more detailed message from Perl.

You can testing your pattern with [Regular Expression Test Page for Perl](https://www.regexplanet.com/advanced/perl/).

The tool generally doesn't apply flags that significantly modify evaluation (it might apply `/g`).

# no-newline-at-eof

This means that you used a tool that didn't include a newline at the end of your text file.

Unix tools get quite upset and confused by this.

(git) `diff` and `patch` get frustrated and will yield odd jitter markings because of it.

`wc -l` will not treat the last line of your file as a file (an off by one error of sorts).

## Resolution

`echo >> file`

Or open it in a text editor that will fix it for you (`vi`, `nano`, ...).

# non-alpha-in-dictionary

Dictionary entries are composed of 26 letters (`a-z` in both uppercase and lowercase), apostrophe (`'`), and a newline (`\n`).

Words are generally at least 3 characters long. (This is tunable.)

If you include any other characters (including `-`), the entry will be ignored.

This is mostly a matter of pragmatism. You might be worried that the tool doesn't know the color `sea-green`, that's ok, the tool doesn't _see_ `sea-green`, it ignores the `-` and sees the words `sea` and `green`, and unless you remove one or both of those words from its dictionary (using `reject.txt`), it will accept both.

Since it doesn't see `sea-green` as a single word, trying to add `sea-green` to your dictionary won't work.

## Resolution

- If the word you're trying to put in the dictionary is `pre-emptively`, just replace all instances of it with `preemptively`.

If you want to accept `avii-ridge` in your repository, you can:

- add `avii` to your dictionary (by adding it to `allow.txt`),
- add `\bavii-ridge\b` in `patterns.txt`, or
- add `avii` to `expect.txt`.

# whitespace-in-dictionary

```
Warning: .github/actions/spelling/expect.txt:1:5 ... 6, Warning - entry has unexpected whitespace (whitespace-in-dictionary)
```

This generally means you have a mix of DOS and Unix line endings.

The tool generally assumes it's only going to see Unix line endings.

## Resolution

Use `dos2unix`.

e.g.:

```
dos2unix .github/actions/spelling/expect.txt
```

## Future

This may be renamed to `unexpected-line-ending` in the future.

# unexpected-line-ending

```
Warning: .github/actions/spelling/expect.txt:1:5 ... 6, Warning - entry has unexpected whitespace (whitespace-in-dictionary)
```

This generally means you have a mix of DOS and Unix line endings.

The tool generally assumes it's only going to see Unix line endings.

## Resolution

Use `dos2unix`.

e.g.:

```
dos2unix .github/actions/spelling/expect.txt
```

# forbidden-pattern

```
Warning: unknown-words.sh:894:43 ... 59, Warning - `patterns patterns` matches an objections.patterns entry. (forbidden-pattern)
```

This is generated by [[Forbidden patterns|Feature: Forbidden patterns]].

The repository has a specific regular expression defining a pattern that it doesn't want used.

⚠️ Currently each hit will be logged whereas [unrecognized-spelling](#unrecognized-spelling) will trigger [limited-references](#limited-references). This will probably change, possibly before [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20).

## Resolution

Identify the pattern and either rewrite your code not to match it, or adjust the pattern not to match your code.

# deprecated-feature

Over time, features will be deprecated. Typically a replacement will be available.
Eventually support for the deprecated feature will be removed.

## Resolution

Please try to migrate to the newer supported item.

# large-file

```
Warning: gigantic-file.sh:0:0 ... 0, Warning - size `10000000` exceeds limit `1000000`. (large-file)
```

This is generated by [[Configurable file size limits|Feature: Configurable file size limits]].

## Resolution

If you want to check the file, you can adjust the file size limit.

If the file should be skipped, please add it to `excludes.txt`.

# limited-references

```
Warning: pkg/testutil/testutil_windows.go:26:67 ... 69, Warning - `amd` is not a recognized word-- found 80 times. (limited-references)
```

This is generated when a word appears more than [[unknown_word_limit|Configuration#unknown_word_limit]] times.

## Resolution

If the item is a word, add it to `expect` or `allow`.

If the item should be masked with a pattern, add a matching `pattern`.

If the file(s) containing it shouldn't be checked, add patterns to skip them to `excludes`.

If the item is misspelled, fixing the reported instances will disclose additional instances.
You could of course use your local tools to find the remaining instances.

# check-dictionary-not-found
This is reported when a [check_extra_dictionaries](https://github.com/check-spelling/check-spelling/wiki/Configuration#check_extra_dictionaries) is not found. See [dictionary-not-found](#dictionary-not-found).

# extra-dictionary-not-found
This is reported when a [extra_dictionaries](https://github.com/check-spelling/check-spelling/wiki/Configuration#extra_dictionaries) is not found. See [dictionary-not-found](#dictionary-not-found).

# fallback-dictionary-not-found
A second attempt is made to resolve [extra_dictionaries](https://github.com/check-spelling/check-spelling/wiki/Configuration#extra_dictionaries), and when they fail this is reported. See [dictionary-not-found](#dictionary-not-found).

# dictionary-not-found

Test the url manually. What to do will depend on the error code from the web server.

## 503 (internal server error)

```
Failed to retrieve cspell:r/src/r.txt (https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20230509/dictionaries/r/src/r.txt)
HTTP/2 503 
server: Varnish
retry-after: 0
```

### Resolution

Rerun the workflow.

check-spelling [v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22)+ includes code to retry these failures.

## 404 (file not found)

```
Error: Failed to retrieve cspell:software-terms/softwareTerms.txt -- https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220814/dictionaries/software-terms/softwareTerms.txt (dictionary-not-found)
```

This can happen if a path to a dictionary is incorrect.

The most common case is when upgrading versions of check-spelling. Newer versions may use refreshed versions of the [cspell: dictionaries](https://github.com/streetsidesoftware/cspell-dicts) and their dictionaries are reorganized periodically.

### Resolution

#### Auto-detect

🪄 **Recommended Solution**

You can simply remove the dictionary reference(s) and remove (if present):

```yaml
  with:
    check_extra_dictionaries: ''
```

This will let check-spelling suggest new dictionaries.

#### Update

You can browse through the current dictionaries and identify suitable replacements. The output will show a URL which includes a repository and tag (e.g. `check-spelling/cspell-dicts/v20220814`), you can thus browse to https://github.com/check-spelling/cspell-dicts/tree/v20220814/dictionaries/. That might be something like (although you should consider which dictionary/dictionaries are relevant to your repository):

```yaml
  with:
    extra_dictionaries:
      cspell:software-terms/src/network-os.txt
      cspell:software-terms/src/software-tools.txt
      cspell:software-terms/src/network-protocols.txt
```

#### Use older dictionaries

If you want to continue to use the previous dictionaries, you can check the run output of a previous version of check-spelling for the `with:` output, e.g.:

```yaml
  with:
    dictionary_source_prefixes: {"cspell": "https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220427/dictionaries/"}
```

and specify the single dictionary directly (by expanding any url prefixes, e.g. `cspell:` appropriately), e.g.:

```diff
   with:
     extra_dictionaries:
-      cspell:software-terms/softwareTerms.txt
+      https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220427/dictionaries/software-terms/softwareTerms.txt
```

You could also copy over the prefix into your configuration, but note that `check_extra_dictionaries` will probably not match, so using:

```yaml
  with:
    dictionary_source_prefixes: '{"cspell": "https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220427/dictionaries/"}'
```

Will result in the same warning, but it will be non-fatal:

```
Failed to retrieve cspell:public-licenses/src/generated/public-licenses.txt -- https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220427/dictionaries/public-licenses/src/generated/public-licenses.txt (dictionary-not-found)
```

#### Use multiple prefixes

In order to retain the `check_extra_dictionaries` behavior, while still retaining the old dictionary reference, and without having long urls in `extra_dictionaries`, you can add additional prefixes to `dictionary_source_prefixes`.

In this example, the default for `dictionary_source_prefixes` is `{"cspell": "https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220814/dictionaries/"}` and the previous default was `{"cspell": "https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220427/dictionaries/"}`. By changing the previous default's prefix to `cspell0` and copying over the current default, it's possible to use dictionaries from both and a manner that might be slightly easier to read:

```diff
   with:
+    dictionary_source_prefixes: '
+      {
+        "cspell": "https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220814/dictionaries/",
+        "cspell0": "https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220427/dictionaries/"
+      }'
     extra_dictionaries:
       cspell:aws/aws.txt
       cspell:filetypes/filetypes.txt
-      cspell:software-terms/softwareTerms.txt
+      cspell0:software-terms/softwareTerms.txt
```

# candidate-pattern

```
Notice: src/Stack/Build/Source.hs:214:1 ... 1, Notice - Line matches candidate pattern `(?:^|[\t ,"'`=(])-\[DPWXYLlf](?=\[A-Z]{2,}|\[A-Z]\[a-z]|\[a-z]{2,})` (candidate-pattern)
```

The report will also include an entry like:

```perl
# hit-count: 169 file-count: 40
# Compiler flags
(?:^|[\t ,"'`=(])-[DPWXYLlf](?=[A-Z]{2,}|[A-Z][a-z]|[a-z]{2,})
```

The [line in question](https://github.com/commercialhaskell/stack/blob/f3a167873f6081751babb8a6bb17de7c96f4d8a2/src/Stack/Build/Source.hs#L214) is:

```hs
    , concat [["-fhpc"] | isLocal && toCoverage (boptsTestOpts bopts)]
```

👩‍🔬 In a version after 0.0.20, as part of [[Suggest patterns|Feature: Suggest patterns]], you can provide a `candidate.patterns` file.

If a line in a file (that isn't _excluded_), and after being filtered for patterns has word-like items that aren't in the dictionary,
then those lines will be checked against _candidate patterns_. Each candidate will report separately against each line.

If a candidate pattern appeals to you, you can (tinker with, and) add it to `patterns`.

Simple comment lines `# ` preceding a candidate line will be included in the output for candidates in the comment in the report.

In order to give users a chance to understand how useful a given candidate is, a couple of lines that match each pattern are reported.
Version 0.0.22 will highlight the matching part of the line when SARIF reporting is enabled.

## Resolution

You can add the pattern into `patterns.txt`:

```perl
# hit-count: 169 file-count: 40
# Compiler flags
(?:^|[\t ,"'`=(])-[DPWXYLlf](?=[A-Z]{2,}|[A-Z][a-z]|[a-z]{2,})
```

Or, if you've decided that the candidate pattern doesn't make sense for the repository, you can remove it from or comment it out in the `candidate.patterns` file.

## candidate-pattern with check_file_names file with use_sarif

If you're using [`check_file_names`](https://github.com/check-spelling/check-spelling/wiki/Configuration#check_file_names) and [`use_sarif`](https://github.com/check-spelling/check-spelling/wiki/Configuration#use_sarif) with the [SARIF Viewer](https://marketplace.visualstudio.com/items?itemName=MS-SarifVSCode.sarif-viewer) for [Visual Studio Code](https://code.visualstudio.com/) and a [suggested pattern|Feature:-Suggest-patterns] matches a file path, the location will be listed as `paths-of-checked-files.txt` and VS Code will not be able to identify the actual file.

### Suggestions for candidate pattern matching paths-of-checked-files.txt

* You can download the sarif json and open it to identify the matched file.
* You can use [Looking for items locally] to generate a `$files` environment variable and dump that to a file. If you search that file using a case-sensitive regular expression for the suggested pattern, you should be able to identify the file.
* Often files that match patterns themselves are worth excluding, so you might consider adding the pattern or a variation to [`excludes`|Configuration Examples: excludes] instead of [`patterns`|Configuration Examples: patterns]

# unsupported-repo-notation

`spell_check_this` expects a repository and revision of the form `owner/repository@revision`

If the revision you selected doesn't work, feel free to file a bug with a public example (it's certainly possible the pattern is too strict).

# unsupported-configuration

## `only_check_changed_files` and `use_sarif`

- `only_check_changed_files` will only check certain files
- `use_sarif` generates a report which GitHub will diff against a previous report with anything missing being marked as resolved

You can choose one or the other. By default, check-spelling favors the former. If you want to use the latter, you'll have to turn off the former.

## `use_sarif` and `security-events: write`

To [upload sarif results](https://docs.github.com/en/code-security/code-scanning/integrating-with-code-scanning/uploading-a-sarif-file-to-github), `use_sarif` needs `security-events: write`.

### Resolution

If you want to use sarif, add:

```yaml
permissions:
  security-events: write
```

to the `job` that contains the `use_sarif` configuration.

Alternatively, you can remove `use_sarif: ...` from the job in which case the classic error reporting mechanism will be used.

## `use_sarif` and private repositories

GitHub SARIF processing requires GitHub Advanced Security to be enabled.

This is possible for Public repositories on GitHub.com and for Enterprise Repositories, but it's possible that you can't use it with Private repositories on GitHub.com.

### Resolution

- Switch to an enterprise plan (?)
- Remove `use_sarif`
- If you have a use for the SARIF output beyond GitHub's handling, please file a bug describing your use case -- it's possible to adjust the code to handle this case, but this wasn't supported in the initial implementation, so you are here.

## `use_sarif` and `act`

You can try setting [`GITHUB_TOKEN`](https://github.com/nektos/act#github_token).

This isn't supported and is unlikely to work.

Eventually provisions will be made to generally expose the artifact itself. There is an artifact server which could help....

# minified-file

The file has really long lines. It's probably minified.

## Resolution

- If it's minified, add it to excludes
- If certain lines are really long because they contain inline minified content, add a pattern that matches that content
- If it really should be checked, you can suppress the check by adding `minified-file` to `with:`/`disable_checks:`, e.g.:
  ```yaml
  with:
    disable_checks: minified-file
  ```
- If you think the heuristic should be improved, please file a bug with an example

# duplicate-extra-dictionary

This can happen if you have the same entry multiple times in `extra_dictionaries`.

## Resolution

Remove duplicate entries. check-spelling will ignore duplicate instances.

# required-download-failed

Nothing on the internet is guaranteed to be 💯% reliable. Sometimes a server will be unable to offer content.

Unfortunately, most programs have required content and won't work without it. If you see this message, e.g.:

```
Failed to download https://raw.githubusercontent.com/check-spelling/check-spelling/dictionary-20200211/dict.txt (to /tmp/tmp.PqDJv9CiN8) (required-download-failed)
```

Then you've run into a case where check-spelling needed a resource (here, the dictionary), and the server it asked returned an error.

Because the dictionary is required in order to determine whether things are misspelled, check-spelling gave up.

## Resolution

Most of the time, this will be a transient error, you can click the [`Re-run jobs` drop down and select `Re-run failed jobs`](https://docs.github.com/en/actions/managing-workflow-runs/re-running-workflows-and-jobs#re-running-failed-jobs-in-a-workflow).

It's possible that your workflow is misconfigured and is pointing to a resource that doesn't exist (whether because it was removed or someone made an error), in which case you'll have to identify a correct URL and update the workflow.

If the version of check-spelling was recently upgraded (this can happen if you're using `@main`, especially if you're using `@prerelease`, or if you're using another action which wraps check-spelling), then it's possible that the configuration is now referencing a version of a resource that doesn't exist.

### Examples

```
Failed to retrieve cspell:bash/bash-words.txt -- https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20230502/dictionaries/bash/bash-words.txt (dictionary-not-found)
```

Between [v20220816](https://github.com/check-spelling/cspell-dicts/releases/tag/v20220816) and [v20230502](https://github.com/check-spelling/cspell-dicts/releases/tag/v20230502), a number of the dictionaries were renamed, mostly changing from `foo/bar.txt` to `foo/dict/bar.txt`, so, for this one, `cspell:bash/bash-words.txt` would become `cspell:bash/dict/bash-words.txt`.



# check-file-path

If you have enabled [[Check filenames and paths|Feature: Check filenames and paths]] with [`check_file_names: 1`](https://github.com/check-spelling/check-spelling/wiki/Configuration#check_file_names), then in addition to checking the contents of files, check-spelling will check the file paths.

A reported item will correspond to a portion of a file path, possibly a folder, possibly a file name, or possibly the file extension. Initially, a bunch of the items listed will be false positives, but it's quite possible that one or two of them will be misspellings.

    Error: .github/workflows/graphql-inspector.yml:1:9 ... 18, Error - `workflows` is not a recognized word. (check-file-path)
    Error: .github/workflows/graphql-inspector.yml:1:37 ... 40, Error - `yml` is not a recognized word. (check-file-path)

In the log form, the numbers `9 ... 18` refer to character offsets within the file path. Here `9 ... 18` refers to `workflows` and `37 ... 40` refer to `yml` for the same file path.

## Identifying the problematic items

- If you enabled [[Summary Table|Feature: Summary Table]] with [`summary_table: 1`](https://github.com/check-spelling/check-spelling/wiki/Configuration#summary_table) and there is enough space, the individual paths should appear in the details table.
- If you enabled [[SARIF output|Feature: SARIF output]] with [`use_sarif: 1`](https://github.com/check-spelling/check-spelling/wiki/Configuration#use_sarif) and the repository is public (or is private and has advanced security enabled) and you are a member of the security group / an owner/admin, then individual items should appear in the Sarif report.
- You can find them listed in the `Spell check` section of the Action log (they should have `(check-file-path)` on each line).

## Resolution

For false positives, you can add entries to `expect.txt` or `allow.txt` (this is an especially good idea if you're using a term as a term of art, e.g. `graphql`) just as if the items were found in the files themselves, or add patterns to `patterns.txt`.

If the file / directory is misspelled, you'll need to use `git mv` to rename it.

- You may also need to update any references.
  - It's possible references may live outside the repository. If that's the case, you may need to leave temporary shims (just as with fixing misspelled public APIs).

# token-is-substring

check-spelling tries to find "words" in your repository that it doesn't have in the dictionaries you've configured. It does that by applying heuristics to identify word boundaries. It also allows you to apply patterns to mask portions of lines  (but it doesn't keep track of where things were when it does this). Most likely as a result of some patterns in the configuration, it found a "word" that wasn't in the dictionary, but when it looked through the line w/o applying the patterns, it couldn't determine where the word was.

Most of the time, the fault is in pattern definitions, especially patterns that consume part of a word.

Sometimes the fault is due to an internal pattern (mostly aliases for fancy apostrophes to simple apostrophes, or collapsing apostrophes).

⚠️ If this flags to the first line of a file and you have `check_file_names` enabled, it's possible it's warning about the file path as opposed to the line. A distinct warning will probably be added for this case at a later time.

## Resolution

- Consider adding a `\b` or `\s` to the edges of your pattern.
- It's possible to add the items to expect or to the dictionary if they're really correct.
- See [[Warning about substring matches|Feature: Warning about substring matches]] for more advice.

# summary-table-skipped

When producing a [[Summary Table|Feature: Summary Table]], if sections would cause the Summary to exceed its size limit, they'll be dropped.

## Resolution

Remove items

- If there are suggested dictionaries, resolve them/disable the feature
- Expand the dictionary by adding items to `allow.txt` or including additional `extra_dictionaries`
- If there are too many forbidden items, remove some from `line_forbidden.patterns`
- If there are pattern suggestions add them to `patterns.txt` or remove them from `candidate.patterns`
- If files trigger too many items, skip them with `exclude.txt`
- Focus on specific files with `only.txt`

# slow-file

When processing a file, if the time to parse exceeds the `splitter_timeout` environment variable, parsing will stop.

## Resolution

- Add the file to `excludes.txt`
- Adjust patterns to improve parsing behavior
- Increase [`splitter_timeout`](https://github.com/check-spelling/check-spelling/wiki/Feature%3A-Parsing-Timeouts#configuration)

# ignored-expect-variant

check-spelling looks for items not in the dictionary, once it finds them, it checks those items against the expect file. If words are in expect (and found), they will be used to cover additional variations (variants). If a word is covered by a base word, then it doesn't need to be explicitly listed again by its variant, and check-spelling will warn you about the superfluous entry.

English / programming have interesting ways of handling proper nouns.

In general, a term might be written as `MICROSOFT`, it's reasonable to decide that this is ok for use in a project.
Doing this doesn't tend to mean that using `Microsoft` or `microsoft` would be acceptable.

OTOH, once you've decided that `Microsoft` is acceptable, it's likely that you'll also accept `MICROSOFT` (e.g. as a constant or in some ALL CAPS SENTENCE) while still not allowing `microsoft`.

If you decide that `microsoft` is acceptable, then it's likely that you'll also accept `Microsoft` (e.g. as the first word in a sentence).

`expect.txt` is parsed with the assumption that only the most general form that's found in your code is listed.

Similarly, if you use the term `widgit`, you might write it in a plural as `widgits`. If you include `widgit` in `expect`, you don't need to include `widgits` as check-spelling will assume that you are ok with that plural.

## Resolution

- Remove the extraneous entry/entries from `expect.txt` -- the included `apply.pl` suggestions should help with this
- Add forms to `allow.txt` which doesn't have this behavior

# no-files-to-check

Check Spelling works by reviewing files and identifying problems with them.

It can be configured to check out the repository for you, or you can check out the repository in the workflow job before using the action. Without checking out files, it won't find any files to check.

You can configure which files it should check by using [excludes](https://github.com/check-spelling/check-spelling/wiki/Configuration#excludes) and [only](https://github.com/check-spelling/check-spelling/wiki/Configuration#only).

## Resolution

- Check out the repository
  - Add `checkout: true` to the `step` `uses: check-spelling/check-spelling@...`'s `with:` block, or
  - Add a `uses: actions/checkout@...` step before the `uses: check-spelling/check-spelling@...` step
- Remove entries from [excludes](https://github.com/check-spelling/check-spelling/wiki/Configuration#excludes)
- Adjust or add items in [only](https://github.com/check-spelling/check-spelling/wiki/Configuration#only)
- Review the contents of the repository and compare against both

# noisy-file-list

[[Check filenames and paths|Feature: Check filenames and paths]] results in a list of file paths to be checked as if it was the contents of a file. The general [noisy-file](#noisy-file) heuristic has triggered on the file list itself.

## Resolution

- Turn off [[Check filenames and paths|Feature: Check filenames and paths]].
- Add file path words to the dictionary (`allow.txt`).
- Add file paths to patterns (`patterns.txt`) to exclude noisy file paths.

# utf16-surrogate

In [v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22).

See [utf16-surrogate-file](#utf16-surrogate-file) below.

# utf16-surrogate-file

If a file contains utf16 surrogates, it'll be flagged.

This event was renamed from `utf16-surrogate` to `utf16-surrogate-file` in [v0.0.23](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.23).

check-spelling is designed for utf-8 based files, so a file containing a utf-16 surrogate should be a reasonably good indication that the file won't contain content check-spelling can handle.

## Resolution

- Add the file to `excludes.txt`
- If the heuristic is wrong, please file a bug.
- You can manually use `uses: actions/checkout@...` and then add a `run` step that converts from utf16 to utf8, e.g. using `iconv`:

  ```sh
  (
    intermediate=$(mktemp);
    for file in $utf16_files; do
      iconv -f utf-16le -t utf-8 "$file" -o "$intermediate" &&
        mv "$intermediate" "$file"
    done
  )
  ```

  -- Note that this is untested -- please send feedback if you try using it.

# sarif-generation-failed

If you encounter this, then check-spelling's Sarif module misbehaved. Sorry about that.

## Resolution

Please [file a bug](https://github.com/check-spelling/check-spelling/issues/new).

# unclosed-block-ignore

A [[Block Ignore|Feature: Block Ignore]] rule's start pattern matched content in the file, but the corresponding end tag wasn't found.

As a result, all content after the begin tag was ignored.

Note that this feature is experimental, it's possible you've encountered a bug.

## Resolution

- If you believe the behavior is incorrect, please [file a bug](https://github.com/check-spelling/check-spelling/issues/new).
- If the end token really isn't present, consider adjusting your begin/end tokens.

# unclosed-block-ignore-begin

A [[Block Ignore|Feature: Block Ignore]] rule's start pattern matched content in the file, but the corresponding end tag wasn't found.

As a result, all content after the begin tag was ignored.

For convenience, there should be a corresponding report [`unclosed-block-ignore-end`](#unclosed-block-ignore-end) that lists the marker that it was expected to find.

Note that this feature is experimental, it's possible you've encountered a bug.

## Resolution

- If you believe the behavior is incorrect, please [file a bug](https://github.com/check-spelling/check-spelling/issues/new).
- If the end token really isn't present, consider adjusting your begin/end tokens.
- One approach is to pick a new more specific begin token for the specific instance that would be hit first (but ideally only in this file) and a new end token that appears _after_ the begin token that doesn't have a matching end token.

# unclosed-block-ignore-end

A [[Block Ignore|Feature: Block Ignore]] rule's start pattern matched content in the file, but the corresponding end tag wasn't found. The specific end marker should be listed in the report.

As a result, all content after the begin tag was ignored.

For convenience, there should be a corresponding report [`unclosed-block-ignore-begin`](#unclosed-block-ignore-begin) that lists the marker that started the unclosed block ignore.

Note that this feature is experimental, it's possible you've encountered a bug.

## Resolution

- If you believe the behavior is incorrect, please [file a bug](https://github.com/check-spelling/check-spelling/issues/new).
- If the end token really isn't present, consider adjusting your begin/end tokens.
- One approach is to pick a new more specific begin token for the specific instance that would be hit first (but ideally only in this file) and a new end token that appears _after_ the begin token that doesn't have a matching end token.

# missing-on-pull-request-event

The [`suppress_push_for_open_pull_request`](https://github.com/check-spelling/check-spelling/wiki/Configuration#suppress_push_for_open_pull_request) configuration expects there to be an `on:` containing `pull_request` or `pull_request_target` -- if it isn't found, there wouldn't be a place for check-spelling to run.

Instead of leaving users without a run, the `suppress_push_for_open_pull_request` configuration will be ignored. 

## Resolution

- Add a `pull_request` or `pull_request_target` event to the `on:` block in the workflow.
- Remove `suppress_push_for_open_pull_request` from the check-spelling configuration.
- If you believe the behavior is incorrect, please [file a bug](https://github.com/check-spelling/check-spelling/issues/new).

# missing-merge-head

This is known to happen when a PR is reopened. check-spelling as of [v0.0.23](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.23) should be able to check spelling, but will not be able to upload a SARIF report as that requires information about the PR merge commit.

## Resolution

It's possible that the commit will be regenerated, but the simplest thing to do is to push a new commit.

# missing-checkout

There wasn't a checked out repository in the configured location.

## Resolution

Check out the repository:
- Add `checkout: true` to the `step` `uses: check-spelling/check-spelling@...`'s `with:` block, or
- Add a `uses: actions/checkout@...` step before the `uses: check-spelling/check-spelling@...` step

# excludes-generation-failed

One of the lines in `excludes.txt` (or equivalent) tripped up the `SuggestsExcludes` code.

_Note that this is not necessarily reported as an event, but it may appear as an annotation or in the log._

The `SuggestsExcludes` implementation may have bugs (and does as of [0.0.24](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.24)).

If an error is encountered in `SuggestsExcludes`, check-spelling won't be able to suggest additional excludes, but it should otherwise function.

## Resolution

* If you're using [0.0.24](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.24) you can try prerelease or the version after [0.0.24](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.24).
* If you find one in a version after the fix for https://github.com/check-spelling/check-spelling/issues/85, please search for additional issues, and if you don't find one, please [file a ticket](https://github.com/check-spelling/check-spelling/issues/new).

# binary-file

When [[magic file detection|Feature: Detect binary files]] is enabled, some files may be identified as binaries and thus skipped.

## Resolution

* Add the files to `excludes.txt`.
* Disable detection by using `use_magic_file: 0`.
* If the file should not be identified as a binary file, please search for an issue, and if you don't find one, please [file a ticket](https://github.com/check-spelling/check-spelling/issues/new).

# missing-rule-definition

Each event in check-spelling should have a definition in check-spelling's `sarif.json` file which in turn should link to a specific event description (in this document). Unfortunately, if you're reading this because you clicked a link from a GitHub event, then that means that there was an event in check-spelling that isn't documented in `sarif.json`.

## Resolution

Please search for an issue, and if you don't find one, please [file a ticket](https://github.com/check-spelling/check-spelling/issues/new); include as much detail about the occurrence as possible.

# single-line-file

The file has a single very long line. As these files tend to be minified files, it was skipped.

## Resolution

* Add the files to `excludes.txt`.
* Split the file into multiple lines. For markdown files you can generally insert single newlines anywhere, but splitting between `. ` is a good practice.
* Disable detection by adding `single-line-file` to [`disable_checks`](https://github.com/check-spelling/check-spelling/wiki/Configuration#disable_checks).
* If you have a good reason for the file to be a single line file and have check-spelling check its spelling, please search for an issue, and if you don't find one, please [file a ticket](https://github.com/check-spelling/check-spelling/issues/new) including an explanation of your use case.
