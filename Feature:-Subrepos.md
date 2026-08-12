# Subrepos

Submodules enable a git repository to reference other git repositories.

## Disclaimers

- I generally don't use submodules or subtrees (an alternative to submodules).
- Handled submodules/subtrees can result in additional security vulnerabilities.
- There are different approaches to checking them out to try to avoid tripping over the previous point...
- GitHub doesn't appear to allow annotations on items from submodules (as subtrees are _mostly_ treated as normal files in a git repository, this is less of an issue)

## Workaround

If you need something before this feature is implemented, you can basically remove the `.git` directory, do a `git init`, a `git add .`, and a `git commit` before check-spelling runs.

See https://github.com/Lombiq/GitHub-Actions/blob/50a53552bd3e62309cf44ce962fe0fd41abe28ba/.github/workflows/spelling.yml#L70-L79

## Implementation

[v0.0.25](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.25) includes initial support for `submodules`.

Whether you use [`actions/checkout`](https://github.com/actions/checkout) yourself or use [`checkout`](Configuration#checkout), you can add [`submodules`](Configuration#submodules):

```yaml
with:
  submodules: true
```

or
```yaml
with:
  submodules: recursive
```

to the check-spelling configuration to enable check-spelling to check files in submodules.

If using [`checkout`](Configuration#checkout), check-spelling will try to check out your submodules (it has some additional code to avoid tripping on broken submodules, because this stuff is a mess).

check-spelling will list files from submodules and check them as long as they aren't excluded by your normal excludes configuration.

Files with issues will have annotated links to their origin repositories.

SARIF reports will include their paths, but GitHub will not be happy about them because the files are not part of the main repository. (Other tools that consume the files should be happy as long as they are present in your working repository.)

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
