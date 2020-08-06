# Looking for items locally

This is a lazy script -- which isn't aware of all the features (e.g. it ignores `allow` and `only`), but for average cases:
```sh
files=$(git ls-files | perl -e 'open E, q{<}, q{.github/actions/spelling/excludes.txt}; my $e; { local $/; $e=<E>}; $e =~ s/\n$//; $e =~ s/\n/|/g; while (<>) { print unless /$e/; }')

patterns=$(perl -ne 'next if /^#/;next unless /./;print' .github/actions/spelling/patterns.txt |tr "\n" "|"|perl -pne 's/\|$//')

peek() { echo "$files"|tr "\n" "\0" | xargs -0 grep "$1"|perl -pne 's{'"$patterns"'}{}g' |uniq | grep --color=always "$1"; }
```

usage:
```
peek "some"t"hang"
```
