# File specific allow list

Many tools allow files to define specific terminology.

## Possible implementation

```
check-spelling-allow: (.*)
```

... which when encountered causes the splitter to add the words to a supplementary dictionary for the current file, which is then discarded when the splitter goes to the next file.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
