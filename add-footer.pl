#!/usr/bin/env perl
$/="\0";
my $footer=$ENV{"footer"};
my $quoted_footer=quotemeta($footer);
while (<>) {
  next if m{^(?:_|\.github/)};
  my $path = $_;
  my $filename = $path;
  chomp $filename;
  open my $file, "<", $filename;
  {
    local $/ = /\R/;
    my $has_footer = 0;
    for my $line (<$file>) {
      next unless $line =~ /$quoted_footer/;
      $has_footer = 1;
      break;
    }
    close $file;
    unless ($has_footer) {
      open $file, ">>", $filename;
      print $file "\n---\n$footer\n";
      close $file;
    }
  }
}
