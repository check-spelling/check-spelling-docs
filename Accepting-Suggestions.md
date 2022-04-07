# Accepting Suggestions

## Linux and macOS

1. Click the copy button (![copy icon](https://raw.githubusercontent.com/primer/octicons/0d9000c50255bac736eb0fbbc1ffee839130a708/icons/copy-16.svg)) at the top right corner of the script from the GitHub comment.
1. Open your favorite terminal / shell.
1. Use `cd` to change to the directory containing your local clone of the GitHub repository.
1. If you haven't checked out the branch specified in the comment, use `git fetch` (possibly with the appropriate origin) and `git checkout` with the listed branch name.
1. On macOS, you can use: `pbpaste > 1; . ./1`
1. On Linux, paste from your clipboard (possibly `control`-`shift`-`v`, but this may vary based on your terminal). You may need to press `enter`.
1. Optionally, review the changes.
1. `git commit` and `git push` as usual.

## Windows

<!-- From
https://github.com/microsoft/terminal/blame/866d22e3a140ef252e2d777c4bbf0c6d4861a3d4/.github/actions/spelling/advice.md#L7-L9
-->
⚠️ The command is written for posix shells. You can copy the contents of each `perl` command excluding the outer `'` marks and dropping any `'"`/`"'` quotation mark pairs into a `file.pl` and then run `perl file.pl` from the root of the repository to run the code. Alternatively, you can manually insert the items...

