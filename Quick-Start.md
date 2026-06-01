# Quick Start

## Instructions

1. Clone the [https://github.com/check-spelling/spell-check-this/](https://github.com/check-spelling/spell-check-this/) template repository
2. Copy the contents of `.github/` into your repository
3. `git add .github/`
4. `git commit`
5. `git push`

## Notes

This will give you handling for `push`, `pull_request_target`, and example files with a `README.md` describing the files and linking to more examples in this wiki.

- If you have existing forks, you should see [Onboarding](Onboarding) for information about tweaks you can make to the workflow in order to improve the experience for PRs from those existing forks.

- Best-practice for workflows is to use a pinned version.

- There is generally a `prerelease` branch with evolving features,
  but you should not use it unless you need a specific feature from it.

- You can configure GitHub's
  [dependabot](https://docs.github.com/en/github/administering-a-repository/keeping-your-dependencies-updated-automatically)
  to receive notifications about updates to your workflow(s).

ℹ️ In general, a file `task.ext` can be replaced with a directory `task/`
containing multiple files ending with `.ext` if you prefer --
the files will be merged together.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
