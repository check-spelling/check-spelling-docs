# What does each dictionary cover

## Background

If you're reading this, you've probably seen a comment from @check-spelling suggesting that you could add a dictionary (or dictionaries) to reduce the number of entries in `expect.txt`.

## Brute force

The laziest way to answer this question is to add one suggested dictionary to the workflow (along with 1 uncovered typo like `xaxxxxxxxzzzzzzaaaaa` -- to ensure there's a comment), and see the list of words that the action suggests to remove.

Repeating this for each suggested dictionary will work, although there are various downsides, especially that it's likely multiple dictionaries will cover certain words, so the order in which you apply dictionaries will impact which dictionary is credited with a word.

## Manual

You can download each dictionary (the comment includes links to them) and then manually compare `expect.txt` to each dictionary.

This would understandably be quite tedious.

## Script

It's possible to leverage [Looking for items locally](Looking-for-items-locally.md) to merge the contents of `expect.txt` (or `expect/*.txt`) and then use it to effectively _grep_ (using `perl` as there are a number of quirks which means _grep_ won't work) against each dictionary.

(Script to follow, hopefully...)

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
