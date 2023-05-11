# Replace jq

`jq` is a handy tool for writing shell scripts, but it's also frustrating.

Perl (5.14+) provides [JSON::PP](https://perldoc.perl.org/JSON::PP) which can handle the json parsing side of things.
Evaluating then becomes a problem for Perl instead of another programming language.

## Tasks

- [x] `--slurpfile` is pretty magical, but it's only used in one place
- [ ] `wrap_in_json` is a function, so replacing it should be pretty easy
- [ ] `wrap_file_in_json` is a function, so replacing it should be pretty easy
- [ ] `jq -s` is used once
- [ ] `jq --arg` is used once in a call curl which could be replaced by `gh`
- [ ] `jq length` is used once
- [ ] `jq` w/o `-r` has a handful of other uses which probably should all have `-r`
- [ ] `jq -r` is used >80 times -- they're all fairly simple, but replacing them will probably happen as more code is refactored from shell to perl
