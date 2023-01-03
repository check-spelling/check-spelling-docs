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

## Proposal

Add a regex that's configured using `with:`

## Related

Right now, characters that fall outside the recognized set are effectively blanked (replaced with spaces). I might switch to only parsing characters that match the regex. That'd save me a pass.
