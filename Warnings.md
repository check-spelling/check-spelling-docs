# Warnings

## noisy-file

> Warning: bridge/client/app/_models/metadata.ts: line 1, columns 1-1, Warning - Skipping `bridge/client/app/_models/metadata.ts` because there seems to be more noise (6) than unique words (3) (total: 6 / 7). (noisy-file)

This generally means that the file doesn't appear to be English.

Technically it means there are fewer unique dictionary words in the file than unique non-word tokens.

### Fix

* If the file shouldn't be checked, add a matching entry to `excludes.txt`
* If the file should be checked, some combination of:
  - add entries to the dictionary (via `allow.txt`)
  - mask runs of noise (via `patterns.txt`)

## whitespace-in-dictionary

> Warning: .github/actions/spelling/expect.txt: line 1, columns 5-6, Warning - entry has unexpected whitespace (whitespace-in-dictionary)

This generally means you have a mix of Dos and Unix line endings.

The tool generally assumes it's only going to see Unix line endings.

### Fix

Use `dos2unix`.

e.g.:

```
dos2unix .github/actions/spelling/expect.txt > .github/actions/spelling/expect.txt.new && mv .github/actions/spelling/expect.txt.new .github/actions/spelling/expect.txt
```