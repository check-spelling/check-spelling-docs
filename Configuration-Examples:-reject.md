Note that regular expressions are generally case-sensitive. You can use `(?:(?i)...)` to make a line case-insensitive (currently all lines are treated together, so if you don't scope your item, it will carry through to the remaining lines, which is could be unexpected -- this is likely to change in the near future).


See [[Archaic-words]]

```
^attache$
benefitting
occurence
Sorce
^[Ss]pae
^untill
^wether
```

Note: the patterns are perl regular expressions.
Here these patterns are quite broad.

* `^attache$` matches a single (French) word (`attache`) which can be a typo for English words (attach, attached/attaches)
* `benefitting` would match a substring, but the default dictionary has no other matching words, the current accepted English spelling is `benefiting`
* `^[Ss]pae` matches a number of things include `spaetzle` (which is a word, but, the odds are you won't be using it), most of them will be typos of words in the `space` family.
* `^untill` will match some farming terms, but again, it's unlikely you're using them (if you are, add a `$` to the line to just match `until`).
* `^wether` matches a number of terms, the main one is a typo for `whether`, if you need `wetherhog` or similar, adjust the pattern.