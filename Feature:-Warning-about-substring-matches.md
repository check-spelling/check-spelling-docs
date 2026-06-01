# Substring matches

## Background

People, being humans, make mistakes. check-spelling's goal is to help humans recognize their mistakes and correct them.

Sometimes that means writing a pattern that results in check-spelling seeing a thing that isn't a word and isn't in the dictionary.

check-spelling parses lines using multiple passes. An early pass ignores user defined patterns (typically in a file named `patterns.txt`).

There are also some built in patterns: handling some C escapes (`\n`, `\r`, `\t`) and some html characters (`&apos;`, `&#39;`, `’`).

The user defined patterns and C escapes function as word boundaries and are generally mapped one character to one character.
The html escapes are mapped to `'` and are obviously not one character to one character. This matters because once check-spelling has found a term it doesn't recognize, it'd like to be able to tell you were it found it, but it no longer has the original line input (and the offsets for terms to the left of where it's looking may have shifted if an html escape has been resolved). So it goes back to the original input and looks for the term again. When it does this, it tries to find whole words that match the term it found while accounting for the fact that html could include an escape. If it finds a match, it's happy and you're happy.

When it doesn't find a match, you'll be left with some confusing output. Through [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21) that meant the list of misspelled words would tell you about the token it found and hope you didn't notice it didn't tell you were it found it (because it couldn't find it when it looked more carefully). With [v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22), it should tell you about the line that it found the token on, and you might be brought to this documentation and be wondering "ok, it found it on the line, what do I do?".

## Guessing

As of [v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22), if there's only one match, check-spelling will identify it even if it the word boundary rules didn't enable it to be confident.

## Sample

### Example input

`README.html`:

```markdown
The fuzziest armies&apos; armor has vulnerabilities; allies&#39; assets aren't everything.
```

`.github/actions/spelling/patterns.txt`

```perl
# docker container
[a-z,0-9]{12}
```

### Discussion

When check-spelling processed the file, it ended up with this content:

```
The fuzziest armies' armor has ============ies= allies' assets aren't everything=
```

It found `ies` which wasn't in its dictionary and then went back to the original line.

There are lots of cases of `ies` in the original line:

```markdown
The fuzziest _armies_&apos; armor has _vulnerabilities_; _allies_&#39; assets aren't everything.
```

It doesn't want to flag the wrong one(s), so it tries to only find instances that appear to cover entire words, not merely substrings.

Here, it can't find the right one. So, it'll just tell you that it found it on the line.

## Troubleshooting

If check-spelling told you which line caused the problem, you can skip straight to [reducing patterns](#reducing-patterns).

### Reducing file scope

Modern versions of check-spelling generate a `check-spelling-comment` artifact which is a `.zip` file containing an `artifact.zip`.

1. Download the `check-spelling-comment` artifact.
2. Extract the contents of `artifact.zip` (yes, it's two layers of nesting -- this improved artifact upload times...).
3. Look for a file called `checked_files.lst` - this is a `NUL` (`\0`) delimited list of filenames. (Mostly these are files in the repository, although depending on configuration there may be files check-spelling synthesized, or the workflow could have injected files...).
4. You can use `excludes.txt` or `only.txt` to reduce the list of files in the next run. I'd suggest adding entries to roughly halve the number of items in the next run -- you're basically performing a binary search -- when you get a miss, select the reverse and halve it instead.
5. Push (or use [`act`](https://github.com/nektos/act)) to see if the confusing output goes away.
6. Repeat 1-5 until you can isolate the problematic content to a single file.
7. Once you have a single file, you can cut the file in half and repeat the analysis until you have a single line.

#### Null delimited files

If you want to see the list of files, you can do:

```sh
cat checked_files.lst | xargs -0 -n1
```

If you want to do something with them, you can do:

```sh
cat checked_files.lst | xargs -0 -n1 SOMETHING...
```

### Reducing Patterns

Once you have a single line, you can try commenting out half of your `patterns.txt` entries and seeing if the problem goes away.

Keep commenting out entries until it does. When it does, uncomment some entries and comment out different ones (generally trying to comment out half of the entries with each pass).

### Analysis

Once you have something like the [example input](#example-input), you'll get to think through the pattern.

In the example, `[a-z,0-9]{12}` is designed to match 12 characters (including a comma??), but it doesn't care if the characters it found are exactly 12, or merely a substring of a longer run of characters. That meant that `vulnerabilities` was matched as:

```markdown
**vulnerabilit**ies
```

Which left the dangling `ies`.

### Fix

Here, adding some `\b`s will work magic:

```diff
 # docker container
-[a-z,0-9]{12}
+\b[a-z,0-9]{12}\b
```

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
