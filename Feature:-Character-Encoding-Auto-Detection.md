In [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21), check-spelling assumes ASCII encoding and roughly ignores anything outside `[a-zA-Z']`.

In order to support [non-English languages](./Feature:-Non-English-languages), the acceptable character-set will have to grow to include:

- Spanish (plus uppercase): á é í ó ú ü ñ ¿ ¡
- French (plus uppercase): é à è ù â ê î ô û ä ë ü ç

... And most other languages add other characters. Sadly, these characters are outside basic `ASCII` and close enough to having a conflict between `Latin-1` and `Unicode`.

It would be nice to support `latin-1`, `utf-*`/`ucs-*`, and possibly some alternate encodings.

One approach would be t recognize some sentinel bytes, and once those are present, switch to a mode where the file might be worth checking again in an alternate encoding. In that mode, if the file has a words vs non-words comparison that is close to the normal threshold, it can be re-checked w/ another encoding, and if that pushes it into the right category, it can be added w/ a hint to add it to a pattern mapping to the selected encoding.

This would require adding a second threshold for truly non-word files (currently a single threshold exists for binary files where non-words exceeds words).

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
