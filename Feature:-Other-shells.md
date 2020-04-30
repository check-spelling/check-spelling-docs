# Make update whitelist command work for non posix shells

I know at least one person who uses a non-posix shell.

They're asking that the command be wrapped such that it invokes `sh`/`bash` (or potentially that it just be written in `perl` -- just so long as it doesn't fail when copied into their non-posix shell).