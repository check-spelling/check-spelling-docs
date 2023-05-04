#!/usr/bin/env perl

BEGIN { $^I = ""; }

sub fix_hash {
  my ($a) = @_;
  $a =~ s/_//g;
  $a =~ tr/[A-Z ]/[a-z\-]/;
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
  unless ($a =~ m{^https?://}) {
    unless ($a =~ /\.md/) {
      if (/#/) {
        $a =~ s/(.)#/$1.md#/;
      } else {
        $a =~ s/(.)$/$1.md/;
      }
    }
    $a =~ s{^([^.][^:]*)(:)}{./$1$2};
  }
  return fix_anchor($a);
};

LINE: while (defined($_ = readline ARGV)) {
  s/\{\{/{% raw %}{{{% endraw %}/g unless /\% raw \%.*\% endraw \%/;
  $backticks++ if (/\`\`\`/);
  next if $backticks % 2;
  s{\]\(\.\./}{](./}g;
  s{(\[[^\]]*\])(\(#[^)]*\))}{"$1".fix_anchor($2)}ge;
  s{(?<!\\)\[([^\]]*)\]\(((?:(?!://)[^)])*)\)}{"[$1](".fix_page($2).")"}ge;
  s{\[\[([^\]|]*?)\|((?:(?!://)[^)])*?)\]\]}{"[$1](".fix_page($2).")"}ge;
  s{\[\[([^\]|]*?)\|([^\]]*?)\]\]}{[$1]($2)}g;
  s{\[\[([^\]|]*?)\]\]}{"[$1](".fix_page($1).")"}ge;
  s{\]\(https://github.com/check-spelling/check-spelling/wiki/([^\)]+)\)}{"\]\(".fix_page($1).")"}ge;
  s{https://github\.com/([^/\]\)]+/[^/\]\)]+)/blob/([^/\]\)]+/[^\)"#]*)($|\s|[\)"])}{https://raw.githubusercontent.com/$1/$2$3};
  s{^[-*] \[x\](\s*\S.*)}{&#x2611;$1\n};
  s{^[-*] \[ \](\s*\S.*)}{&#x2610;$1\n};
}
continue {
    die "-p destination: $!\n" unless print $_;
}

