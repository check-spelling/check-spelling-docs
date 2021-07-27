# Release notes

## prerelease
<!--🛠️ In various states of `prerelease`-->
🌟 Almost ready to transition from `prerelease` to release 🍽️

* [[Suppress push comment for open PRs|Feature: Suppress push comment for open PRs]]
* [[Run locally|Feature: Run locally]] using `act` (note: support for `act` is a bit of a moving target, but in general it should work)
* [[Area dictionaries|Feature: Area dictionaries]]
* [[Suggest Area dictionaries|Feature: Suggest Area Dictionaries]]
* [[Suppress comments|Feature: Suppress comments]]
* [[Matrix support|Feature: Matrix support]]
* [[Only changes|Feature: Only-changes]]
* [[Collapse older check comments|Feature: Collapse older check comments]]
* [[Restricted Permissions|Feature: Restricted Permissions]]
* [Play nice with `@dependabot`](@dependabot)

## v0.0.19

❗ Please do not use versions older than this.

Information will be available in [GHSA-g86g-chm8-7r2p](https://github.com/check-spelling/check-spelling/security/advisories/GHSA-g86g-chm8-7r2p)

## v0.0.18

* [[Behavior change: Dropping word stemming]]
* [[Behavior change: Ignoring two letter words]]
* [[Update expect list|Feature: Update expect list]]
* [[Collapse older check comments|Feature: Collapse older check comments]]
* [[Suggest adding files to exclude|Feature: Heuristic exclude suggestions]]
* All unrecognized words are reported in the log, instead of just the ones introduced by the current changes.

## 0.0.17-alpha

* [[Feature: Easier bootstrapping]]
* [[Feature: Spelling comments without config]]
* [[Feature: Run locally]]
* [[Feature: Versioned dictionaries]]
* [[Feature: support pull_request_target]]

### Known issues

If you're using a private repository, the `push` event won't work correctly.

## 0.0.16-alpha

* [[Feature: Allow]]
* [[Feature: Expectlist]]
* [[Feature: Dictionary deltas]]
* [[Feature: Other shells]]
