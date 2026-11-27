# Breaking change: Smaller dictionary

⏸️ There is no timeline for this work.

The default dictionary 📘 through [v0.0.19](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.19) is quite large.

The downside of its comprehensiveness is that it has lots of archaic words.
This means that it's rather forgiving of typos for common words in favor of those archaic words.
It also means that if/when I implement [correction suggestions](./Feature:-Suggest-corrections) suggestions are pretty quirky (e.g. `Debian` -> `cebian`).

I'll probably test the upgrade with known consumers and maybe switch in 0.0.19-alpha.

Note that as of 0.0.17-alpha, it's possible to specify a specific [dictionary revision](./Feature:-Versioned-dictionaries), which means that consumers will be able to avoid adopting the newer dictionary.

My tentative plan is to try [wamerican-small](https://packages.debian.org/sid/wamerican-small) based on http://wordlist.aspell.net/.
If that works for some/most, I'll add [wbritish-small](https://packages.debian.org/sid/wbritish-small) as an alternate (and probably a combined).
I expect that I'll make the default `wamerican-small`, and give each project the dictionary that makes sense.

I'm still thinking about the right way to do multiple dictionaries in general (see [Area dictionaries](./Feature:-Area-dictionaries)).

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
