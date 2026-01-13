# Use local check-spelling repository

If you're running a Debian derivative (or have `git`, `curl`, and `jq` installed) and can run `sudo`, then the following script should be sufficient to run check-spelling locally:

```sh
export spellchecker=$HOME/check-spelling
if [ ! -d $spellchecker ]; then
  if ! command -v git > /dev/null ; then
    apt-get update
    apt-get install -y git
  fi
  git clone https://github.com/check-spelling/check-spelling.git $spellchecker
  (cd $spellchecker && git checkout prerelease)
fi
export INPUT_CONFIG=.github/actions/spelling
export INPUT_DICTIONARY_URL=https://raw.githubusercontent.com/check-spelling/check-spelling/dictionary-20200211/dict.txt
export GITHUB_EVENT_NAME=push
$spellchecker/fast-install.pl && $spellchecker/unknown-words.sh
```

## Notes

1. `spellchecker` points to the directory where you want your local check-spelling to live.
2. `INPUT_CONFIG` is the equivalent of the `with: / config:` field from your workflow.
3. The repository to be checked is the current working directory.

## Disclaimers

1. Both this script and check-spelling itself will try to install software globally (curl, git, jq, and CheckSpelling's Perl modules)
2. Check Spelling creates _lots_ of temporary directories in your temp directory. It expects your system to clean them up (or not care that they're created). If this is a problem, run this in a docker or similar disposable world.

## Alternatives

For most people, using [nektos/act](https://github.com/nektos/act) should work well enough that one shouldn't need to use this script.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
