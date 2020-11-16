# Looking for items locally

This is a lazy script -- which isn't aware of all the features, but for average cases it should work:
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
  [ -z "$1" ] && return;
  echo "$files" |
  tr "\n" "\0" |
  xargs -0 grep -- "$1" 2>/dev/null |
  pattern="$patterns" perl -pne '$pattern=$ENV{pattern};s{(^[^:]*:)}{};$file=$1;s{$pattern}{}g;s{^}{$file};' |
  uniq |
  grep --color=always -- "$( 
    pattern="$1" perl -e '$pattern=$ENV{pattern};
      $b = q<\b>;
      $p = q<\|>;
      $o = q<\(>;
      $c = q<\)>;
      $l = q<[^A-Z]>;
      $u = q<[^a-z]>;
      sub format_lower {
        return "$o$b$p$u$c$_[0]$o$b$p$u$c";
      }
      sub format_upper {
        return "$o$b$p$l$c$_[0]$o$b$p$l$p$u$l$l$c";
      }
      sub format_title {
        return "$o$b$p$l$c$_[0]$o$b$p$u$c";
      }
      if ($pattern =~ /^$l/) {
        $upper_pattern = $pattern;
        $upper_pattern =~ tr/[a-z]/[A-Z]/;
        $title_pattern = substr($upper_pattern, 0, 1).(substr $pattern, 1);
        print format_lower($pattern).$p.format_upper($upper_pattern).$p.format_title($title_pattern);
      } elsif ($pattern =~ /^$u{2,}$/) {
        print format_upper($pattern);
      } elsif ($pattern =~ /^$u+$l/) {
        print format_title($pattern) ;
      }
    '
  )";
}

tokenlist() {
  echo "$files" |
  tr "\n" "\0" |
  xargs -0 cat 2>/dev/null |
  pattern="$patterns" perl -pne '$pattern=$ENV{pattern};s{$pattern}{}g;' |
  w
}
splittokens() {
  perl -pne 'next unless s/.*\((.*)\)/$1/; s/[ ,]+/\n/g'
}

review() {
  for a in $(cat $1); do
    echo;
    echo;
    echo ::$a:;
    echo;
    peek $a; done |
  uniq |
  less -R
}
```

### usage
#### find instances
```sh
peek "some"t"hang"
```
#### look for and review items
```sh
tokenlist | splittokens > file
review file
```
#### build an expect file
```sh
tokenlist | perl -pne 's/ .*/' > .github/actions/spell*/expect.txt
```
#### review the expect file
```sh
review .github/actions/spell*/expect.txt
```