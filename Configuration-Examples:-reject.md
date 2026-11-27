# `reject` Examples

Note that regular expressions are generally case-sensitive. You can use `(?:(?i)...)` to make a line case-insensitive (currently all lines are treated together, so if you don't scope your item, it will carry through to the remaining lines, which is could be unexpected -- this is likely to change in the near future).

See [Archaic-words](Archaic-words)

```
attache
benefitting
occurences?
Sorce
[Ss]pae.*
untill.*
venders?
wether.*
```

Note: the patterns are Perl regular expressions.

As of [v0.0.18](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.18), leading `^` and trailing `$` are automatically included. If you need to match a prefix or a suffix, include a `.*` to cover the variable portions.

- `attache` matches a single (French) word (`attache`) which can be a typo for English words (attach, attached/attaches)
- `occurences?` matches `occurence` or `occurences`
- `[Ss]pae.*` matches a number of things include `spaetzle` (which is a word, but, the odds are you won't be using it), most of them will be typos of words in the `space` family.
- `untill.*` will match some farming terms, but again, it's unlikely you're using them (if you are, add a `$` to the line to just match `until`).
- `vender` is archaic (formerly used by the New Yorker) https://english.stackexchange.com/questions/28201/vendor-vs-vender-in-standard-american-english -- note that the New Yorker appears to have abandoned this spelling as well see https://www.newyorker.com/video/watch/the-fruit-vendor
- `wether.*` matches a number of terms, the main one is a typo for `whether`, if you need `wetherhog` or similar, adjust the pattern.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
