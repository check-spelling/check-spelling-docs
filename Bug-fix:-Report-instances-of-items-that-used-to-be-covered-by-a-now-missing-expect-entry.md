# Report instances of items that used to be covered by a now missing expect entry

## Setup

1. You have `helllo` in a `file.log`
2. You have `Helllo` in a `README.md`
3. You add `helllo` to `expect.txt` to make check-spelling happy

## Action

1. You delete `file.log`
2. You commit
3. You push

## Without this change

check-spelling would complain about `Helllo` (suggesting adding it to `expect.txt`) and suggest removing `helllo` from `expect.txt`, but it wouldn't explain where it found `Helllo`.

## With this change

check-spelling would complain about `Helllo` (suggesting adding it to `expect.txt`), suggest removing `helllo` from `expect.txt`, and explain it found `Helllo` in `README.md`.

## Availability

Expected to be available in [v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22)

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
