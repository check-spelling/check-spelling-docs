# Dropping support for out of tree project files

## Background

check-spelling originally imagined people wouldn't want to have large `expect.txt` like files in their repositories, so the data was originally stored in a google cloud bucket.

Unfortunately, this model doesn't work well with any branching mode since it only supports a single state.

Thus, check-spelling evolved to focussing on in tree project files.

## Changes

The next release will not support out of tree project files.

Anyone who needs to use out of tree project files can add steps before the check-spelling action to check out the repository and retrieve the project files.


