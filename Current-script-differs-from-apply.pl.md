# Current script differs from `apply.pl`

check-spelling offers an [`apply.pl` script to enable update expect command line](./Feature:-Update-expect-command-line).

The design of `apply.pl` was such that some could choose to save `apply.pl` locally, **audit it**, and then use it to apply updates.

New versions of check-spelling will include improvements to `apply.pl`. In order to let users know that the version they've saved locally is no longer current, `apply.pl` includes code to compare the version it has with a specific version and warn if it's out of date. (This would apply to users of `main`, `prerelease`, and potentially a versioned release branch in case it received additional updates.)

Unfortunately, as of [check-spelling v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22), the version of `apply.pl` points to the [`prerelease` version of `apply.pl`](https://raw.githubusercontent.com/check-spelling/check-spelling/prerelease/apply.pl) which means that people using/running that version will encounter a warning that the version that's running (v0.0.22) is out of date (as there are new features in `prerelease`). This is a _harmless_ 🐛.

## Fixes

* 📓 I intend to change the release process so that the next release's `apply.pl` points to the version of `apply.pl` from the release instead of the `prerelease`.
* 📓 `main` will point to `main` so that it will be out of date less often.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
