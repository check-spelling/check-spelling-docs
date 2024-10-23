# Run from command line

A number of users want to be able to run check-spelling without needing to rely on GitHub Actions.

## Implementation

`unknown-words.sh` has been adjusted so that if it doesn't find enough of a GitHub environment, it will emulate the pieces it's missing.

`t/UnknownWords.sh` includes test coverage to ensure that the feature should work going forward.

## Using check-spelling without GitHub workflows

1. clone https://github.com/check-spelling/check-spelling/ and check out a branch with support (`@prerelease`, or `v0.0.23`+)
2. `cd` to a directory containing a `.git` repository that you'd like to check
3. `export INPUTS='$WITH_PARAMETERS_FOR_CHECK_SPELLING_ACTION_AS_JSON'` to specify any fields that would normally be specified using `with:`. (See [Configuration](Configuration.md) for parameter documentation.)
   * e.g. you could use `INPUTS='{"config":".gitea/actions/spelling"}'` to specify the check-spelling metadata directory.
4. run `$PATH_TO_CHECK_SPELLING_REPOSITORY/unknown-words.sh`
5. review the output.

## More information

For more information, see the tests ([`t/UnknownWords.t`](https://raw.githubusercontent.com/check-spelling/check-spelling/prerelease/t/UnknownWords.t)).

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
