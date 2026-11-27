# Correct misspelling

## Identify misspelled words

check-spelling at present only identifies misspellings.

## Apply corrections

It would be nice if one could give it a list of corrections and have it prepare a commit / PR.

This is obviously appealing, but at present it's fairly low on my list of things to do.

## Today

As long as you have a local repository (and I usually do, although of late I've been taking advantage of the GitHub editor to skip this), it's pretty easy to fix things yourself.

At the present time, you can use [jsoref/spelling](https://github.com/jsoref/spelling)'s `rs` command for this or various other things.

### Renaming files

Note: there's an extra script `hgmv` which sometimes needs to be run before `rs` (it takes the same first two arguments as `rs` and manages renaming files). This is especially important for programming languages where classes are tied to filenames, but it also matters for build system changes and Markdown/HTML links.

## Intermediate step

I think I'm going to write a version of `rs` which is aware of the spell checker excludes files and at the same time roll in the rename functionality.

That would be a good step toward being able to ingest a list of corrections.

## Picking corrections in a semi automated manner

For reference, at present, I have a Google Sheets spreadsheet which constructs the `rs` commands automatically (just running Sheets's Spell Check and accepting its corrections generates the commands). – At some point, I'll publish this as well. Sheets makes case aware corrections which is incredibly handy and its corrections tend to be better than Google Chrome/Google Search Suggest.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
