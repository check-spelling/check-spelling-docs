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

🚧  There are unfortunately quite a few quirks in tooling. Most effort has been made to make it possible to ask the bot to update the commit for users and that feature is in fairly good shape at this point. Work is underway to get the commands to work reasonably well on Windows in 2022-May for 0.0.20.

### Dissecting the command 

<!-- From
https://github.com/microsoft/terminal/blame/866d22e3a140ef252e2d777c4bbf0c6d4861a3d4/.github/actions/spelling/advice.md#L7-L9
-->
⚠️ The command is written for posix shells. You can copy the contents of each `perl` command excluding the outer `'` marks and dropping any `'"`/`"'` quotation mark pairs into a `file.pl` and then run `perl file.pl` from the root of the repository to run the code. Alternatively, you can manually insert the items...

Note that if the command is fancy and relies on `curl`, `jq`, and `||`, this will probably be a bit frustrating.

<details><summary>Programs potentially used by the command in the comment</summary>

* cat
* curl
* git
* grep
* jq
* mkdir
* mktemp
* mv
* perl
* rm
* sh
* sort
* tr
* uniq

</details>

⚠️ If the command includes `rsync`, it probably won't work on Windows, and certain commands that use `jq` to send output to `perl` w/o an intermediate `tr` will probably not work either. (An unreleased version of `jq` could make this work, but...) -- These commands will be replaced by 0.0.20.

The easiest way to run the command from the comment is via a git bash shell (which should give you most of the above, but notably not `jq`).

