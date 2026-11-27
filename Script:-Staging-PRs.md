If you want to see what would happen if you applied check-spelling to a repository, here's a handy script that will create copies of open PRs into a testing repository.

## Script

```perl
#!/usr/bin/env perl
# migrate-prs
#
# This script will migrate PRs from `origin` to `check-spelling`
#
# It expects that `gh` is configured with credentials
# It expects that `git` can `fetch` from `origin` and `push` to `check-spelling`
my @branches;
open MERGES, 'git ls-remote origin|';
while (<MERGES>) {
    next unless m{^([0-9a-f]+)\s+refs/pull/(\d+)/merge$};
    my ($sha, $pr) = ($1, "pr-$2");
    system('git', 'fetch', 'origin', $sha);
    system('git', 'branch', '-f', $pr, $sha);
    push @branches, $pr;
}
close MERGES;
system('git', 'push', 'check-spelling', @branches);
my $repo=`git remote get-url --push check-spelling`;
chomp $repo;
$repo=~s{.*[:/]([^/]+/[^/]+?)(?:\.git|)$}{$1};
for $branch (@branches) {
    system('gh', 'pr', 'create', '-f', '-R', $repo, '-H', $branch, '-t', "(origin) $branch",
    '-b', 'Automatic PR to preview spell-check status');
}
```

## Usage

1. `git remote add origin upstream-url`
2. `git remote add check-spelling testing-fork-url`
3. `migrate-prs`

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
