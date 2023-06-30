# Custom escape mappings

Right now, `\\[nrt]` are effectively mapped to space, and some patterns are mapped to `'`.

## Thoughts

* The C escaped whitespace frequently trip on Windows paths. It would be possible to move them out of the engine entirely and have projects use `patterns.txt` instead as needed. Possibly aided by something to automatically suggest it.

* Something which can automatically decide html escapes would handle most of the rest. I'm not sure I like this, since I'm not sure I'd always want to run it.

* It'd be possible to define a special file with something like:

```
/&quot;/ => "
/&apos;/ => '
```

I'm not sure I like this at all as the parsing will be painful.

I could use JSON, but, I don't think that really improves things.

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
