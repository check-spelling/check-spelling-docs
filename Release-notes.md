# Release notes

## Supported

- [prerelease](#prerelease)
- [v0.0.26](#v0026)

## Unsupported

❗ Please do not use these versions.

- [v0.0.24](#v0024)
- [v0.0.23](#v0023)
- [v0.0.22](#v0022)
- [v0.0.21](#v0021)
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

## v0.0.26

[v0.0.26](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.26)

- ℹ️ [[Unused configuration file warning|Feature: Unused configuration file warning]]
- ⏭️ [[Ignore next line|Feature: ignore‐next‐line]]
- 🏴 [[Flag homoglyphs in words|Feature: Flag homoglyphs in words]]
- ⚙️ [`config.json`](https://github.com/check-spelling/check-spelling/wiki/Configuration-Files#config) for defining configuration using `json` instead of in workflows. This should make it easier to merge configuration/use unified configuration. It also enables `load-config-from`
- ⚙️ [`load-config-from`](https://github.com/check-spelling/check-spelling/wiki/Configuration#load-config-from) -- GitHub changed the behavior of workflows running via `pull_request_target` to rely on the default branch for configuration.  You can use this setting to allow interpreting specific settings from `config.json` from the base branch (or the head branch).
- [Permission check for pull requests from forks](https://github.com/check-spelling/check-spelling/issues/103) -- GitHub broke an API at the beginning of April 2026
- Ignore `suppress_push_for_open_pull_request` when [pull requests are disabled](https://github.blog/changelog/2026-02-13-new-repository-settings-for-configuring-pull-request-access/)
- [Git config is no longer edited](https://github.com/check-spelling/check-spelling/issues/94)
- Fix GitHub code scanning detection -- GitHub changed the response previously used to identify its availability
- Waits for hunspell dictionary downloads to resolve before proceeding to check spelling
- Switched to using UTF8
- Switched from `:...:` to unicode emoji
- Improved pattern parsing and handling of broken patterns
- Removed most use of `rsync`
- Comment task no longer requires a `checkout` (all information is produced in the `spelling` task and packaged in the artifact)
- Added `allow-hunspell` -- for use as `allow-hunspell: false` to disable hunspell support
- Improved YAML parsing
- Candidate and Forbidden Patterns will now automatically expand if there are only **one** or **two**

## v0.0.25

[v0.0.25](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.25)

- 🩸 [[Breaking Change: Code Scanning action requires a Code Scanning Ruleset]]
- 🩸 [[Breaking Change: Dropping support for out of tree project files|Breaking Change: Dropping support for out of tree project files]]
- 🩸 [[Breaking change: Dropping support for on: schedule|Breaking change: Dropping support for on: schedule]]
- 🪆 [[Subrepos|Feature: Subrepos]]
- 🔒 [[Automatically remove persisted‐credentials|Feature: Automatically remove persisted‐credentials]]
- 🩺 [[Diagnose failed checkouts|Feature: Diagnose failed checkouts]]

## v0.0.24

[v0.0.24](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.24)

- [SARIF reports will upload on `push` / if the action performs the checkout](https://github.com/check-spelling/check-spelling/issues/71)
- [`followup` should not be set unless a comment needs to be made/collapsed](https://github.com/check-spelling/check-spelling/issues/70)
- [Files with Mac OS (`\r`) line endings will not trigger `minified-file` warnings](https://github.com/check-spelling/check-spelling/issues/75)
- [`GITHUB_TOKEN` is no longer listed as `required`](https://github.com/check-spelling/check-spelling/issues/42)

## v0.0.23

[v0.0.23](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.23)

- 🏃 [[Run from command line|Feature: Run from command line]]
- 🎏 [[Set event severity|Feature: Set event severity]]
- 🎏 [[Breaking change: events not listed in warnings and notices will not be promoted to errors|Feature: Set event severity]]
- 💬 [[Report associated comment for forbidden patterns|Feature: Report associated comment for forbidden patterns]]

...

## v0.0.22

[v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22)

- ❄️ [[Dictionaries with unique value|Feature: Dictionaries with unique value]]
- 🥷 [[Suggest dictionaries when dictionaries aren't available|Feature: Suggest dictionaries when dictionaries aren't available]]
- 🐫 [[Parallel dictionary retrieval|Feature: Parallel dictionary retrieval]]
- 🍳 [[Reorganized cspell Dictionaries in v0.0.22|Breaking Change: Reorganized cspell Dictionaries in v0.0.22]]
- 🗑️ [[Removed Dictionaries]]
- 📗 [[K8s|Dictionary: K8s]]
- 📙 [[Lisp|Dictionary: Lisp]]
- 📊 [[Improve suggested dictionaries order|Feature: Improve suggested dictionaries order]]
- 🎨 [Adjust SARIF output](https://github.com/check-spelling/check-spelling/wiki/Feature:-SARIF-output#adjusting-sarifjson)
- 🧾 [[Summary Table|Feature: Summary Table]]
- ⏱️ [[Timing Report|Feature: Timing Report]]
- 🃏 [[Warning about substring matches|Feature: Warning about substring matches]]
- 🙊 [Masked content will be excluded from minified file detection](https://github.com/check-spelling/check-spelling/wiki/Feature:-Minified-file-detection#masked-content-will-be-excluded-from-accounting)
- 🐣 [[Breaking change: Dropping printf special cases]]
- 📝 [[Report instances of items that used to be covered by a now missing expect entry|Bug fix: Report instances of items that used to be covered by a now missing expect entry]]
- 🔢 [[Fix error counts for Check filenames and paths|Feature: Check filenames and paths]]
- ⌛ [[Parsing Timeouts|Feature: Parsing Timeouts]]
- 🙈 [Advanced exclusion suggestions](https://github.com/check-spelling/check-spelling/wiki/Feature:-Heuristic-exclude-suggestions#advanced-exclusion-suggestions)
- 🔁 [[Handle GitHub Varnish failures|Feature: Handle GitHub Varnish failures]]
- 🗒️ [Plain text version of expect updates for people who do not want to run perl](https://github.com/check-spelling/check-spelling/wiki/Accepting-Suggestions#preformatted-commit-v0022)
- 💔 [[Breaking Change: Dropping support for broken act]]
- 📆 [[🗣️ Breaking change: Dropping support for on: schedule|Breaking change: Dropping support for on: schedule]]
- 🗣️ [[Support for non English languages|Feature: Support for non English languages]]
- 🗣️ [[Non-English languages|Feature: Non-English languages]]
- 🚆 [[Hunspell dictionary support|Feature: Hunspell dictionary support]]
- 🔢 [[Configurable word characters|Feature: Configurable word characters]]
- 🧙 [[Character Encoding Auto Detection|Feature: Character Encoding Auto Detection]]
- 🩹 [Pattern suggestions shouldn't trip over active patterns](https://github.com/check-spelling/check-spelling/wiki/Feature:-Suggest-patterns#multiple-patterns-for-a-line)
- 🏃 Performance fix for workflows that don't use patterns / forbidden / candidates
- 🔧 Matrixes generate archives that the latest apply.pl can consume (fixes regression in [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21))
- 🔧 Matrixes generate SARIF reports with distinct categories enabling them all to render properly (fixes bug in [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21))

## v0.0.21

[v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21)

- [[Breaking change: Smaller cspell dictionaries]]
- [[Behavior change: File line column notation]]
- [[Step Summary|Feature: Step Summary]]
- [[SARIF output|Feature: SARIF output]]
- [[Suggest patterns|Feature: Suggest patterns]]
- [[Update expect command-line|Feature: Update expect command-line]]
- [[Check commit messages|Feature: Check commit messages]]
- [[Restricted Permissions|Feature: Restricted Permissions]]
- [[Minified file detection|Feature: Minified file detection]]
- [Check filenames and paths `check-file-path`](https://github.com/check-spelling/check-spelling/wiki/Feature%3A-Check-filenames-and-paths#improvements-in-v0021)
- [[Detect binary files|Feature: Detect binary files]]
- [[Disable word collating|Feature: Disable word collating]]
- [[Scan noisy files|Feature: Scan noisy files]]
- [[Workaround broken dependencies|Feature: Workaround broken dependencies]]

## v0.0.20

[v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20)

- [[Behavior change: Patterns masking character|Behavior change: Patterns masking character]]
- [[Behavior change: Consumed line endings]]
- [[Smarter scheduling 2021 October|Feature: Smarter scheduling 2021 October]]
- [[Suppress push comment for open PRs|Feature: Suppress push comment for open PRs]]
- [[Treat specific errors as warnings|Feature: Treat specific errors as warnings]]
- [[Run locally|Feature: Run locally]] using `act` (note: support for `act` is a bit of a moving target, but in general it should work)
- [[Area dictionaries|Feature: Area dictionaries]]
- [[Suggest Area dictionaries|Feature: Suggest Area Dictionaries]]
- [[Suppress comments|Feature: Suppress comments]]
- [[Matrix support|Feature: Matrix support]]
- [[Only changes|Feature: Only-changes]]
- [[Collapse older check comments|Feature: Collapse older check comments]]
- [[Restricted Permissions|Feature: Restricted Permissions]]
- [[Bug fix: Case changes should fail]]
- [Play nice with `@dependabot`](https://github.com/check-spelling/check-spelling/wiki/@dependabot)
- [[Check filenames and paths|Feature: Check filenames and paths]]
- [[Automatically truncate comment|Feature: Automatically truncate comment]]
- [[Perl module testing|Feature: Perl module testing]]
- [[Suggest commit after expect update|Feature: Suggest commit after expect update]]
- [[Forbidden patterns|Feature: Forbidden patterns]]
- [[Configurable file size limits|Feature: Configurable file size limits]]
- [[Duplicate word detection|Feature: Duplicate word detection]]
- [[Update with deploy key|Feature: Update with deploy key]]
- [[Artifacts are zipped|Breaking change: Artifacts are zipped]]
- [[User visible warning codes|Feature: User visible warning codes]]

## v0.0.19

[v0.0.19](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.19)

Information is available in [GHSA-g86g-chm8-7r2p](https://github.com/check-spelling/check-spelling/security/advisories/GHSA-g86g-chm8-7r2p)

## v0.0.18

[v0.0.18](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.18)

- [[Behavior change: Dropping word stemming]]
- [[Behavior change: Ignoring two letter words]]
- [[Update expect list|Feature: Update expect list]]
- [[Collapse older check comments|Feature: Collapse older check comments]]
- [[Suggest adding files to exclude|Feature: Heuristic exclude suggestions]]
- [[First run advice|Feature: First run advice]]
- All unrecognized words are reported in the log, instead of just the ones introduced by the current changes.

## v0.0.17

[0.0.17-alpha](https://github.com/check-spelling/check-spelling/releases/tag/0.0.17-alpha)

- [[Feature: Easier bootstrapping]]
- [[Feature: Spelling comments without config]]
- [[Feature: Run locally]]
- [[Feature: Versioned dictionaries]]
- [[Feature: Support pull_request_target]]

### Known issues

If you're using a private repository, the `push` event won't work correctly.

## v0.0.16

[0.0.16-alpha](https://github.com/check-spelling/check-spelling/releases/tag/0.0.16-alpha)

- [[Feature: Allow]]
- [[Feature: Expectlist]]
- [[Feature: Dictionary deltas]]
- [[Feature: Other shells]]
