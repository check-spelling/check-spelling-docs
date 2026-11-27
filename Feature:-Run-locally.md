# Running locally to check for new errors

Possible approaches:

- [Act](#act)
- [Runnable script](#runnable-script)
- [Single script](#single-script)
- [Docker image](#docker-image)

## Act

[Act](https://github.com/nektos/act) is a tool which uses Docker to run GitHub Actions locally.

You should generally use the [latest version of act](https://github.com/nektos/act/releases/latest).

### General status

Act [v0.2.25](https://github.com/nektos/act/releases/tag/v0.2.25)+ should work reasonably well...

Running `act` in a repository with `push` and `pull_request_target` (with `suppress_push_for_open_pull_request`) should work.

````
$ act
[Spell checking/Spell checker] 🚀  Start image=node:12.6-buster-slim
[Spell checking/Spell checker]   🐳  docker run image=node:12.6-buster-slim entrypoint=["/usr/bin/tail" "-f" "/dev/null"] cmd=[]
[Spell checking/Spell checker]   🐳  docker cp src=/Users/jsoref/code/spelling-org/check-spelling.git/. dst=/github/workspace
[Spell checking/Spell checker] ⭐  Run actions/checkout@v2.0.0
[Spell checking/Spell checker]   ✅  Success - actions/checkout@v2.0.0
[Spell checking/Spell checker] ⭐  Run ./
| cwd: /github/workspace
| spellchecker: /github/workspace
[Spell checking/Spell checker]   ❓  ::add-matcher::.git/reporter.json
| Retrieving expect from .github/actions/spelling/expect/Dockerfile.txt
| .github/actions/spelling/expect/README.md.txt
| .github/actions/spelling/expect/action.yml.txt
| .github/actions/spelling/expect/check-pull-requests.sh.txt
| .github/actions/spelling/expect/common.sh.txt
| .github/actions/spelling/expect/docker-setup.sh.txt
| .github/actions/spelling/expect/exclude.pl.txt
| .github/actions/spelling/expect/porcelain.pl.txt
| .github/actions/spelling/expect/reporter.json.txt
| .github/actions/spelling/expect/reporter.pl.txt
| .github/actions/spelling/expect/spelling-unknown-word-splitter.pl.txt
| .github/actions/spelling/expect/trampoline.js.txt
| .github/actions/spelling/expect/unknown-words.sh.txt
| .github/actions/spelling/expect/words.txt
| .github/actions/spelling/expect/xargs_zero.txt
| Retrieving excludes from .github/actions/spelling/excludes.txt
| Retrieving patterns from .github/actions/spelling/patterns.txt
| Retrieving advice from .github/actions/spelling/advice.txt
| Checking spelling...
| (...Excluded paths...)
| Excluded paths:
| \.png$
| ^LICENSE\.txt$
| ^\.dockerignore$
| ^\.github/
| (...Only paths restriction...)
| No only paths restriction file
| (...Spell check...)
| (...Compare expect with new output...)
| (...New output...)
| (...Fewer misspellings...)
|
| There are now fewer misspellings than before
|
| <details><summary>To accept these changes, run the following commands</summary>
|
|
| ```
| perl -e '
| my @expect_files=qw('".github/actions/spelling/expect/Dockerfile.txt
| .github/actions/spelling/expect/README.md.txt
| .github/actions/spelling/expect/action.yml.txt
| .github/actions/spelling/expect/check-pull-requests.sh.txt
| .github/actions/spelling/expect/common.sh.txt
| .github/actions/spelling/expect/docker-setup.sh.txt
| .github/actions/spelling/expect/exclude.pl.txt
| .github/actions/spelling/expect/porcelain.pl.txt
| .github/actions/spelling/expect/reporter.json.txt
| .github/actions/spelling/expect/reporter.pl.txt
| .github/actions/spelling/expect/spelling-unknown-word-splitter.pl.txt
| .github/actions/spelling/expect/trampoline.js.txt
| .github/actions/spelling/expect/unknown-words.sh.txt
| .github/actions/spelling/expect/words.txt
| .github/actions/spelling/expect/xargs_zero.txt"');
| @ARGV=@expect_files;
| my @stale=qw('"aarch aeiou api argv bdc cbeaff chmod cmp config css cwd debian dest dirname elif elsif ENTRYPOINT eol esac excludelist fchurn fileformat FRONTEND github graphql grep gsutil homepage html http ies jq json jsoref junit linux metadata misspellled mkdir mktemp noarch noreply oid oneline pdf perl PIPESTATUS pne png py qq qw rawfile README regex regexp rpmfind rsqm rsync rtn Soref spellchecker spellchecking ssh stderr stdin stdio stdout stedolan substr svg symlinks SZ timeframe tmp uname undef unicode url usr uuid vnd whitelist woord wordlist WORKDIR workflow www xargs xslx "');
| my $re=join "|", @stale;
| my $suffix=".".time();
| my $previous="";
| sub maybe_unlink { unlink($_[0]) if $_[0]; }
| while (<>) {
|   if ($ARGV ne $old_argv) { maybe_unlink($previous); $previous="$ARGV$suffix"; rename($ARGV, $previous); open(ARGV_OUT, ">$ARGV"); select(ARGV_OUT); $old_argv = $ARGV; }
|   next if /^($re)(?:$| .*)/; print;
| }; maybe_unlink($previous);'
| git add .github/actions/spelling/expect || echo '... you want to ensure .github/actions/spelling/expect/5f7f35b25e6bce7b1e5a8f226369a86ab19a623e.txt is added to your repository...'
| ```
| </details>
|
| Please add expect items to a file corresponding to the file with the word.
|
[Spell checking/Spell checker]   ❓  ::remove-matcher owner=check-spelling::
[Spell checking/Spell checker]   ✅  Success - ./
````

You can use `perl -pne 's{^\| }{}'` to strip the Act padding when check-spelling provides a script that it wants you to run (you can of course always manually apply the equivalent changes).

### Concerns

Nektos/Act may be missing support for newer GitHub Action features:

- [workflow_run](https://github.blog/2020-08-03-github-actions-improvements-for-fork-and-pull-request-workflows/)
- [GITHUB_STEP_SUMMARY](https://github.blog/2022-05-09-supercharging-github-actions-with-job-summaries/)

## Runnable script

As of [v0.0.23](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.23), you should be able to run `unknown-words.sh` from a local copy of the [check-spelling repository](https://github.com/check-spelling/check-spelling).


### Running

Parameters that would normally come from GitHub can be passed via a json object in the `INPUTS` environment variable:

```sh
INPUTS='{"extra_dictionaries": "cspell:software-terms/dict/softwareTerms.txt cspell:php/dict/php.txt cspell:node/node.txt cspell:python/src/python/python-lib.txt"}' ~/check-spelling/unknown-words.sh
```

### Results

#### Success

You should see:

```
No new words with misspellings found
```

and the exit status (`$?`) should be `0` (true).

#### Failure

Typically there will be something like:

```markdown
# @check-spelling-bot Report
## :red_circle: Please review

<details><summary>Unrecognized words (38)</summary>
...
```

#### Outputs

There will be lines like:

```
::set-output name=internal_state_directory::/var/folders/r3/n29fz25x72x191fdv6mhhr3m0000gp/T/tmp.mFX5l0SFiO
::set-output name=warnings::/var/folders/r3/n29fz25x72x191fdv6mhhr3m0000gp/T/tmp.gr3kG8pJRq/warnings.txt
```

Presently, items in the `internal_state_directory` are zipped into a file called `artifacts.zip`

#### Accessing outputs

```sh
check_spelling_log=$(mktemp);
(INPUTS='{"extra_dictionaries": "cspell:software-terms/dict/softwareTerms.txt cspell:php/dict/php.txt cspell:node/node.txt cspell:python/src/python/python-lib.txt"}' ~/check-spelling/unknown-words.sh 2>&1 ) > "$check_spelling_log"
if [ $? -gt 0 ]; then
  echo 'check-spelling failed...'
fi

warnings=$(perl -ne 'next unless s/^::set-output name=warnings:://; print' "$check_spelling_log")
export internal_state_directory=$(perl -ne 'next unless s/^::set-output name=internal_state_directory:://; print' "$check_spelling_log")
artifact="$internal_state_directory/artifact.zip"

report_segment() {
file=$(key="$1" perl -ne 'next unless s/^::set-output name=$ENV{key}:://; s!$ENV{internal_state_directory}/!!; print' "$check_spelling_log")
  if [ -n "$file" ]; then
    echo "# $2:"
    unzip -p "$artifact" "$file"
    echo
    echo
  fi
}
if [ -n "$warnings" ] && [ -s "$warnings" ]; then
  echo '# Warnings:'
  cat "$warnings"
  echo
fi
report_segment stale_words 'Stale words'
report_segment skipped_files 'Skipped files'
report_segment unknown_words 'Unknown words'
```

## Single script

The original tool was self contained, but the current script is considerably fancier...

As the script slowly evolves from shell+perl+jq to perl+jq (it could switch from perl+jq to node), maybe it could become a single script again.

In the long term, I'd rather this, but I don't expect to implement this anytime soon.

## Docker image

I investigated using Docker directly and did in the initial versions.

⚠️ The Docker file is no longer the main entrypoint in GitHub as of [0.0.16-alpha](https://github.com/check-spelling/check-spelling/releases/tag/0.0.16-alpha).

Support was removed in an [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20).

If you want to use check-spelling in Docker, please consider using `act` which wraps Docker...

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
