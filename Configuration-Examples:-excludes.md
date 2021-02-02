# `excludes` Examples

Note that regular expressions are generally case-sensitive. You can use `(?:(?i)...)` to make a line case-insensitive (currently all lines are treated together, so if you don't scope your item, it will carry through to the remaining lines, which is could be unexpected -- this is likely to change in the neat future).

```
# Ignore directories (Golang) named `vendor`
(?:^|/)vendor/
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
# Ignore GitHub `CONTRIBUTING.md` in the root
^CONTRIBUTING\.md$
# Ignore the action's configuration data
^\.github/action/spelling/
# Ignore all GitHub workflow files
^\.github/workflows/
```
