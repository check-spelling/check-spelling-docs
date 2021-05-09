# Area dictionaries

## Proposal

Allow users to just pull in [streetsidesoftware/cspell-dicts](https://github.com/streetsidesoftware/cspell-dicts/tree/master/dictionaries/).

This will be much easier than doing the work of building/maintaining them.

Implemented in `prerelease` as:

```yaml
    - uses: check-spelling/check-spelling@prerelease
      with:
        extra_dictionaries:
          cspell:css/css.txt
          cspell:html/html.txt
```

These values should work although most aren't tested:
```
cspell:ada/ada.txt
cspell:aws/aws.txt
cspell:bash/bash-words.txt
cspell:companies/companies.txt
cspell:cpp/cpp.txt
cspell:csharp/csharp.txt
cspell:css/css.txt
cspell:django/django.txt
cspell:dotnet/dotnet.txt
cspell:el/src/Greek.txt
cspell:elixir/elixir.txt
cspell:en_GB/src/wordsEnGb.txt
cspell:filetypes/filetypes.txt
cspell:fonts/fonts.txt
cspell:fullstack/fullstack.txt
cspell:golang/go.txt
cspell:haskell/haskell.txt
cspell:html/html.txt
cspell:java/java.txt
cspell:latex/latex.txt
cspell:lua/lua.txt
cspell:node/node.txt
cspell:npm/npm.txt
cspell:php/php.txt
cspell:python/python.txt
cspell:ruby/ruby.txt
cspell:rust/rust.txt
cspell:scala/scala.txt
```

## Notes

* For items that are single word-per-line, this will just work.
* For companies which is a multi word string per line, they could either be converted into patterns or split on whitespace -- treating each individual word as legal. (The latter is easier.)

The current version ignores any line with characters outside [A-Za-z'].

## Areas

* Colors
  * HTML/CSS -- https://drafts.csswg.org/css-color-3/
  * Pantone
  * X11
  * ?
* Companies
  * Tech
  * Fortune -- https://github.com/cmusam/fortune500/
  * Stock Exchange lists
    * NASDAQ -- https://datahub.io/core/nasdaq-listings (probably only the `Q,N,N,` status companies)
    * NYSE
    * ...
* Countries
  * ccTLDs -- https://github.com/incognico/list-of-top-level-domains
* Domains
  * Alexa
* Jargon
  * Lorem -- https://www.lipsum.com/
* Names
  * Common
  * Emoji (for, e.g., :smile:)
  * HTML entities -- https://dev.w3.org/html5/html-author/charref (css: .named)
  * GitHub
    * Projects
    * Users
  * Major Twitter users?
  * Unicode entities
  * OpenHub
    * Projects
    * Contributors
* Programming language keywords -- See [programming-languages](https://github.com/collections/programming-languages) for ideas?
  * Basic
  * C
  * C++
  * C#
  * CSS
  * Go
  * HTML
  * Java
  * JavaScript
  * Perl
  * PHP
  * Python
  * Scala
  * Shell
  * SVG
  * TypeScript
  * ...
* Licenses
  * creativecommons
  * MPL
  * GPL
  * ...
