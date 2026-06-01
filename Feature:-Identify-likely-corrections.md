# Identify likely corrections

There are a couple of families of unrecognized words:

* proper nouns
* random text
* typos

Proper nouns and random text that aren't in the dictionary are also unlikely to have permutations that are particularly relevant in the dictionary.

On the other hand, typos tend to have short edit distance to words in the dictionary and specifically are likely to have a transposition or similar that is in the dictionary. It should be possible to do some post-processing to identify words that could have been mangled to produce the flagged item.
