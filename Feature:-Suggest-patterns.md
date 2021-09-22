Currently there is code to suggest dictionaries, it runs as a pass after all unrecognized words have been collected and then sees which words match which lists.

There are a couple of ways to consider patterns:

* [How many lines would a pattern match](#how-many-lines-would-a-pattern-match)
* [After a word is found to not be in the dictionary](#after-a-word-is-found-to-not-be-in-the-dictionary)

## How many lines would a pattern match

This could be run after applying current patterns but before checking words against the dictionary

### Cons

This would scale poorly (each line of each file cross each pattern).

## After a word is found to not be in the dictionary

After finding a word, in order to report the word's position in the unmasked line, the original line is rescanned. It would be possible to apply a mask at this point.

### Cons

If a pattern is bad, it could introduce unrecognized words that aren't naturally present. - Suggestions should be curated, so this shouldn't be a real problem.
