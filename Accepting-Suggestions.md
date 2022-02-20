# Accepting Suggestions

## Linux and macOS

1. Click the copy button (❐) at the top right corner of the script from the GitHub comment.
1. Open your favorite terminal / shell.
1. Use `cd` to change to the directory containing your local clone of the GitHub repository.
1. If you haven't checked out the branch specified in the comment, use `git fetch` (possibly with the appropriate origin) and `git checkout` with the listed branch name.
1. On macOS, you can use: `pbpaste > 1; . ./1`
1. On Linux, paste from your clipboard (possibly `control`-`shift`-`v`, but this may vary based on your terminal). You may need to press `enter`.
1. Optionally, review the changes.
1. `git commit` and `git push` as usual.