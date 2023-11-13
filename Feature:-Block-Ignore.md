# Block Ignore

JSON/HTML/XML/Yaml/ssh keys often have nothing useful on a given line, but people still want to ignore a hunk.

I don't have a particular plan for how to handle this. I don't think I'll implement it in the `patterns.txt` file as the way I've implemented patterns isn't really compatible w/ such an extension.

I'm mostly concerned about having to run a regular expression against a very large file as a single string.

Offhand, the easiest implementation I can imagine that doesn't force this is to have "begin" and "end" tags, requiring that begin/end tags fit on a single line.

## Status

This is not yet implemented as of [v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22)