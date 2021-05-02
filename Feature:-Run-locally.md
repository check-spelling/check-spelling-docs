# Running locally to check for new errors

Possible approaches:

* [Act](#act)
* [Single script](#Single-script)
* [Docker image](#Docker-image)

## Act

[Act](https://github.com/nektos/act) is a tool which uses Docker to run GitHub Actions locally.

Requires Act [v0.2.9](https://github.com/nektos/act/releases/tag/v0.2.9)+.

```
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
```

### Concerns

Nektos/Act may be missing support for newer GitHub Action features:

* [composite](https://github.blog/changelog/2020-08-07-github-actions-composite-run-steps/) - [nektos/act#339](https://github.com/nektos/act/issues/339)
* [pull_request_target](https://github.blog/2020-08-03-github-actions-improvements-for-fork-and-pull-request-workflows/)
* [workflow_run](https://github.blog/2020-08-03-github-actions-improvements-for-fork-and-pull-request-workflows/)

## Single script

The original tool was self contained, but the current script is considerably fancier...

As the script slowly evolves from shell+perl+jq to perl+jq (it could switch from perl+jq to node), maybe it could become a single script again.

In the long term, I'd rather this, but I don't expect to implement this anytime soon.

## Docker image

As of **0.0.15-alpha**, there is a `Dockerfile` and its default path is to *check spelling* (there are other paths for checking pull requests and there will be a path for interacting with comments).
⚠️ The Docker file is no longer be the main entrypoint in GitHub as of **0.0.16-alpha**.

* Publish a docker image.

* Provide a command:

   `docker run --rm some-registry/check-spelling:prelease -v $PWD:/check-this:ro`

### Users pass environment variables

The simplest version would require the user to pass `-e bucket ...` and `-e project ...`.

The implementation cost for this isn't terribly high, as there's already a Docker file and the changes required to support this are fairly minimal.

### GitHub Workflow discovery

A fancier version could look through `.github/workflows/` and find the check-spelling configurations.

This would require much more work and would never be perfect. It should be able to fish out multiple run cases, but I don't expect that I'd handle `if` conditions or any prerequisites.

### Pick a registry

This would require picking a registry.

* [[GitHub|https://github.com/features/packages#pricing]] charges after 1GB of outbound use. I'd hope that I wouldn't hit this, but I could easily be unlucky.
* [[Quay.io|https://quay.io]] appears to be free for open source, although their web portal instructions point to a path which isn't free.

Thankfully, this is no longer a concern, as Dockerfile is no longer used by the action.
