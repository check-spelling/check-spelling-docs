# Looking for items locally

This is a lazy script -- which isn't aware of all the features, but for average cases:
```sh
files=$(
  git ls-files | 
  perl -e '
    sub readstring {
      open F, q{<}, glob($_[0]);
      local $/;
      local $f = <F>;
      $f =~ s/\n$//;
      $f =~ s/\n/|/g;
      return $f;
    }
    my $e = readstring(".github/actions/spell*/excludes.txt");
    $e = q<^$> if $e eq "";
    my $o = readstring(".github/actions/spell*/only.txt");
    $o = q<.> if $o eq "";
    while (<>) { next if /$e/; next unless /$o/; print }
  ')

patterns=$(
  perl -ne '
    next if /^#/;
    next unless /./;
    print' .github/actions/spell*/patterns.txt |
  tr "\n" "|"|
  perl -pne 's/\|$//'
)

peek() {
  echo "$files" |
  tr "\n" "\0" |
  xargs -0 grep "$1" 2>/dev/null |
  perl -pne 's{'"$patterns"'}{}g' |
  uniq |
  grep --color=always "$( 
    perl -e '$pattern="'$1'";
      $search = q<[A-Z]\)>.$pattern.q<\(\b\|[A-Z]> if $pattern =~ /^[a-z]/;
      $search = q<[a-z]\)>.$pattern.q<\(\b\|[a-z]\|[A-Z][a-z][a-z]> if $pattern =~ /^[A-Z]{2,}$/;
      $search = q<[a-z]\)>.$pattern.q<\(\b\|[A-Z]> if $pattern =~ /^[A-Z]+[a-z]/;
      print q<\(\b\|>.$search.q<\)>;
   '
  )";
}

review() {
  for a in $(cat $1); do
    echo;
    echo;
    echo ::$a:;
    echo;
    peek $a; done |
  uniq |
  less -r
}
```

usage:
```sh
peek "some"t"hang"
```
```sh
review .github/actions/spell*/expect.txt
```
