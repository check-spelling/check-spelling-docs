Currently, by default check-spelling retrieves [https://github.com/check-spelling/check-spelling/blob/dictionary/dict.txt](https://github.com/check-spelling/check-spelling/blob/dictionary/dict.txt) and then consumers can replace (using `dictionary`) or augment (`allow`) / redact (`reject`) additional words.

I plan to make to changes:
1. Only download the dictionary if users aren't supplying their own (using `dictionary`)
1. Give the dictionary a tag and have each release download a release pinned version

Going forward, this will enable me to update the dictionary by, e.g. removing [Archaic words](Archaic-words) or adding words that are commonly used by consumers.