# Archaic / Obsolete words

check-spelling can use any dictionary you like. By default, it uses a [version from Fedora Linux](https://github.com/check-spelling/check-spelling/tree/dictionary) https://rpmfind.net/linux/fedora/linux/development/rawhide/Everything/aarch64/os/Packages/w/ "words-.\*.noarch.rpm"

That dictionary is fairly comprehensive. Unfortunately, it has a number of archaic spellings. On the bright side, it means if you have some old documents, it won't scream about them. On the not so bright side, it'll tolerate various things you'd find surprising.

## Compensating

- You can remove words using `reject` see [Configuration Examples: reject](./Configuration-Examples:-reject)
- You can replace the dictionary using `dictionary` (`dictionary.txt` or `dictionary/*.txt`)
- I plan to offer reduced dictionaries (based on implementation experience) which one could select using `DICTIONARY_VERSION`

## Known amusing words

- [attache](https://www.merriam-webster.com/dictionary/attache) (from French) -- removed from [microsoft/terminal](https://github.com/microsoft/terminal/commit/827cc42a45e7a68cabf426833cc409a2bec9d3ac#diff-4a97f7b6bd038d5e4082fe476036b224L28676)
- [benefitting](https://grammarist.com/spelling/benefiting-vs-benefitting/) ([out of style spelling / British](https://books.google.com/ngrams/graph?content=benefiting%2Cbenefitting&year_start=1800&year_end=2008&corpus=15&smoothing=3&share=&direct_url=t1%3B%2Cbenefiting%3B%2Cc0%3B.t1%3B%2Cbenefitting%3B%2Cc0) of benefiting starting circa 1990 with modern spell checkers)
- [occurence](https://english.stackexchange.com/questions/431928/is-occurence-a-word) (obsolete) -- to be removed from [microsoft/terminal](https://github.com/microsoft/terminal/pull/9679)
- [Sorce](https://en.wiktionary.org/wiki/Sorce) (surname) -- removed from [microsoft/winget-cli](https://github.com/microsoft/winget-cli/commit/3c10211f321701f313ca56593e4944f963110dbe)
- [spae](https://www.dictionary.com/browse/spae) (from Old English), spaebook, spaecraft, spaed, spaedom, spaeing, spaeings, spae-man, spaeman, spaer, Spaerobee, spaes, spaewife, spaewoman, spaework, spaewright -- removed from [microsoft/terminal](https://github.com/microsoft/terminal/commit/dc43524eb23feb9962e5277c639628d0e982f1bf#diff-4a97f7b6bd038d5e4082fe476036b224)
- [wether](https://www.dictionary.com/browse/wether) (from Old English / Old High German) -- removed from [microsoft/terminal](https://github.com/microsoft/terminal/commit/9409e851d043775ea973a7cc50cc1ba0c2f660a2#diff-4a97f7b6bd038d5e4082fe476036b224)
- [untill](https://en.wiktionary.org/wiki/untill) ([archaic spelling](https://books.google.com/ngrams/graph?content=untill%2Cuntil&year_start=1800&year_end=2008&corpus=15&smoothing=3&share=&direct_url=t1%3B%2Cuntill%3B%2Cc0%3B.t1%3B%2Cuntil%3B%2Cc0) of until)

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
