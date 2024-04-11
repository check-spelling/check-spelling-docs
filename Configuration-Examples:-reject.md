# `reject` Examples

Note that regular expressions are generally case-sensitive. You can use `(?:(?i)...)` to make a line case-insensitive (currently all lines are treated together, so if you don't scope your item, it will carry through to the remaining lines, which is could be unexpected -- this is likely to change in the near future).

See [Archaic-words](Archaic-words.md)

```
^attache$
benefitting
occurence
Sorce
^[Ss]pae
^untill
vender
^wether
```

Note: the patterns are perl regular expressions.
Here these patterns are quite broad.

- `^attache$` matches a single (French) word (`attache`) which can be a typo for English words (attach, attached/attaches)
- `benefitting` would match a substring, but the default dictionary has no other matching words, the current accepted English spelling is `benefiting`
- `^[Ss]pae` matches a number of things include `spaetzle` (which is a word, but, the odds are you won't be using it), most of them will be typos of words in the `space` family.
- `^untill` will match some farming terms, but again, it's unlikely you're using them (if you are, add a `$` to the line to just match `until`).
- `vender` is archaic (formerly used by the New Yorker) https://english.stackexchange.com/questions/28201/vendor-vs-vender-in-standard-american-english -- note that the New Yorker appears to have abandoned this spelling as well see https://www.newyorker.com/video/watch/the-fruit-vendor
- `^wether` matches a number of terms, the main one is a typo for `whether`, if you need `wetherhog` or similar, adjust the pattern.

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
