# Warnings

## unrecognized-spelling

> Warning: reffy.js: line 27, columns 4-17, Warning - `compatilibity` is not a recognized word. (unrecognized-spelling)
> Warning: src/browserlib/extract-dfns.mjs: line 159, columns 11-20, Warning - `hyperlink` is not a recognized word. (unrecognized-spelling)

The token isn't in the dictionary

### Resolution

* If there's a correct word (e.g. `compatibility`), correct the spelling
* If the word should be in the dictionary, add it to `allow.txt`
* If a portion of the line shouldn't be checked, add a pattern to `patterns.txt` -- see [[Configuration Examples: patterns]]
* If it isn't really a word, but you're temporarily using it, add it to `expect.txt`

## noisy-file

> Warning: bridge/client/app/_models/metadata.ts: line 1, columns 1-1, Warning - Skipping `bridge/client/app/_models/metadata.ts` because there seems to be more noise (6) than unique words (3) (total: 6 / 7). (noisy-file)

This generally means that the file doesn't appear to be English.

Technically it means there are fewer unique dictionary words in the file than unique non-word tokens.

### Resolution

* If the file shouldn't be in the repository, `git rm` it (recently the tool flagged a spurious `.mp4` file)
* If the file shouldn't be checked, add a matching entry to `excludes.txt`
* If the file should be checked, some combination of:
  - add entries to the dictionary (via `allow.txt`)
  - mask runs of noise (via `patterns.txt`)

## whitespace-in-dictionary

> Warning: .github/actions/spelling/expect.txt: line 1, columns 5-6, Warning - entry has unexpected whitespace (whitespace-in-dictionary)

This generally means you have a mix of Dos and Unix line endings.

The tool generally assumes it's only going to see Unix line endings.

### Resolution

Use `dos2unix`.

e.g.:

```
dos2unix .github/actions/spelling/expect.txt > .github/actions/spelling/expect.txt.new && mv .github/actions/spelling/expect.txt.new .github/actions/spelling/expect.txt
```