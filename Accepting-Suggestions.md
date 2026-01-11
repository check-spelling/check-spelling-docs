# Accepting Suggestions

1. Click the copy button (![copy icon](https://raw.githubusercontent.com/primer/octicons/0d9000c50255bac736eb0fbbc1ffee839130a708/icons/copy-16.svg)) at the top right corner of the script from the GitHub comment.
1. Open your favorite terminal / shell.
1. Use `cd` to change to the directory containing your local clone of the GitHub repository.
1. If you haven't checked out the branch specified in the comment, use `git fetch` (possibly with the appropriate _remote_) and `git checkout` with the listed branch name.
1. Paste from your clipboard (possibly `control`-`shift`-`v`, but this may vary based on your terminal). You may need to press `enter`.
1. Optionally, review the changes.
1. `git commit` and `git push` as usual.

- [GitHub's `gh` client](#githubs-gh-client)
  - [Install](#install)
  - [Set up](#set-up)
- [Windows](#windows)
- [Manually](#manually)
- [Preformatted commit (v0.0.22+)](#preformatted-commit-v0022)
- [Caveats](#caveats)
  - [Pull Requests from branches without check-spelling configured](#pull-requests-from-branches-without-check-spelling-configured)

## GitHub's [`gh`](https://cli.github.com/) client

As of [v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22), the script relies on [`gh`](https://cli.github.com/).

The script will drag you through the process, but you can do it eagerly:

### Install

- 🍎 macOS, 🍺 brew: [`brew install gh`](https://formulae.brew.sh/formula/gh)
- 🪟 Windows, 🍫 choco: [`choco install gh`](https://community.chocolatey.org/packages/gh)
- ... [All](https://github.com/cli/cli#installation)

### Set up

`gh auth login`

## Windows

This should just work as of [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21).

You may need to use `curl.exe` instead of `curl`.

You probably want to use `git-bash` from https://git-scm.com/download/win (install with `Enable experimental support for pseudo consoles`) which will give you `perl` (although you can use any [Perl distribution](https://www.perl.org/get.html).

## Manually

The code is provided as a convenience--what it does is take certain recommendations from check-spelling and apply them to the check-spelling configuration directory.

- There are probably `Unrecognized words` that need to be added to [`expect.txt`](Configuration#expect) (or some variant).
- There may be items that are no longer found that need to be removed from [`expect.txt`](Configuration#expect) (or some variant) so that they'd be flagged if they're reintroduced later.
- If there are [suggestions for additions to `excludes.txt`](./Feature:-Heuristic-exclude-suggestions), versions after [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21) would apply them, and you could manually add them to [`excludes.txt`](Configuration#excludes) (although this isn't necessary).

## Preformatted commit (v0.0.22+)

As of [v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22), in **GitHub Job Summaries** (if you're used to interacting with check-spelling via a comment, the comment will include a link to the `📝 job summary`), you should also see:

`To accept ✔️ these unrecognized words as correct, you could apply this commit`

You can apply the commit as a command or paste it into `git apply` / `patch -p1` or whatever tooling you're comfortable using.

Note that unlike the suggestions option, this will only update `expect.txt` (or its variants) and will not apply suggestions to `excludes.txt`,
nor should it provide content from `spell-check-this`.

## Caveats

### Pull Requests from branches without check-spelling configured

If your branch doesn't have check-spelling and you're making a pull request to a branch with check-spelling, it doesn't make sense for check-spelling to suggest applying changes to your head branch because that is guaranteed to result in a conflict.

Instead, the command that's suggested is the command to add the metadata to the base branch.

In order for this to be useful, you'll then need to create a merge commit between the modified head base and your head branch.

You could rebase your commits onto the base branch at this point (or in some other order).

A version after 0.0.22 should include instructions for merging. Whether you merge or rebase is up to you or the project to which you're contributing. If you choose to rebase, you'll probably want to rearrange the commits. You might also want to rearrange the commits if you merge -- the order of commands given is designed to be likely to not immediately have merge conflicts but probably doesn't tell the best "story".

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
