# Configuration: Multiple programming languages

## Background

Projects often contain code written in multiple programming languages
or even documentation written in multiple human languages.

The simplest approach is to just run the spell-checker over the whole system
and add items to the dictionary/exceptions regardless of their origin.

It might be the case that one actually has differing word choice rules
depending on the language.

It is possible to enforce this today using a single workflow file.

One can also use this when spell checking takes too long (in general, anything over 15 minutes is probably too long).

## Working approach

(as of 0.0.19)

To define multiple sets, one can:

`.github/workflows/spelling.yml`:

```yml
name: Spell checking
on:
  pull_request_target:
  push:

jobs:
  spelling:
    runs-on: ubuntu-latest
    strategy:
      fail-fast: false
      matrix:
        category: ["java", "python", "other"]
    name: Spell checking (${% raw %}{{{% endraw %}matrix.category}})
    steps:
    - name: checkout-merge
      if: "contains(github.event_name, 'pull_request')"
      uses: actions/checkout@v2
      with:
        ref: refs/pull/${% raw %}{{{% endraw %}github.event.pull_request.number}}/merge
    - name: checkout
      if: "!contains(github.event_name, 'pull_request')"
      uses: actions/checkout@v2
    - uses: check-spelling/check-spelling@prerelease
      id: spelling
      with:
        config: .github/actions/spelling-${% raw %}{{{% endraw %}matrix.category}}
        report_title_suffix: ${% raw %}{{{% endraw %}matrix.category}}
```

- `.github/actions/spelling`:
  - `advice.txt`:
    You can include advice explaining how to update things and
    when to put items here instead of into the specific directories.
  - `allow.txt`:
    _Your global dictionary supplements_
  - `reject.txt`:
    _Your global dictionary removals_
  - `excludes.txt`
    _Your global excludes_
  - `patterns.txt`:
    _Your global patterns_
  - ⚠️ You probably do not want to include `expect` in `spelling/`.
- `.github/actions/spelling-python/`:
  - `advice.txt`:
    _symlink_ to `../spelling/advice.txt`
  - `allow/`:
    - `allow.txt`:
      _symlink_ to `../../spelling/allow.txt`
    - `python.txt`:
      _Python dictionary supplements_ (note: you could use `extra_dictionaries: cspell:python/python.txt` instead)
  - `excludes/`:
    - `excludes.txt`:
      _symlink_ to `../../spelling/excludes.txt`
    - `python.txt`:
      _Rules to exclude non python files_
  - `only.txt`:
    ```text
    \.py$
    ```
  - `expect/`:
    - `expect.txt`:
      _Python expect_
- `.github/actions/spelling-java/`:
  - `advice.txt`:
    _symlink_ to `../spelling/advice.txt`
  - `dictionary/`:
    - `allow.txt`:
      _symlink_ to `../../spelling/allow.txt`
    - `java.txt`:
      _Java dictionary_ (note: you could use `extra_dictionaries: cspell:java/java.txt` instead)
  - `excludes/`:
    - `excludes.txt`:
      _symlink_ to `../../spelling/excludes.txt`
    - `java.txt`:
      _Rules to exclude non java files_
  - `only.txt`:
    ```text
    \.java$
    ```
  - `expect/`:
    - `expect.txt`:
      _Java expect_

## Downsides

You will get distinct reports
(i.e. potentially multiple comments) for spelling errors from different kinds of files.

I think, generally, a developer is only writing changes in one language at a time.

Also, there's a limit that I've hit where if there are more than ~10 (?) items to report,
the rest aren't tagged.
I suspect that this would mean each category would get its own 10 😃 .

## See also

Using [Area dictionaries](./Feature:-Area-dictionaries) should make this pretty reasonable (you could specify distinct area dictionaries using the matrix, but, you the cost for the extra dictionaries is minimal, so I'd just include all of them unconditionally).

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
