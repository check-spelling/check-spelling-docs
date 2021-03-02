File names are often misspelled as well...

Possible approach:
generated a synthetic list of files (roughly the filtered output from `git ls-files | exclude.pl`) and add that to the list of files to check.

It's a bit of eating one's own tail, but it might help.