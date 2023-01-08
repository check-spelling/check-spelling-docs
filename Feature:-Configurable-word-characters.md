# Configurable word characters

Right now, check-spelling only looks at `/(?i)[a-z']/` and generally with a [minimum run length of 3](Configuration#shortest_word).

## Caveats

Certain escaped characters are converted to decoded characters first.

## Spanish

To support Spanish, this needs to be extended to allow some accent characters and ñ.

## Unicode

[Unicode categories](https://www.compart.com/en/unicode/category)
* Ll, Lm, Lt, Lu

[Perl Unicode: General Category](https://perldoc.perl.org/perlunicode#General_Category)
 `[\p{Ll}\p{Lm}\p{Lt}\p{Lu}]`

## Dictionaries

In order for this to work reasonably well, support for hunspell `.aff` files will have to be added.

There are two possible approaches:
1. Treat `.aff` as a compression mechanism and decompress (either to generate dictionaries that can be downloaded or after downloading)
2. Somehow enable check-spelling to try to use the `.aff` files to perform lookups.

### compressed dictionaries

### reverse stemming dictionaries 

The second approach is probably more complicated but would reduce the memory costs in exchange for lookup complexity--basically each prefix and suffix would be checked against the token to see if a base token can be found in the dictionary. If one can be found, validate it against the mutations defined for it.

A line `hablar/x` would be converted into `hablar`=>`x`.

And `x`'s definition would be imported.

When `hablo` is encountered, it'd be checked against the `-o` suffix rule which would hopefully map to `/x` and suggest replacing `-o` with `-ar`.

## Proposal

- [x] Add a regex that's configured using `with:` (currently it's about half a dozen entries)

## Related

Right now, characters that fall outside the recognized set are effectively blanked (replaced with spaces). I might switch to only parsing characters that match the regex. That'd save me a pass.
