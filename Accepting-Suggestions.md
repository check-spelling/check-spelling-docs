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

This should just work as of 0.0.21.

<!--
### Example using Git Bash

Consider https://github.com/check-spelling/examples-testing/pull/8#issuecomment-766297354

Open Git Bash from the start menu:

<img alt="Git Bash Start Menu entry" src="https://raw.githubusercontent.com/check-spelling/art/git-bash/windows/git-bash-start-menu-item.png" height="100">

The window will look like this:

<img alt="Git Bash window" src="https://raw.githubusercontent.com/check-spelling/art/git-bash/windows/git-bash-window.png" width="500">

#### Set up the repository

- First, we need the repository

```ps
# clone the repository
git clone https://github.com/check-spelling/examples-testing
# enter the directory
cd examples-testing
# normally you'd do `git checkout mary`, but the branch isn't available, so we're grabbing the commit associated with the example comment:
git fetch origin 56b9b8b81420136ca50362111f700e51e3a9331e:mary
```

- Open a Git Bash shell

```bash
# enter the directory
cd examples-testing
# check out the appropriate branch
git checkout mary
```

- Copy the command from the [comment](https://github.com/check-spelling/examples-testing/pull/8#issuecomment-766297354)

<details><summary>The comment text is included here for reference</summary>

```sh
```

</details>

Paste it into the shell.

<details><summary>You should see something like this</summary>

```sh
IEUser@VM MINGW64 ~/examples-testing (mary)
$ 
```

</details>

#### Finishing up

Check to see what changed (as you would before creating any commit):

```sh
IEUser@VM MINGW64 ~/examples-testing (mary)
$ git status
On branch mary
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        modified:   .github/actions/spelling/expect.txt
```

Create a commit as usual:

```sh
IEUser@VM MINGW64 ~/examples-testing (mary)
$ git commit -m 'Updating expect'
```
-->