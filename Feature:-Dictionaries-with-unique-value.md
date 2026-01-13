# Dictionaries with unique value

Some dictionaries will have high overlap with other dictionaries.

## Evolving the available supplemental dictionary report

### In [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20)

> Unrecognized words (_number_)
>
> ... list
>
> Previously acknowledged words that are now absent _number not listed_
>
> ... list _generally collapsed_
>
> Available dictionaries could cover words not in the dictionary
>
> This includes both expected items (_some number which also counts items that are absent_) from `.github/actions/spelling/expect.txt` and unrecognized words (_number_)
>
> ...
>
> - _dictionary_ (_total entries_) covers _matching entry count_ of them
> - [cspell:software-terms/src/software-terms.txt](https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/software-terms/src/software-terms.txt) (1237) covers 3 of them
> - [cspell:cpp/src/cpp.txt](https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/cpp/src/cpp.txt) (30216) covers 2 of them

## In [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21)

They're now shown in table form which will make it easier to expose an extra column of data...

### Available dictionaries could cover words not in the dictionary

Dictionary | Entries | Covers
-|-|-
[cspell:software-terms/src/software-terms.txt](https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/software-terms/src/software-terms.txt)|1237|3|
[cspell:java/java.txt](https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/java/java.txt)|7642|2|
[cspell:cpp/src/cpp.txt](https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/cpp/src/cpp.txt)|30216|2|
[cspell:clojure/src/clojure.txt](https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/clojure/src/clojure.txt)|89|1|

Consider adding them using (in `.github/workflows/spelling.yml`):
``` yml
      with:
        extra_dictionaries:
          cspell:software-terms/src/software-terms.txt
          cspell:java/java.txt
          cspell:cpp/src/cpp.txt
          cspell:clojure/src/clojure.txt
```

To stop checking additional dictionaries, add:
``` yml
      with:
        check_extra_dictionaries: ''
```

## Expose unique entries, common entries, total entries

> dictionary (_unique matching entries_, _common matching entries_, _total entries_)

Where _unique matching entries_ + _common matching entries_ = _matching entry count_.

An entry in a dictionary would be scored into _unique matching entries_ only if it isn't present in other dictionaries.

https://github.com/check-spelling/zio-flow/commit/b5b7d5f991d234c67f309bc98499c2f86d431bba#commitcomment-84656084 is an example of a single unknown word and many expected words; this example, more than most, drives home the question "would any of these dictionaries reduce this list" -- consider columns for both expected words and unknown words.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
