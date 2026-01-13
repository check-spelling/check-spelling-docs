# Rebasing spelling PRs

These scripts require functions from [Looking for items locally](Looking-for-items-locally)

- `what_was_removed` is vaguely helpful to search for hunks that moved outside of merge conflicts
- `where_are_they_now` is the counterpart to `what_was_removed` -- when this happens, use `rs what_was_removed replacement commit_word` -- if there's more than one, then use `git reset HEAD~` and repeat
- `remap_pair` -- calls `rs` to replace a word pair, but then uncommits (because rebase)
- `are_they_still_here` -- checking to see if typos have relocated
- `lets_go_with_this` -- accepts the current state of things
- `handle_conflicts` and `moving_on` are a way to move through `git rebase main`
- `git_compare_branches` `git_compare_branches fork/main...fork/spelling upstream/main...spelling`
- `git_diff_filter` -- mostly for use w/ `git_compare_branches`
- `drop_everything` -- mostly for rebasing onto trees that have deleted files (typically for splitting a branch)
- `top_wins` -- pick the first side of a three way merge
- `what_needs_to_be_fixed` -- look for items that were removed in the current proposed commit but are still present when the commit conflicted

```sh
what_was_removed() {
  git show --word-diff -U0 $1 |
    perl -ne 'next unless s/(\[-[^\]]+-\])/\n$1\n/g; print' |
    perl -ne 'next unless s/\[-([^\]]+)-\]/$1/; print'|
    sort -u
}

where_are_they_now() {
  for a in `cat`; do
    peek $a
  done
}

remap_pair() {
  rs "$1" "$2";
  git reset HEAD~
}

are_they_still_here() {
  git show $(cat .git/rebase-merge/stopped-sha) |
    rediff |
    perl -ne 'next unless s/^-([^-])/$1/;s/[(), ]/\n/g;print' |
    sort -u |
    review -
}

lets_go_with_this() {
  git add -u
  GIT_EDITOR=true git rebase --continue
}

handle_conflicts() {
  conflict_files=$(git status|perl -ne 'next unless s/^\s*deleted by us:\s*//; print')
  if [ -n "$conflict_files" ]; then
    git rm $(echo $conflict_files|xargs echo)
  fi
  conflict_files=$(git status|perl -ne 'next unless s/^\s*both modified:\s*//; print')
  if [ -n "$conflict_files" ]; then
    vi $(echo $conflict_files|xargs echo)
  fi
}

moving_on() {
  lets_go_with_this
  handle_conflicts
}

git_diff_filter() {
  perl -pne 's{ [0-9a-f]{10,} spelling:}{ spelling:};s{index [0-9a-f]{10,}\.\.[0-9a-f]{10,} (100[0-7]{3})}{index ... .. ... $1};s{\@\@ -\d+(?:,\d+|) \+\d+(?:,\d+|) @@.*}{\@\@ -.. +.. \@\@}'
}

git_compare_branches() {
  orig=$(mktemp)
  repl=$(mktemp)
  git log --oneline --graph --word-diff -U0 $1|git_diff_filter > $orig;
  git log --oneline --graph --word-diff -U0 $2|git_diff_filter > $repl;
  diff -u $orig $repl|less
  rm $orig $repl
}

drop_everything() {
  handle_conflicts; while [ -e .git/rebase-merge/git-rebase-todo ] ; do
    moving_on
  done
}

top_wins() {
  perl -pi -e '$/=undef; s/^<<<<<<< HEAD\n//gms;s/\n=======.*?>>>>>>>[^\n]*//msg' "$@"
}

what_needs_to_be_fixed() {
  git show $(
    git status |
    grep -B1 'see more' |
    head -1 |
    perl -ne 'next unless s/^.* pick (\w+) .*/$1/;print'
  ) --oneline -U0 |
  rediff |
  perl -ne 'next unless s/^-//;next if /^-/; print' |
  review
}
```

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
