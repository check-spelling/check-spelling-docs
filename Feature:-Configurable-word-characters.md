# Configurable word characters

As of [v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22), you can configure the characters that check-spelling handles.

Previously, check-spelling would only look at `/[A-Za-z']/` and generally with a [minimum run length of 3](Configuration#shortestword).

## Caveats

Certain escaped characters are converted to decoded characters first. (e.g. `&apos;` and `&#39;`)

Support for similarly html encoded entities isn't currently supported.

## Spanish

To support Spanish, this needs to be extended to allow some accent characters and ñ.

```yaml
        extra_dictionaries:
          cspell:es_ES/src/hunspell/index.dic
        ignore-pattern: "[^'a-záéíóúñçüA-ZÁÉÍÓÚÑÇÜ]"
        upper-pattern: '[A-ZÁÉÍÓÚÑÇÜ]'
        lower-pattern: '[a-záéíóúñçü]'
        not-lower-pattern: '[^a-záéíóúñçü]'
        not-upper-or-lower-pattern: '[^A-ZÁÉÍÓÚÑÇÜa-záéíóúñçü]'
        punctuation-pattern: "'"
```

## Unicode

[Unicode categories](https://www.compart.com/en/unicode/category)

- Ll, Lm, Lt, Lu

[Perl Unicode: General Category](https://perldoc.perl.org/perlunicode#General_Category)
`[\p{Ll}\p{Lm}\p{Lt}\p{Lu}]`

The general configuration is:

```yaml
        ignore-pattern: '[^\p{Ll}\p{Lm}\p{Lt}\p{Lu}]'
        upper-pattern: '[\p{Lu}\p{Lt}\p{Lm}]'
        lower-pattern: '[\p{Ll}\p{Lm}]'
        not-lower-pattern: '[^\p{Ll}\p{Lm}]'
        not-upper-or-lower-pattern: '[^\p{Lu}\p{Lt}\p{Lm}]'
        punctuation-pattern: "'"
```

With some selection from available dictionaries:

```yaml
        extra_dictionaries:
          cspell:ar/src/ayaspell/ar.dic
          cspell:bg_BG/bg_BG.dic
          cspell:ca/ca.dic
          cspell:cs_CZ/Czech.dic
          cspell:da_DK/da_DK.dic
          cspell:de_CH/src/hunspell/index.dic
          cspell:de_DE/src/German_de_DE.dic
          cspell:de_DE/src/hunspell/index.dic
          cspell:el/src/hunspell/el-GR.dic
          cspell:en_GB/src/aoo-mozilla-en-dict/en-GB.dic
          cspell:en_GB/src/hunspell/en_GB.dic
          cspell:en_US/src/aoo-mozilla-en-dict/en_US.dic
          cspell:en_US/src/hunspell/en_US.dic
          cspell:eo/eo.dic
          cspell:es_ES/src/hunspell/index.dic
          cspell:et-EE/src/index.dic
          cspell:fa_IR/hunspell/fa-IR.dic
          cspell:fr_FR/src/hunspell-french-dictionaries-v7.0/fr-classique.dic
          cspell:fr_FR/src/hunspell-french-dictionaries-v7.0/fr-reforme1990.dic
          cspell:fr_FR/src/hunspell-french-dictionaries-v7.0/fr-toutesvariantes.dic
          cspell:fr_FR_90/src/hunspell-french-dictionaries-v7.0/fr-classique.dic
          cspell:fr_FR_90/src/hunspell-french-dictionaries-v7.0/fr-reforme1990.dic
          cspell:fr_FR_90/src/hunspell-french-dictionaries-v7.0/fr-toutesvariantes.dic
          cspell:he/hunspell/he.dic
          cspell:hr_HR/src/hr_HR.dic
          cspell:it_IT/it_IT.dic
          cspell:lt_LT/lt_LT.dic
          cspell:nb_NO/src/nb.dic
          cspell:nl_NL/src/hunspell/index.dic
          cspell:pl_PL/pl_pl.dic
          cspell:pt_BR/src/hunspell/index.dic
          cspell:pt_PT/Portuguese-European.dic
          cspell:ru_RU/src/Russian.dic
          cspell:ru_RU/src/hunspell/index.dic
          cspell:ru_RU/src/ru_ru.dic
          cspell:ru_RU/src/russian-aot.dic
          cspell:sl_SI/src/sl_SI.dic
          cspell:sv/src/hunspell/index.dic
          cspell:sv/src/ooo-swedish-dict-2-42/dictionaries/sv_FI.dic
          cspell:sv/src/ooo-swedish-dict-2-42/dictionaries/sv_SE.dic
          cspell:sv/src/open-office-2008/Swedish.dic
          cspell:tr_TR/Turkish.dic
          cspell:uk_UA/uk_ua.dic
          cspell:vi_VN/vi.dic
```

## Dictionaries

In order for this to work reasonably well, support for hunspell `.dic` and `.aff` files has been added (in [v0.0.22](https://github.com/check-spelling/check-spelling/commits/v0.0.22)).

## Related

Right now, characters that fall outside the recognized set are effectively blanked (replaced with a non-word character, currently `=`). I might switch to only parsing characters that match the regex. That'd save me a pass.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
