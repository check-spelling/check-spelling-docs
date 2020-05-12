# Make update whitelist command work for non posix shells

I know at least one person who uses a non-posix shell.

They're asking that the command be wrapped such that it invokes `sh`/`bash` (or potentially that it just be written in `perl` -- just so long as it doesn't fail when copied into their non-posix shell).

🛠 This feature is currently in development -- it appears to work for [fishshell](https://fishshell.com/)
You can see a [draft of the code changes](https://github.com/check-spelling/check-spelling/commit/d3887a5ddffd3d154038fb7ed5f8635d6ddab8d7)