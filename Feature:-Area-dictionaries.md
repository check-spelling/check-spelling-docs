# Area dictionaries

Included in [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20)

## Basic implementation

You can pull in any public url that has a flat list of words.

By default, you can easily pull in dictionaries from [streetsidesoftware/cspell-dicts](https://github.com/streetsidesoftware/cspell-dicts/tree/master/dictionaries/).

Implemented in [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20) as:

```yaml
    - uses: check-spelling/check-spelling@v0.0.20
      with:
        extra_dictionaries:
          cspell:css/css.txt
          cspell:html/html.txt
```

You can define other prefixes using `dictionary_source_prefixes`, the default definition is something like (but generally using some tag):

```yaml
    - uses: check-spelling/check-spelling@v0.0.20
      with:
        dictionary_source_prefixes: >
          {
            "cspell": "https://raw.githubusercontent.com/check-spelling/cspell-dicts/master/dictionaries/"
          }
```

(You can also redefine `cspell`, e.g. to change the _branch_ or _repository_.)

### `cspell` dictionaries

These `cspell:` dictionaries should work although most aren't tested:

```
cspell:ada/ada.txt
cspell:aws/aws.txt
cspell:bash/bash-words.txt
cspell:companies/companies.txt
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

Note, while `cspell:cpp/cpp.txt` exists, it includes too many typos to be included by default.

### Notes

- For items that are single word-per-line, this will just work.
- For companies which have multiple words on a line (e.g. `Johny's Farming Ltd.`), they could either be converted into patterns or split on whitespace -- treating each individual word as legal. (The latter is easier.)
- A number of these dictionaries include misspelled words.
  - You may want to review them and add words to `reject.txt`
  - If you're keeping track of which dictionary contributed, `reject/cpp.txt`, e.g.
    ```
    definitions
    ```

The current version ignores any line with characters outside `[A-Za-z']` (because those are effectively the only characters that the spell checker will consider part of a word, and thus a word containing any character not in the set will never match anything).

## FAQ

### Why can't I limit certain dictionaries to certain file types?

It isn't impossible to change this, however it's quite possible for a word to be applied for a language (.cpp, .lua) and then referenced in documentation (.txt, .rst, .md, .html, ...). Or if code is cross called, a lua item might be referenced in a cpp file.

So far, the cost of preprocessing the dictionary for each possible file extension (which would have to be done up front, as there are multiple spell checking processes that run concurrently) appears to exceed the complexity and time required to support some other strategy.

Most of the time carrying extra words in the dictionary won't actually matter.

About the only time it does is for `elif` / `elsif` -- where one programming language likes one thing and the other is a syntax error. For that, recommended practice is a compiler/linter instead of relying on the spell checker, if you have both "words" in code, they could easily both be referenced in documentation, and thus they're both words, it's just that in certain circumstances you want to use one and not the other, that's effectively grammar and not spelling.

That said, if you really want to be fancy, you can use a matrix and apply certain dictionaries only in certain circumstances. While this isn't recommended, it is possible.

## Assembly dictionaries

A first draft has been added for [assembly-dictionaries](https://github.com/check-spelling/assembly-dictionaries/tree/20231110).

Testing in prerelease versions of check-spelling/spell-check-this started October 2025.

## Future work

[Suggest Area dictionaries](./Feature:-Suggest-Area-Dictionaries)

## Potential Areas

- Colors
  - HTML/CSS -- https://drafts.csswg.org/css-color-3/
  - Pantone
  - X11
  - ?
- Companies
  - Tech
  - Fortune -- https://github.com/cmusam/fortune500/
  - Stock Exchange lists
    - NASDAQ -- https://datahub.io/core/nasdaq-listings (probably only the `Q,N,N,` status companies)
    - NYSE
    - ...
- Countries
  - ccTLDs -- https://github.com/incognico/list-of-top-level-domains (this is probably less useful as check-spelling doesn't generally care about 2 letter tokens)
- Domains
  - https://data.iana.org/TLD/tlds-alpha-by-domain.txt
  - Alexa
- Jargon
  - Lorem -- https://www.lipsum.com/
- Names
  - Common
  - Emoji (for, e.g., :smile:)
  - HTML entities -- https://dev.w3.org/html5/html-author/charref (css: .named)
  - GitHub
    - Projects
    - Users
  - Major Twitter users?
  - Unicode entities
  - OpenHub
    - Projects
    - Contributors
- Programming language keywords -- See [programming-languages](https://github.com/collections/programming-languages) for ideas?
  - Basic
  - C
  - C++
  - C#
  - CSS
  - Go
  - HTML
  - Java
  - JavaScript
  - Perl
  - PHP
  - Python
  - Scala
  - Shell
  - SVG
  - TypeScript
  - ...
- Licenses
  - creativecommons
  - MPL
  - GPL
  - ...

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
