# Release notes

## Supported

- [prerelease](#prerelease)
- [v0.0.22](#v0022)
- [v0.0.21](#v0021)

## Unsupported

❗ Please do not use these versions.

- [v0.0.20](#v0020)
- [v0.0.19](#v0019)
- [v0.0.18](#v0018)
- [v0.0.17](#v0017)
- [v0.0.16](#v0016)

## Prerelease

<!--
🛠️ In various states of `prerelease`
🌟 Almost ready to transition from `prerelease` to release 🍽️

-->

## v0.0.22

[v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22)

- ❄️ [Dictionaries with unique value](./Feature:-Dictionaries-with-unique-value.md)
- 🥷 [Suggest dictionaries when dictionaries aren't available](./Feature:-Suggest-dictionaries-when-dictionaries-aren't-available.md)
- 🐫 [Parallel dictionary retrieval](./Feature:-Parallel-dictionary-retrieval.md)
- 🍳 [Reorganized cspell Dictionaries in v0.0.22](./Breaking-Change:-Reorganized-cspell-Dictionaries-in-v0.0.22.md)
- 🗑️ [Removed Dictionaries](Removed-Dictionaries.md)
- 📗 [K8s](./Dictionary:-K8s.md)
- 📙 [Lisp](./Dictionary:-Lisp.md)
- 📊 [Improve suggested dictionaries order](./Feature:-Improve-suggested-dictionaries-order.md)
- 🎨 [Adjust SARIF output](./Feature:-SARIF-output.md#adjusting-sarifjson)
- 🧾 [Summary Table](./Feature:-Summary-Table.md)
- ⏱️ [Timing Report](./Feature:-Timing-Report.md)
- 🃏 [Warning about substring matches](./Feature:-Warning-about-substring-matches.md)
- 🙊 [Masked content will be excluded from minified file detection](./Feature:-Minified-file-detection.md#masked-content-will-be-excluded-from-accounting)
- 🐣 [Breaking change: Dropping printf special cases](./Breaking-change:-Dropping-printf-special-cases.md)
- 📝 [Report instances of items that used to be covered by a now missing expect entry](./Bug-fix:-Report-instances-of-items-that-used-to-be-covered-by-a-now-missing-expect-entry.md)
- 🔢 [Fix error counts for Check filenames and paths](./Feature:-Check-filenames-and-paths.md)
- ⌛ [Parsing Timeouts](./Feature:-Parsing-Timeouts.md)
- 🙈 [Advanced exclusion suggestions](./Feature:-Heuristic-exclude-suggestions.md#advanced-exclusion-suggestions)
- 🔁 [Handle GitHub Varnish failures](./Feature:-Handle-GitHub-Varnish-failures.md)
- 🗒️ [Plain text version of expect updates for people who do not want to run perl](Accepting-Suggestions.md#preformatted-commit-v0022)
- 💔 [Breaking Change: Dropping support for broken act](./Breaking-Change:-Dropping-support-for-broken-act.md)
- 📆 [🗣️ Breaking change: Dropping support for on: schedule](./Breaking-change:-Dropping-support-for-on:-schedule.md)
- 🗣️ [Support for non English languages](./Feature:-Support-for-non-English-languages.md)
- 🗣️ [Non-English languages](./Feature:-Non-English-languages.md)
- 🚆 [Hunspell dictionary support](./Feature:-Hunspell-dictionary-support.md)
- 🔢 [Configurable word characters](./Feature:-Configurable-word-characters.md)
- 🧙 [Character Encoding Auto Detection](./Feature:-Character-Encoding-Auto-Detection.md)
- 🩹 [Pattern suggestions shouldn't trip over active patterns](./Feature:-Suggest-patterns.md#multiple-patterns-for-a-line)
- 🏃 Performance fix for workflows that don't use patterns / forbidden / candidates
- 🔧 Matrixes generate archives that the latest apply.pl can consume (fixes regression in [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21))
- 🔧 Matrixes generate SARIF reports with distinct categories enabling them all to render properly (fixes bug in [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21))

## v0.0.21

[v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21)

- [Breaking change: Smaller cspell dictionaries](./Breaking-change:-Smaller-cspell-dictionaries.md)
- [Behavior change: File line column notation](./Behavior-change:-File-line-column-notation.md)
- [Step Summary](./Feature:-Step-Summary.md)
- [SARIF output](./Feature:-SARIF-output.md)
- [Suggest patterns](./Feature:-Suggest-patterns.md)
- [Update expect command-line](./Feature:-Update-expect-command-line.md)
- [Check commit messages](./Feature:-Check-commit-messages.md)
- [Restricted Permissions](./Feature:-Restricted-Permissions.md)
- [Minified file detection](./Feature:-Minified-file-detection.md)
- [Check filenames and paths `check-file-path`](Feature%3A-Check-filenames-and-paths.md#improvements-in-v0021)
- [Detect binary files](./Feature:-Detect-binary-files.md)
- [Disable word collating](./Feature:-Disable-word-collating.md)
- [Scan noisy files](./Feature:-Scan-noisy-files.md)
- [Workaround broken dependencies](./Feature:-Workaround-broken-dependencies.md)

## v0.0.20

[v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20)

- [Behavior change: Patterns masking character](./Behavior-change:-Patterns-masking-character.md)
- [Behavior change: Consumed line endings](./Behavior-change:-Consumed-line-endings.md)
- [Smarter scheduling 2021 October](./Feature:-Smarter-scheduling-2021-October.md)
- [Suppress push comment for open PRs](./Feature:-Suppress-push-comment-for-open-PRs.md)
- [Treat specific errors as warnings](./Feature:-Treat-specific-errors-as-warnings.md)
- [Run locally](./Feature:-Run-locally.md) using `act` (note: support for `act` is a bit of a moving target, but in general it should work)
- [Area dictionaries](./Feature:-Area-dictionaries.md)
- [Suggest Area dictionaries](./Feature:-Suggest-Area-Dictionaries.md)
- [Suppress comments](./Feature:-Suppress-comments.md)
- [Matrix support](./Feature:-Matrix-support.md)
- [Only changes](./Feature:-Only-changes.md)
- [Collapse older check comments](./Feature:-Collapse-older-check-comments.md)
- [Restricted Permissions](./Feature:-Restricted-Permissions.md)
- [Bug fix: Case changes should fail](./Bug-fix:-Case-changes-should-fail.md)
- [Play nice with `@dependabot`](@dependabot.md)
- [Check filenames and paths](./Feature:-Check-filenames-and-paths.md)
- [Automatically truncate comment](./Feature:-Automatically-truncate-comment.md)
- [Perl module testing](./Feature:-Perl-module-testing.md)
- [Suggest commit after expect update](./Feature:-Suggest-commit-after-expect-update.md)
- [Forbidden patterns](./Feature:-Forbidden-patterns.md)
- [Configurable file size limits](./Feature:-Configurable-file-size-limits.md)
- [Duplicate word detection](./Feature:-Duplicate-word-detection.md)
- [Update with deploy key](./Feature:-Update-with-deploy-key.md)
- [Artifacts are zipped](./Breaking-change:-Artifacts-are-zipped.md)
- [User visible warning codes](./Feature:-User-visible-warning-codes.md)

## v0.0.19

[v0.0.19](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.19)

Information is available in [GHSA-g86g-chm8-7r2p](https://github.com/check-spelling/check-spelling/security/advisories/GHSA-g86g-chm8-7r2p)

## v0.0.18

[v0.0.18](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.18)

- [Behavior change: Dropping word stemming](./Behavior-change:-Dropping-word-stemming.md)
- [Behavior change: Ignoring two letter words](./Behavior-change:-Ignoring-two-letter-words.md)
- [Update expect list](./Feature:-Update-expect-list.md)
- [Collapse older check comments](./Feature:-Collapse-older-check-comments.md)
- [Suggest adding files to exclude](./Feature:-Heuristic-exclude-suggestions.md)
- [First run advice](./Feature:-First-run-advice.md)
- All unrecognized words are reported in the log, instead of just the ones introduced by the current changes.

## v0.0.17

[0.0.17-alpha](https://github.com/check-spelling/check-spelling/releases/tag/0.0.17-alpha)

- [Feature: Easier bootstrapping](./Feature:-Easier-bootstrapping.md)
- [Feature: Spelling comments without config](./Feature:-Spelling-comments-without-config.md)
- [Feature: Run locally](./Feature:-Run-locally.md)
- [Feature: Versioned dictionaries](./Feature:-Versioned-dictionaries.md)
- [Feature: Support pull_request_target](./Feature:-Support-pull_request_target.md)

### Known issues

If you're using a private repository, the `push` event won't work correctly.

## v0.0.16

[0.0.16-alpha](https://github.com/check-spelling/check-spelling/releases/tag/0.0.16-alpha)

- [Feature: Allow](./Feature:-Allow.md)
- [Feature: Expectlist](./Feature:-Expectlist.md)
- [Feature: Dictionary deltas](./Feature:-Dictionary-deltas.md)
- [Feature: Other shells](./Feature:-Other-shells.md)

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
