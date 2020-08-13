# `excludes` Examples
```
# Ignore directories (Golang) named `vendor`
(?:^|/)vendor/
# Ignore files named (yarn for Node.js) `yarn.lock`
(?:^|/)yarn\.lock$
# Ignore files or directories that have `LICENSE` somewhere in their path
LICENSE
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
