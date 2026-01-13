# Check filenames and paths

Included in [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20)

While this tool was written to catch misspellings within files, it's actually fairly common for filenames themselves to encode misspellings. Sometimes this is a big problem and failing to fix them at the same time results in pain. The canonical example of this is Java classes where generally the filename needs to match the name of the class within.

## Thoughts

1. This is an optional feature. I haven't thought through the defaults.
1. The easiest way for the action to manage this is to synthesize a file containing the list of files the tool intends to check right before it proceeds to check files.
   - Generated a synthetic list of files (roughly the filtered output from `git ls-files | exclude.pl`) and add that to the list of files to check.
1. A misspelled directory would create lots of hits, making it very noisy. This half argues in favor of `echo "$files"|tree --fromfile=.`, however it's much nicer to be able to ignore a specific directory that's a child of another directory, and that's easier to do with a flat file path with the existing patterns system.

## Use

```
  with:
    check_file_names: 1
```

## Improvements in v0.0.21

- [`check-file-path`](Event-descriptions#noisy-file-list)

## Improvements in v0.0.22

- [`noisy-file-list`](Event-descriptions#noisy-file-list)

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
