# <img alt="check-spelling logo" src="https://github.com/check-spelling/art/blob/master/logo/spell-check.png" width="30"> check spelling action

The [check-spelling](https://github.com/marketplace/actions/check-spelling) GitHub action enables you to catch misspellings.

Everyone makes typos. This includes people writing documentation and comments,
but it also includes programmers naming variables, functions, apis, classes,
and filenames.

Often, programmers will use `InitialCapitalization`, `camelCase`,
`ALL_CAPS`, or `IDLCase` when naming their things. When they do this, it makes
it much harder for naive spelling tools to recognize misspellings, and as such,
with a really high false-positive rate, people don't tend to enable spellchecking
at all.

This action's tools are capable of tolerating all of those variations.
Specifically, [w](https://github.com/jsoref/spelling/blob/master/w) understands
enough about how programmers name things that it can split the above conventions
into word-like things for checking against a dictionary.

* [[Showcase]]
* [[Configuration information]]
* [[Possible features]]