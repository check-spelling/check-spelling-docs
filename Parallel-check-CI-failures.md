# Parallel check CI failures

Sometimes I generate a series that's >250 items, and then tests fail, and the question is why.
Given that CI is expensive for me to set up locally, and I have limited local CPU cycles, it makes sense to parallelize my testing.

Imagine one could divide a list in halves and take only the odd halves. Then take original list and divide it into quarters and take the odd quarters. Repeat...

This script implements a version of that (the slices aren't precisely as described above, but, the idea applies):

```perl
my $input=shift;
for ($i = 1; $i <= 4; $i++) {
  my $x = 1 << $i;
  my $branch = "spelling-$i";
  print "
git branch -f $branch baseline; git checkout $branch
git cherry-pick ";
  my $y = $x / 2;
  open LIST, "<", $input;
  while (<LIST>) {
    my $line = $.;
    $line = $line % $x;
    if ($line < $y) {
      chomp;
      print "$_ ";
    }
  }
  print "
while [ -e .git/CHERRY_PICK_HEAD ]; do git reset --hard; git cherry-pick --skip; done
";
  close LIST;
}
```

Applied, it generates a number of branches each of which should have different subsets of the commits.

If a branch fails, one can resample that set to find the problem.
If a branch doesn't fail, one can exclude all of its commits and resample the remainder to find the problem.

Since this generates 4 lists, one should be able to perform some intersections to get a fairly small list of potential culprits.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
