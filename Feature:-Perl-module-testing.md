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
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
