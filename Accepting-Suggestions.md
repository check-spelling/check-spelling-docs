# Accepting Suggestions

1. Click the copy button (![copy icon](https://raw.githubusercontent.com/primer/octicons/0d9000c50255bac736eb0fbbc1ffee839130a708/icons/copy-16.svg)) at the top right corner of the script from the GitHub comment.
1. Open your favorite terminal / shell.
1. Use `cd` to change to the directory containing your local clone of the GitHub repository.
1. If you haven't checked out the branch specified in the comment, use `git fetch` (possibly with the appropriate _remote_) and `git checkout` with the listed branch name.
1. Paste from your clipboard (possibly `control`-`shift`-`v`, but this may vary based on your terminal). You may need to press `enter`.
1. Optionally, review the changes.
1. `git commit` and `git push` as usual.

## Windows

This should just work as of [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21).

## Manually

The code is provided as a convenience, what it does it take certain recommendations from check-spelling and apply them to the check-spelling configuration directory.

* There are probably `Unrecognized words` that need to be added to [`expect.txt`](https://github.com/check-spelling/check-spelling/wiki/Configuration#expect) (or some variant)
* There may be items that are no longer found that need to be removed from [`expect.txt`](https://github.com/check-spelling/check-spelling/wiki/Configuration#expect) (or some variant) so that they'd be flagged if they're reintroduced later.
* If there are [suggestions for additions to `excludes.txt`](https://github.com/check-spelling/check-spelling/wiki/Feature:-Heuristic-exclude-suggestions), versions after [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21) would apply them, and you could manually add them to [`excludes.txt`](https://github.com/check-spelling/check-spelling/wiki/Configuration#excludes) (although this isn't necessary).

## Preformatted commit (v0.0.22+)

As of [v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22), in GitHub Job Summaries, you should also see:

`To accept ✔️ these unrecognized words as correct, you could apply this commit`

You can apply the commit as a command or paste it into `git apply` / `patch -p1` or whatever tooling you're comfortable using.

Note that unlike the suggestions option, this will only update `expect.txt` (or its variants) and will not apply suggestions to `excludes.txt`, nor should it provide content from `spell-check-this`.
