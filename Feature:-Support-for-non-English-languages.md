# Support for non-English languages

As of [v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22), check-spelling can be configured to check words against languages other than English with the help of Hunspell.

Previously, you could add dictionaries from other languages, but unless all the characters in each word were among the 26 letters in the English alphabet (and the `'` character), words wouldn't be handled well. Specifically, characters outside that range would be treated as word boundaries, resulting in the remaining word fragments being checked against the available dictionary words instead.

## Implementation details

By adding [Configurable word characters](./Feature:-Configurable-word-characters), check-spelling can be tuned to accept a different range of word characters, enabling it to check words with accent marks as well as, for example, words with Arabic or Cyrillic letters.

## Available dictionaries

You can pull in any of these hunspell dictionaries from [`cspell`](https://github.com/check-spelling/cspell-dicts/tree/main-condensed/dictionaries):

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

When check-spelling sees an instruction to use `.dic` file, it will automatically retrieve the corresponding `.aff` file as well.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
