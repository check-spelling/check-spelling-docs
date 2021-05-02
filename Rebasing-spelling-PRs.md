# Rebasing spelling PRs

These scripts require functions from [[Looking for items locally|Looking for items locally]]

* `what_was_removed` is vaguely helpful to search for hunks that moved outside of merge conflicts
* `where_are_they_now` is the counterpart to `what_was_removed` -- when this happens, use `rs what_was_removed replacement commit_word` -- if there's more than one, then use `git reset HEAD~` and repeat
* `handle_conflicts` and `moving_on` are a way to move through `git rebase main`
* `git_compare_branches` `git_compare_branches fork/main...fork/spelling upstream/main...spelling`
* `git_diff_filter` -- mostly for use w/ `git_compare_branches`

```
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
  git add -u
  GIT_EDITOR=true git rebase --continue
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
```
