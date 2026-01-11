# Perl module testing

Included in [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20)

## Background

check-spelling is built around some small perl blobs.

Eventually, the shell script that drives it may also be converted into a perl script...

Testing coverage would make it easier to make changes to check-spelling and have confidence that they don't break things.

## Perl modules

The first step is splitting the perl scripts into tiny `.pl` wrapper scripts and a similarly named `.pm` module file.

## Testing

Using `Test::More` gives basic test coverage for the tiny files.

It also provides a roadmap for more test coverage.

## Future steps

I might try [Devel::Cover](https://metacpan.org/pod/Devel::Cover)

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
