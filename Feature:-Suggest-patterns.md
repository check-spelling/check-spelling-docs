Currently there is code to suggest dictionaries, it runs as a pass after all unrecognized words have been collected and then sees which words match which lists.

There are a couple of ways to consider patterns:

* [How many lines would a pattern match](#how-many-lines-would-a-pattern-match)
* [After a word is found to not be in the dictionary](#after-a-word-is-found-to-not-be-in-the-dictionary)

## How many lines would a pattern match

This could be run after applying current patterns but before checking words against the dictionary

### Cons

This might scale poorly (each line of each file cross each pattern).

I'm experimenting with this in `prerelease` post the 0.0.20 release.

## After a word is found to not be in the dictionary

After finding a word, in order to report the word's position in the unmasked line, the original line is rescanned. It would be possible to apply a mask at this point.

### Cons

If a pattern is bad, it could introduce unrecognized words that aren't naturally present. - Suggestions should be curated, so this shouldn't be a real problem.

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

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
