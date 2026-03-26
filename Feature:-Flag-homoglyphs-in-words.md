# Flag homoglyphs in words

## Background
People often replace `c` with `с` (especially because of a certain keyboard layout where they're on the same key but using a different shift-state).

<img width="677" height="210" alt="ES1845 JCUKEN-QWERTY hybrid layout keyboard" src="https://github.com/user-attachments/assets/ac33ab9b-3d79-4f9d-9c72-a6155fc3e8c8" />

See [Wikipedia: Homoglyph](https://en.wikipedia.org/wiki/Homoglyph).

One problem with this is that homoglyphs result in search failures.

## Goals

Ideally users should be able to configure a set of homoglyphs, e.g. based on [codebox/homoglyph: chars.txt]( https://github.com/codebox/homoglyph/blob/master/raw_data/chars.txt) and when check-spelling encounters the homoglyph, it could check to see if the `word` would be in the dictionary if it were the "proper" character and only flag in that case, thus allowing a purely Cyrillic word `собака` (if there's Cyrillic dictionary + Cyrillic recognized characters) and not flagging some Cyrillic if it isn't a substitution, but flagging `сypher` as a homoglyph-substitution for `cypher`.

## Configuration

### [v0.0.26](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.26)
You should be able to use this feature and control it using `check-homoglyphs`.

A file [`homoglyph.list`](https://github.com/check-spelling/check-spelling/wiki/Configuration-Files#homoglyph) can be used to configure characters and known homoglyphs.

Note that if two characters list the same homoglyph, check-spelling will not be able to reason through it.
No warnings will be provided.
A future version may handle this case better.
