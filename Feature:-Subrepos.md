# Subrepos

Subrepos enable a git repository to reference other git repositories.

## Disclaimers

- I generally don't use subrepos.
- Handled subrepos can result in additional security vulnerabilities.
- There are different approaches to checking them out to try to avoid tripping over the previous point...
- I don't think that GitHub will allow annotations on items from subrepositories.
- I suspect that properly tagging errors in subrepos will be fairly hard (essentially each file reference needs to do some complicated lookup instead of assuming the path is correct).

## Just do it

Caveats aside, a naive implementation that ignores all the likely problems and at least is able to report unrecognized words as seen in a checkout shouldn't be too hard.

## Workaround

If you need something before this feature is implemented, you can basically remove the `.git` directory, do a `git init`, a `git add .`, and a `git commit` before check-spelling runs.

See https://github.com/Lombiq/GitHub-Actions/blob/50a53552bd3e62309cf44ce962fe0fd41abe28ba/.github/workflows/spelling.yml#L70-L79

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
