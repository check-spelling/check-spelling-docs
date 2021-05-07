# Warnings


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