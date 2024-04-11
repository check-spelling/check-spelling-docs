# `advice` Examples

Advice is a file that is inserted raw into GitHub comments (or potentially in the log if the commit results in stale expect items and no unexpected items).

Here are some examples:

- [microsoft/terminal `.github/actions/spelling/advice.md`](https://raw.githubusercontent.com/microsoft/terminal/main/.github/actions/spelling/advice.md)
- [imazen/imageflow `.github/actions/spell-check/advice.txt`](https://raw.githubusercontent.com/imazen/imageflow/main/.github/actions/spell-check/advice.txt)
- [jsoref/jitsi-videobridge @ e26301eab0a15f2366f5d2b73e2c0cc714007a14 `.github/actions/spell-check/advice.txt`](https://raw.githubusercontent.com/jsoref/jitsi-videobridge/e26301eab0a15f2366f5d2b73e2c0cc714007a14/.github/actions/spell-check/advice.txt)

```
<details><summary>If you see a bunch of garbage and it relates to a binary-ish string</summary>

Please add a file path to the `excludes.txt` file instead of just accepting the garbage.

File paths are Perl 5 Regular Expressions - you can [test](
https://www.regexplanet.com/advanced/perl/) yours before committing to verify it will match your files.

`^` refers to the file's path from the root of the repository, so `^README\.md$` would exclude [README.md](https://github.com/check-spelling-bot/example/blob/master/README.md) (on whichever branch you're using).
</details>
```

![Advice about garbage](https://raw.githubusercontent.com/check-spelling/images/main/sample-advice.png)

## advice.md

As of [v0.0.18](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.18), the file can be named `advice.md` instead of `advice.txt`.

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
