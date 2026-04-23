# Case changes should fail

In general, if you have a word, e.g. `Microsoft` that isn't in the dictionary, check-spelling will flag it (❌).

You can then add `Microsoft` to `expect.txt` and check-spelling will be happy (✅).

If you then add `microsoft`, check-spelling will flag it -- because the proper spelling is `Microsoft`.

Ideally, check-spelling should report this as ❌, but sometimes if the only change was the case of the word, due to a bug it wouldn't actually fail (❌).

The reason you're adding `microsoft` is probably because it's a path and paths probably must be in lowercase.

As such, check-spelling will understand if you add `microsoft` to `expect.txt` (and will suggest removing `Microsoft`),
further it will understand that because you've added `microsoft`, you're also ok with `Microsoft`, if only because you
might add a general lowercase noun and write it as the first word in an English sentence. _This behavior is specific to
English_ and if/when check-spelling starts trying to support other languages, this feature could go away.

Note: The generated expect update script (in the log, or the next time you get a fail) will properly update `Microsoft` to `microsoft`.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
