# Suggest patterns

## Background

As of [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20), there was code to suggest dictionaries, it runs as a pass after all unrecognized words have been collected and then sees which words match which lists.

It made sense to be able to suggest patterns to a similar effect as check-spelling suggesting dictionaries.

There are a couple of ways to consider patterns:

- [How many lines would a pattern match](#how-many-lines-would-a-pattern-match)
- [After a word is found to not be in the dictionary](#after-a-word-is-found-to-not-be-in-the-dictionary)

## How many lines would a pattern match

This could be run after applying current patterns but before checking words against the dictionary.

### Cons

This might scale poorly (each line of each file cross each pattern).

I'm experimenting with this in the [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21) release.

## After a word is found to not be in the dictionary

After finding a word, in order to report the word's position in the unmasked line, the original line is rescanned. It would be possible to apply a mask at this point.

### Cons

If a pattern is bad, it could introduce unrecognized words that aren't naturally present. - Suggestions should be curated, so this shouldn't be a real problem.

This turned out to be a bit of a problem which is partially addressed in [v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22) with the introduction of [`token-is-substring`](Event-descriptions#token-is-substring).

## Poor patterns

### Greedy

This is an example of a pattern that is great once the corpus has been heavily filtered, but not great when applied too eagerly:

```
# version suffix <word>v#
[Vv]\d+(?:\b|(?=[a-zA-Z_]))
```

### Not demanding enough

This isn't a bad pattern, but it isn't useful as is:

```
# set arguments
\bset\s+-[abefimouxE]+\b
```

It would match:

`set -e`, but `set` is in the dictionary, and `e` is too short to be checked. To be a useful pattern, it would need to be something more like:

```
# set arguments
\bset(?:\s+-[abefimouxE]{1,2})*\s+-[abefimouxE]{3,}(?:\s+-[abefimouxE]+)*
```

## Multiple patterns for a line

Prior to [v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22), applied pattern content was internally masked using `=`. This unfortunately meant that a suggested pattern that looked for a `=` might match on an active pattern even though the underlying content didn't have a `=` and thus the pattern shouldn't apply.

### Scenario

`patterns.txt`:

```
# Ignore any text between inline back-ticks
`(.{2,}?)`
```

`candidate.patterns`:

```
>[-a-zA-Z=;:/0-9+]+=</
```

`sdd.md`:

```md
<a name="bufferSendIn">`bufferSendIn`</a> 
```

### [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21)

The above would trigger this erroneous suggestion:

```
`Line` matches candidate pattern `>[-a-zA-Z=;:/0-9+]+=</` (candidate-pattern)
```

### [v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22)

The way pattern suggestions are calculated has been improved such that these erroneous suggestions should not happen.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
