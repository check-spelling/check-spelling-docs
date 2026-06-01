# Suggest Area Dictionaries

Included in [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20)

To make the out-of-the-box flow better, it'd be helpful if the tool
automatically suggested [Area Dictionaries](./Feature:-Area-dictionaries) to enable.

As the work to parallelize the spell checker yields lists of unknown words,
it's possible to check a number of potential supplemental dictionaries against
files and determine which ones would have the most benefit.

I'm still thinking about how best to do this, however I have an initial implementation.

It could be done against the final unknown list, or it could be done on
a per-file basis.

## Initial implementation

The initial implementation will report raw numbers for each dictionary it knows about (this list is configurable), and will sort by most matches to fewest.

Note that some dictionaries have a large number of typos (this is especially true of the `cpp` dictionary) and thus adding it will result in a lot of false-negatives (i.e. the spell checker will no longer flag a misspelled word as misspelled because the word is in its dictionary of "correctly" spelled words).

## Suggesting thresholds

I'm not sure what the threshold for suggesting a word list should be.

- covers `>x(%)` of the unknown words
- known word list covers `>x(%)` of the dictionary
- grows the known word list by `>x(%)`
- results in `>x(%)` files having `0` unknown words

### Samples

#### [tianocore/edk2-libc](https://github.com/tianocore/edk2-libc)

> ##### Unrecognized words (6658)
>
> Available dictionaries could cover words not in the dictionary
>
> - cspell:cpp/cpp.txt (104293) covers 1169 of them
> - cspell:lua/lua.txt (391) covers 53 of them

- cpp "covers `>x(%)` of the unknown words" for `x=17`
- lua "known word list covers `>x(%)` of the dictionary" for `x=13`

Note: there's overlap between **cpp** and **lua**, so merging in the cpp dictionary drops the apparent value of lua to 35 (just under 9%).

Arguably, dictionaries should be reviewed smallest to largest to give them an independent chance to be appreciated. But, generally as long as they're all scored at the same time (before application), they'll shine through.

You might wonder "why did the spell checker suggest lua?", the answer is that [Lua is in the EDK-II trunk](https://firmwaresecurity.com/2015/05/28/lua-for-uefi/).

## Future work

I intend to work through at least the cpp dictionary to weed out some portion of the misspelled words. Sadly, the dictionary has >100k entries, and thus it is a fairly daunting task.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
