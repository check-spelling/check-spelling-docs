Historically, check-spelling would check any file it could open.

Some repositories have giant files.

Whether they're actually text files isn't relevant to check-spelling, unless they're excluded, it would process them.

Tentatively, I think I'll exclude files over 1mb. -- This will be configurable.

I might also want to have check-spelling time itself and warn when it takes too long to scan a file. -- This would also be configurable.

Files that are too large will be suggested for exclusion.
