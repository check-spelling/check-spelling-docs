# Flag homoglyphs in words

## Background
People often replace `c` with `с` (especially because of a certain keymap where they're on the same key but using a different shift-state).

One problem with this is that homoglyphs result in search failures.

## Goals

Ideally users should be able to configure a set of homoglyphs, e.g. based on [codebox/homoglyph: chars.txt]( https://github.com/codebox/homoglyph/blob/master/raw_data/chars.txt) and when check-spelling encounters the homoglyph, it could check to see if the `word` would be in the dictionary if it were the "proper" character and only flag in that case, thus allowing a purely Cyrillic word `собака` (if there's Cyrillic dictionary + Cyrillic recognized characters) and not flagging some Cyrillic if it isn't a substitution, but flagging `сypher` as a homoglyph-substitution for `cypher`.
