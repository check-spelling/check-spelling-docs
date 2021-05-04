# Configuration: Multiple languages

## Background

Projects often contain code written in multiple programming languages
or even documentation written in multiple human languages.

The simplest approach is to just run the spell-checker over the whole system
and add items to the dictionary/exceptions regardless of their origin.

It might be the case that one actually has differing word choice rules
depending on the language.

It is possible to enforce this today using a single workflow file.

## Working approach

(as of 0.0.16-alpha)

To define multiple language sets, one can:

`.github/workflows/spelling.yml`:
```yml
name: Spell checking
on:
  push:
    branches:
      - "**"
    tags-ignore:
      - "**"
  schedule:
    # * is a special character in YAML so you have to quote this string
    - cron: '5 * * * *'

jobs:
  spell-check:
    name: Spell checker
    runs-on: ubuntu-latest
    continue-on-error: true
    strategy:
      matrix:
        language: [python, java]
    steps:
    - uses: actions/checkout@v2.0.0
      with:
        fetch-depth: 2
    - uses: check-spelling/check-spelling@0.0.16-alpha
      env:
        bucket: .github/actions/spelling
        project: ${{ matrix.language }}
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

* `.github/actions/spelling/common/`:
  * `advice.txt`:
    You can include advice explaining how to update things and
    when to put items into `common/` instead of into the specific directories.
  * `dictionary.txt`:
    *Your global dictionary*
  * `excludes.txt`
    *Your global excludes*
  * `patterns.txt`:
    *Your global patterns*
  * ⚠️ You probably do not want to include `expect` in `common/`.
* `.github/actions/spelling/python/`:
  * `advice.txt`:
    *symlink* to `../common/advice.txt`
  * `dictionary/`:
    * `dictionary.txt`:
      *symlink* to `../../common/dictionary.txt`
    * `python.txt`:
      *Python dictionary*
   * `excludes/`:
     * `excludes.txt`:
       *symlink* to `../../common/excludes.txt`
     * `python.txt`:
       *Rules to exclude non python files*
   * `only.txt`:
       ```text
       \.py$
       ```
   * `expect/`:
      * `expect.txt`:
        *Python expect*
* `.github/actions/spelling/java/`:
  * `advice.txt`:
    *symlink* to `../common/advice.txt`
  * `dictionary/`:
    * `dictionary.txt`:
      *symlink* to `../../common/dictionary.txt`
    * `java.txt`:
      *Java dictionary*
   * `excludes/`:
     * `excludes.txt`:
       *symlink* to `../../common/excludes.txt`
   * `only.txt`:
       ```text
       \.java$
       ```
     * `java.txt`:
       *Rules to exclude non java files*
   * `expect/`:
      * `expect.txt`:
        *Java expect*

## Downsides
You will get distinct reports
(i.e. potentially multiple comments) for spelling errors from different kinds of files.

I think, generally, a developer is only writing changes in one language at a time.

Also, there's a limit that I've hit where if there are more than ~10 (?) items to report,
the rest aren't tagged.
I suspect that this would mean each category would get its own 10 😃 .

## See also

Using [[Area dictionaries|Feature: Area dictionaries]] (once they're supported) should make this pretty reasonable.