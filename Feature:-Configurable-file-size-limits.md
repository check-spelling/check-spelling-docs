# Configurable file size limits

## Background

Historically, check-spelling would check any file it could open.

Some repositories have giant files.

Whether they're actually text files isn't relevant to check-spelling, unless they're excluded, it would process them.

## Implementation

Default is to exclude files over 1 mb.

Configurable via [`largest_file`](https://github.com/check-spelling/check-spelling/wiki/Configuration#largest_file).

Reported as `large-file`.

Files that are too large will be suggested for exclusion.

## Future

I might also want to have check-spelling time itself and warn when it takes too long to scan a file. -- This would also be configurable.
