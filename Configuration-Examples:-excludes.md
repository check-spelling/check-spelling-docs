# `excludes` Examples

Note that regular expressions are generally case-sensitive. You can use `(?:(?i)...)` to make a line case-insensitive (currently all lines are treated together, so if you don't scope your item, it will carry through to the remaining lines, which is could be unexpected -- this is likely to change in the near future).

```
# Ignore directories (Golang) named `vendor`
(?:^|/)vendor/
# Ignore directories named `third_party`
(?:^|/)third_party/
# Ignore files named (yarn for Node.js) `yarn.lock`
(?:^|/)yarn\.lock$
# Ignore files named (rust) `Cargo.toml`
(?:^|/)Cargo\.toml$
# Ignore files or directories that case-insensitively have `LICENSE` somewhere in their path
(?:(?i)LICENSE)
# Ignore files ending in...
\.pdf$
\.png$
# Ignore Excel files (`.xsl` and `.xslx`)
\.xslx?$
# Ignore locales that aren't en / en_GB (roughly: keep en_US and drop everything else)
locales/(?!en)
locales/en_GB
# Ignore GitHub `CONTRIBUTING.md` in the root
^CONTRIBUTING\.md$
# Ignore the action's configuration data
^\.github/action/spelling/
# Ignore all GitHub workflow files
^\.github/workflows/
```

## Convert paths to regular expressions

If you have full file paths you want to exclude, see [[Files to Excludes]] for a script to convert them to a regular expression for use in `excludes.txt`.