I've also been thinking about having the system do heuristics, if there are proportionally many items for a given file, it's probably worth suggesting to `exclude` the file.

Roughly implementation compares the number of unique dictionary words in a file with the number of unique non dictionary words in the file. If there are more non dictionary words, the file will be skipped.

To get a file to be checked, one will need to:
* add words to the dictionary (`allow.txt`)
* mask patterns (`patterns.txt`)
* reduce the number of non dictionary words (by fixing typos)