# Release notes

* [prerelease](#prerelease)
* [v0.0.21](#v0021)
* [v0.0.20](#v0020)
* [v0.0.19](#v0019)
* [v0.0.18](#v0018)
* [0.0.17-alpha](#0017-alpha)
* [0.0.16-alpha](#0016-alpha)

## prerelease

* 🏃 Performance fix for workflows that don't use patterns / forbidden / candidates
* 🔧 Matrixes generate archives that the latest apply.pl can consume (fixes regression in [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21))
* 🔧 Matrixes generate sarif reports with distinct categories enabling them all to render properly (fixes bug in [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21))

<!--
🛠️ In various states of `prerelease`
🌟 Almost ready to transition from `prerelease` to release 🍽️

-->
## [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21)

* [Breaking change: Smaller cspell dictionaries](./Breaking-change:-Smaller-cspell-dictionaries.md)
* [Behavior change: File line column notation](./Behavior-change:-File-line-column-notation.md)
* [Step Summary](./Feature:-Step-Summary.md)
* [Sarif output](./Feature:-Sarif-output.md)
* [Suggest patterns](./Feature:-Suggest-patterns.md)
* [Update expect command-line](./Feature:-Update-expect-command-line.md)
* [Check commit messages](./Feature:-Check-commit-messages.md)
* [Restricted Permissions](./Feature:-Restricted-Permissions.md)
* [Minified file detection](./Feature:-Minified-file-detection.md)
* [Check filenames and paths `check-file-path`](https://github.com/check-spelling/check-spelling/wiki/Feature%3A-Check-filenames-and-paths#improvements-in-v0021)
* [Detect binary files](./Feature:-Detect-binary-files.md)
* [Disable word collating](./Feature:-Disable-word-collating.md)
* [Scan noisy files](./Feature:-Scan-noisy-files.md)
* [Workaround broken dependencies](./Feature:-Workaround-broken-dependencies.md)

## [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20)

* [Behavior change: Patterns masking character](./Behavior-change:-Patterns-masking-character.md)
* [Behavior change: Consumed line endings](./Behavior-change:-Consumed-line-endings.md)
* [Smarter scheduling 2021 October](./Feature:-Smarter-scheduling-2021-October.md)
* [Suppress push comment for open PRs](./Feature:-Suppress-push-comment-for-open-PRs.md)
* [Treat specific errors as warnings](./Feature:-Treat-specific-errors-as-warnings.md)
* [Run locally](./Feature:-Run-locally.md) using `act` (note: support for `act` is a bit of a moving target, but in general it should work)
* [Area dictionaries](./Feature:-Area-dictionaries.md)
* [Suggest Area dictionaries](./Feature:-Suggest-Area-Dictionaries.md)
* [Suppress comments](./Feature:-Suppress-comments.md)
* [Matrix support](./Feature:-Matrix-support.md)
* [Only changes](./Feature:-Only-changes.md)
* [Collapse older check comments](./Feature:-Collapse-older-check-comments.md)
* [Restricted Permissions](./Feature:-Restricted-Permissions.md)
* [Bug fix: Case changes should fail](./Bug-fix:-Case-changes-should-fail.md)
* [Play nice with `@dependabot`](https://github.com/check-spelling/check-spelling/wiki/@dependabot)
* [Check filenames and paths](./Feature:-check-filenames-and-paths.md)
* [Automatically truncate comment](./Feature:-Automatically-truncate-comment.md)
* [Perl module testing](./Feature:-Perl-module-testing.md)
* [Suggest commit after expect update](./Feature:-Suggest-commit-after-expect-update.md)
* [Forbidden patterns](./Feature:-Forbidden-patterns.md)
* [Configurable file size limits](./Feature:-Configurable-file-size-limits.md)
* [Duplicate word detection](./Feature:-Duplicate-word-detection.md)
* [Update with deploy key](./Feature:-Update-with-deploy-key.md)
* [Artifacts are zipped](./Breaking-change:-Artifacts-are-zipped.md)
* [User visible warning codes](./Feature:-User-visible-warning-codes.md)

## [v0.0.19](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.19)
❗ Please do not use versions older than this.

Information will be available in [GHSA-g86g-chm8-7r2p](https://github.com/check-spelling/check-spelling/security/advisories/GHSA-g86g-chm8-7r2p)

## [v0.0.18](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.18)

* [Behavior change: Dropping word stemming](./Behavior-change:-Dropping-word-stemming.md)
* [Behavior change: Ignoring two letter words](./Behavior-change:-Ignoring-two-letter-words.md)
* [Update expect list](./Feature:-Update-expect-list.md)
* [Collapse older check comments](./Feature:-Collapse-older-check-comments.md)
* [Suggest adding files to exclude](./Feature:-Heuristic-exclude-suggestions.md)
* [First run advice](./Feature:-First-run-advice.md)
* All unrecognized words are reported in the log, instead of just the ones introduced by the current changes.

## [0.0.17-alpha](https://github.com/check-spelling/check-spelling/releases/tag/0.0.17-alpha)

* [Feature: Easier bootstrapping](./Feature:-Easier-bootstrapping.md)
* [Feature: Spelling comments without config](./Feature:-Spelling-comments-without-config.md)
* [Feature: Run locally](./Feature:-Run-locally.md)
* [Feature: Versioned dictionaries](./Feature:-Versioned-dictionaries.md)
* [Feature: Support pull_request_target](./Feature:-Support-pull_request_target.md)

### Known issues

If you're using a private repository, the `push` event won't work correctly.

## [0.0.16-alpha](https://github.com/check-spelling/check-spelling/releases/tag/0.0.16-alpha)

* [Feature: Allow](./Feature:-Allow.md)
* [Feature: Expectlist](./Feature:-Expectlist.md)
* [Feature: Dictionary deltas](./Feature:-Dictionary-deltas.md)
* [Feature: Other shells](./Feature:-Other-shells.md)

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
