# Behavior change: Consumed line endings

Through [v0.0.19](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.19), the line ending was included as part of the line being parsed.

With the [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20), the line ending will not be included in the parsed content.

This could impact patterns that specifically look for `\n` / `\r` / ….

The change is mostly designed to make it easier for forbidden patterns to do something like:

`\s(\w{3,})\s\g{-1}\s` and have it not match (`pkg/strutil/strutil_test.go`):

```
	args args
```

Without this change, the code would log:

```
pkg/strutil/strutil_test.go: line 135, columns 2-12, Warning - `	args args
pkg/strutil/strutil_test.go: ` matches a line_forbidden.patterns entry. (forbidden-pattern)
```

I couldn't think of any better contortions to prevent this messy output.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
