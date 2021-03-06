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

## bad-regex

> Warning: .github/actions/spelling/patterns.txt: line 5, columns 1-9, Warning - bad regex (bad-regex)

Perl 5 didn't like your regular expression.

The log should actually provide a more detailed message from Perl.

You can testing your pattern with [Regular Expression Test Page for Perl](https://www.regexplanet.com/advanced/perl/).

The tool generally doesn't apply flags that significantly modify evaluation (it might apply `/g`).

## no-newline-at-eof

This means that you used a tool that didn't include a newline at the end of your text file.

Unix tools get quite upset and confused by this.

(git) `diff` and `patch` get frustrated and will yield odd jitter markings because of it.

`wc -l` will not treat the last line of your file as a file (an off by one error of sorts).

### Resolution

`echo >> file`

Or open it in a text editor that will fix it for you (`vi`, `nano`, ...).

## non-alpha-in-dictionary

Dictionary entries are composed of 26 letters (`a-z` in both uppercase and lowercase), apostrophe (`'`), and a newline (`\n`).

Words are generally at least 3 characters long. (This is tunable.)

If you include any other characters (including `-`), the entry will be ignored.

This is mostly a matter of pragmatism. You might be worried that the tool doesn't know the color `sea-green`, that's ok, the tool doesn't _see_ `sea-green`, it ignores the `-` and sees the words `sea` and `green`, and unless you remove one or both of those words from its dictionary (using `reject.txt`), it will accept both.

Since it doesn't see `sea-green` as a single word, trying to add `sea-green` to your dictionary won't work.

### Resolution

* If the word you're trying to put in the dictionary is `pre-emptively`, just replace all instances of it with `preemptively`

If you want to accept `avii-ridge` in your repository, you can:
* add `avii` to your dictionary (by adding it to `allow.txt`),
* add `\bavii-ridge\b` in `patterns.txt`, or
* add `avii` to `expect.txt`.

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