You can get a reasonably good `Git Bash` environment using [chocolatey aka `choco`](https://chocolatey.org/install): `choco install git jq`.

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
update_files() {
perl -e '
my @expect_files=qw('".github/actions/spelling/expect.txt"');
@ARGV=@expect_files;
my @stale=qw('"$patch_remove"');
my $re=join "|", @stale;
my $suffix=".".time();
my $previous="";
sub maybe_unlink { unlink($_[0]) if $_[0]; }
while (<>) {
if ($ARGV ne $old_argv) { maybe_unlink($previous); $previous="$ARGV$suffix"; rename($ARGV, $previous); open(ARGV_OUT, ">$ARGV"); select(ARGV_OUT); $old_argv = $ARGV; }
next if /^(?:$re)(?:(?:\r|\n)*$| .*)/; print;
}; maybe_unlink($previous);'
perl -e '
my $new_expect_file=".github/actions/spelling/expect.txt";
use File::Path qw(make_path);
use File::Basename qw(dirname);
make_path (dirname($new_expect_file));
open FILE, q{<}, $new_expect_file; chomp(my @words = <FILE>); close FILE;
my @add=qw('"$patch_add"');
my %items; @items{@words} = @words x (1); @items{@add} = @add x (1);
@words = sort {lc($a) cmp lc($b)} keys %items;
open FILE, q{>}, $new_expect_file; for my $word (@words) { print FILE "$word\n" if $word =~ /\w/; };
close FILE;'
}

comment_json=$(mktemp)
curl -L -s -S \
  --header "Content-Type: application/json" \
  "https://api.github.com/repos/check-spelling/examples-testing/issues/comments/766297354" > "$comment_json"
comment_body=$(mktemp)
jq -r .body < "$comment_json" > $comment_body
rm $comment_json
patch_remove=$(perl -ne 'next unless s{^</summary>(.*)</details>$}{$1}; print' < "$comment_body")
patch_add=$(perl -e '$/=undef;
$_=<>;
s{<details>.*}{}s;
s{^#.*}{};
s{\n##.*}{};
s{(?:^|\n)\s*\*}{}g;
s{\s+}{ }g;
print' < "$comment_body")
update_files
rm $comment_body
git add -u &&
[ ! -e "$new_expect_file" ] || git add "$new_expect_file"
```

</details>

Paste it into the shell. You should see something like this:

```sh
IEUser@VM MINGW64 ~/examples-testing (mary)
$ update_files() {
> perl -e '
> my @expect_files=qw('".github/actions/spelling/expect.txt"');
> @ARGV=@expect_files;
> my @stale=qw('"$patch_remove"');
> my $re=join "|", @stale;
> my $suffix=".".time();
> my $previous="";
> sub maybe_unlink { unlink($_[0]) if $_[0]; }
> while (<>) {
> if ($ARGV ne $old_argv) { maybe_unlink($previous); $previous="$ARGV$suffix"; rename($ARGV, $previous); open(ARGV_OUT, ">$ARGV"); select(ARGV_OUT); $old_argv = $ARGV; }
> next if /^(?:$re)(?:(?:\r|\n)*$| .*)/; print;
> }; maybe_unlink($previous);'
> perl -e '
> my $new_expect_file=".github/actions/spelling/expect.txt";
> use File::Path qw(make_path);
> use File::Basename qw(dirname);
> make_path (dirname($new_expect_file));
> open FILE, q{<}, $new_expect_file; chomp(my @words = <FILE>); close FILE;
>  @wmy @add=qw('"$patch_add"');
> my %items; @items{@words} = @words x (1); @items{@add} = @add x (1);
> /\w/@words = sort {lc($a) cmp lc($b)} keys %items;
> open FILE, q{>}, $new_expect_file; for my $word (@words) { print FILE "$word\n" if $word =~ /\w/; };
> close FILE;'
> }

comment_json=$(mktemp)
curl -L -s -S \
  --header "Content-Type: application/json" \
  "https://api.github.com/repos/check-spelling/examples-testing/issues/comments/766297354" > "$comment_json"
comment_body=$(mktemp)
jq -r .body < "$comment_json" > $comment_body
rm $comment_json
patch_remove=$(perl -ne 'next unless s{^</summary>(.*)</details>$}{$1}; print' < "$comment_body")
patch_add=$(perl -e '$/=undef;
$_=<>;
s{<details>.*}{}s;
s{^#.*}{};
s{\n##.*}{};
s{(?:^|\n)\s*\*}{}g;
s{\s+}{ }g;
print' < "$comment_body")
update_files
rm $comment_body
git add -u &&
[ ! -e "$new_expect_file" ] || git add "$new_expect_file"
IEUser@VM MINGW64 ~/examples-testing (mary)
$

IEUser@VM MINGW64 ~/examples-testing (mary)
$ comment_json=$(mktemp)

IEUser@VM MINGW64 ~/examples-testing (mary)
$ curl -L -s -S \
>   --header "Content-Type: application/json" \
>   "https://api.github.com/repos/check-spelling/examples-testing/issues/comments/766297354" > "$comment_json"

IEUser@VM MINGW64 ~/examples-testing (mary)
$ comment_body=$(mktemp)

IEUser@VM MINGW64 ~/examples-testing (mary)
$ jq -r .body < "$comment_json" > $comment_body

IEUser@VM MINGW64 ~/examples-testing (mary)
$ rm $comment_json

IEUser@VM MINGW64 ~/examples-testing (mary)
$ patch_remove=$(perl -ne 'next unless s{^</summary>(.*)</details>$}{$1}; print' < "$comment_body")

IEUser@VM MINGW64 ~/examples-testing (mary)
$ patch_add=$(perl -e '$/=undef;
> $_=<>;
> s{<details>.*}{}s;
> s{^#.*}{};
> s{\n##.*}{};
> s{(?:^|\n)\s*\*}{}g;
> s{\s+}{ }g;
> print' < "$comment_body")

IEUser@VM MINGW64 ~/examples-testing (mary)
$ update_files

IEUser@VM MINGW64 ~/examples-testing (mary)
$ rm $comment_body

IEUser@VM MINGW64 ~/examples-testing (mary)
$ git add -u &&
> [ ! -e "$new_expect_file" ] || git add "$new_expect_file"
warning: LF will be replaced by CRLF in .github/actions/spelling/expect.txt.
The file will have its original line endings in your working directory

IEUser@VM MINGW64 ~/examples-testing (mary)
$
```

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
