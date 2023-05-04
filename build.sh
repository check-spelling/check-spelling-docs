#!/bin/sh
if [ ! -e index.md ] && [ -e Home.md ]; then
  git mv Home.md index.md
fi
perl -pi -e '
sub fix_hash {
  my ($a) = @_;
  $a =~ tr/[A-Z_ ]/[a-z\-\-]/;
  return $a;
};
sub fix_anchor {
  my ($a) = @_;
  $a =~ s{(#[-.\w\d ]*)}{fix_hash($1)}e;
  return $a;
};
sub fix_page {
  my ($a) = @_;
  $a =~ tr/ /-/;
  unless ($a =~ /\.md/) {
    if (/#/) {
      $a =~ s/(.)#/$1.md#/;
    } else {
      $a =~ s/(.)$/$1.md/;
    }
  }
  $a =~ s{^([^.][^:]*)(:)}{./$1$2};
  return fix_anchor($a);
};
$backticks++ if (/\`\`\`/);
next if $backticks % 2;
s{(\[[^\]]*\])(\(#[^)]*\))}{"$1".fix_anchor($2)}ge;
s{\[([^\]]*)\]\(((?:(?!://)[^)])*)\)}{"[$1](".fix_page($2).")"}ge;
s{\[\[([^\]|]*?)\|((?:(?!://)[^)])*?)\]\]}{"[$1](".fix_page($2).")"}ge;
s{\[\[([^\]|]*?)\|([^\]]*?)\]\]}{[$1]($2)}g;
s{\[\[([^\]|]*?)\]\]}{"[$1](".fix_page($1).")"}ge;
s{https://github\.com/([^/\]\)]+/[^/\]\)]+)/blob/([^/\]\)]+/[^\)"]*)}{https://raw.githubusercontent.com/$1/$2};
s{^[-*] \[x\](\s*\S.*)}{&#x2611;$1\n};
s{^[-*] \[ \](\s*\S.*)}{&#x2610;$1\n};
' *.md
for maybe_missing_eol in *.md; do
  if [ -s "$maybe_missing_eol" ] && [ $(tail -1 "$maybe_missing_eol" | wc -l) -eq 0 ]; then
    echo >> "$maybe_missing_eol"
  fi
done
if [ -s  _Footer.md ]; then
  footer=$(head -1 _Footer.md)
  for file in $(
    git ls-files '*.md' -z |
    perl -e '$/="\0"; while (<>) { next if m{^(?:_|\.github/)}; print }' |
    xargs -0 grep -L -F "$footer"
  ); do
    (
      echo
      echo '---'
      echo "$footer"
    ) >> "$file"
  done
fi
