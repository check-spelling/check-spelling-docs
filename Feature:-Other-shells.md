# Make update whitelist command work for non posix shells

I know at least one person who uses a non-posix shell.

They asked that the command be wrapped such that it invokes `sh`/`bash` (or potentially that it just be written in `perl` -- just so long as it doesn't fail when copied into their non-posix shell).

Released in [0.0.16-alpha](https://github.com/check-spelling/check-spelling/releases/tag/0.0.16-alpha) -- it appears to work for [fishshell](https://fishshell.com/).

⚠️ I don't actively test support for non-posix shells, so this probably will break periodically. I'm still thinking through the best approach for this. One is to offer a client that's responsible for consuming this output, another is relying on talk-to-the-bot.

At some point, I might add a test-suite to make sure this feature doesn't break, but it isn't high on my todo list.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
