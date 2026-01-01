#!/usr/bin/env perl

# This script should be placed inside the GitLab project-name.wiki/ folder
# Right outside the .git folder

# It does not search recursively, only within the same directory level from which it is run.
# It only works for files with .md extension

my @files=@ARGV;
exit unless @files;

my %known_files = (
  'Home' => '/',
  'Accepting-Suggestions' => 'https://github.com/check-spelling/check-spelling/blob/2074dd3dd41f898548c4ca8b875078fb4f81bdf0/',
  'Workflow-Permissions' => 'https://github.com/check-spelling/check-spelling/blame/d3cce3b78ad672e8714b4e353785a70fbaebaa2d/action.yml#L506',
);

my %file_patterns;
for my $file (@files) {
  next if $file =~ /^_/; # Wiki magic files
  my $fileNameNoExtension = $file;
  $fileNameNoExtension =~ s/\.md$//;
  next if defined $known_files{$fileNameNoExtension};
  $fileNameNoExtension =~ s/-/./g;
  $fileNameNoExtension =~ s/:/(?:%3A|:)/g;
  $fileNameNoExtension =~ s/`/(?:\\\\`|%60)/g;
  $file_patterns{$file} = $fileNameNoExtension;
}
while (<>) {
  for my $file (keys %file_patterns) {
    next if $file eq $ARGV;
    delete $file_patterns{$file} if /$file_patterns{$file}/;
  }
}
for my $file (sort keys %file_patterns) {
  print "$file\n";
}
