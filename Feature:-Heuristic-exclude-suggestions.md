# Heuristic exclude suggestions

I've also been thinking about having the system do heuristics, if there are proportionally many items for a given file, it's probably worth suggesting to `exclude` the file.

Roughly implementation compares the number of unique dictionary words in a file with the number of unique non dictionary words in the file. If there are more non dictionary words, the file will be skipped.

This is implemented in `0.0.18`. _prerelease_

To get a file to be checked, one will need to:
* add words to the dictionary (`allow.txt`)
* reduce the number of non dictionary by masking patterns (`patterns.txt`)
* reduce the number of non dictionary words (by fixing typos)

## Simple exclusion suggestions

I think initially if the number of files is large, I'll suggest that users look for entire directories to exclude, file names to exclude, or file extensions to exclude. (Pure static text)

## Advanced exclusion suggestions

The heuristics can also try to suggest ignoring common directories, common file names, or file extensions.

Note to self:
Currently the list of checked files [isn't persisted](https://github.com/check-spelling/check-spelling/blob/b07c0693e379e95c8d091519066bb2cec15e00d7/unknown-words.sh#L525-L526)

imagine it's in a file called `$checked_files`
the list of files to consider excluding is `$should_exclude_file`

### Directory path

Given open `$checked_files` and `$should_exclude_file` in parallel. Create a stack for each that counts the number of children of the current directory, upon leaving, compare w/ the parallel stack. If it's significant, suggest ignoring. Discard stack items upon moving to siblings, and add values to parents upon leaving children.

### File extensions

... are pretty easy:
```
get_extension_counts() {
cat | perl -ne 's{^.*/}{};next unless s{^.*\.}{.}; print' |sort |uniq -c|perl -pne 's{\s*(\d+)\s+(\.\S+)}{$2 $1}'
}
```

for each extension from `get_extension_counts` compare the should_exclude and checked values, and if the former is a significant portion of the latter, suggest excluding using `\.EXTENSION$`.

### File names

Like File extensions, but instead of capturing the rhs of the `.` for the filename, capture the whole filename.

## Scoring suggestions

1. Generate all reasonable regular expressions (this excludes ones where they match too many non excluded files)
2. Calculate the matching files for each (and the count of matching files)
3. Sort from most matches to fewest (tie-breaker being shorter regular expressions)
4. Loop through candidates, taking the first one
5. Add all of its files to the list of files no longer interesting
6. Go to the next candidate, subtract out no longer interesting files, and check its current count against the next candidate count
7. If it's still highest, select it
8. If it isn't, queue it to be rechecked at approximately where it should be in the scoring world and go to the next candidate
