# Quick Start

## Instructions

1. Clone [[https://github.com/check-spelling/spell-check-this/]]
2. Copy the contents of `.github/` into your repository
3. `git add .github/`
4. `git commit`
5. `git push`

## Notes

This will give you handling for `push`, `pull_request_target`, and example files with a README describing the files and linking to more examples in this wiki.

1. Best-practice for workflows is to use a pinned version.
   There is generally a `prerelease` branch with evolving features,
   but you should not use it unless you need a specific feature from it.
   You can configure GitHub's 
   [dependabot](https://docs.github.com/en/github/administering-a-repository/keeping-your-dependencies-updated-automatically)
   to receive notifications about updates to your workflow(s).

ℹ️ In general, a file `task.ext` can be replaced with a directory `task/`
  containing multiple files ending with `.ext` if you prefer --
  the files will be merged together.
