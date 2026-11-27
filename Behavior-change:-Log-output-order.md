Today, skipped files are listed quite late.

In general, this has no material impact.

If the GitHub Action runtime _fails_, it's possible to wait hours and then receive hundreds of megabytes of logs for individual unrecognized words without receiving the list of files that should be skipped.

Generally there are far fewer skipped files than unrecognized words, so listing them first isn't particularly harmful.

One should integrate the list of skipped files into `excludes.txt`, which will result in 0 items in this category and effectively the same output as the current state.

I'm not sure when I'll do this, but, probably soon.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
