# Onboarding

The easiest way to get started is by following the [Quick Start](Quick-Start) instructions.

If you do this before people create forks of your repository, things should go fairly smoothly.

As of v0.0.21 (but hopefully not the next release), if a user creates a branch from before check-spelling is added,
but creates a PR to the repository with check-spelling as configured by [spell-check-this in `.github/workflows/spelling.yml`](https://raw.githubusercontent.com/check-spelling/spell-check-this/6b83ae39834cdf4e64ffff2b8693afe0536c5823/.github/workflows/spelling.yml),
check-spelling will run but not find its configuration.
Because it won't find its configuration, it will almost certainly get somewhat upset with users and
lead them to be at least a little bit confused.

## Workarounds

### v0.0.21

There's a workaround included in [check-spelling/spell-check-this@prerelease's `.github/actions/spelling/advice.md` file](https://github.com/check-spelling/spell-check-this/blob/5bb7de8b0383d9ee98622264bd3c5cf04eb3af6e/.github/actions/spelling/advice.md?plain=1#L28-L29).

Happily, the `spell_check_this` field which is used for when check-spelling doesn't have configuration can be used to cover this case.

Instead of having that field point to `check-spelling/spell-check-this@prerelease`,
it can be changed to point to your own repository's primary branch (one where you're adding check-spelling).

Thus, if your repository is `octocat/Spoon-Knife` and you're adding check-spelling to the `main` branch, you could point to `octocat/Spoon-Knife@main`:

```yaml
  uses: check-spelling/check-spelling@v0.0.21 
  with:
    # ...
    spell_check_this: octocat/Spoon-Knife@main
```

The active assumption here is that any PRs to branches that are created after check-spelling is added to `octocat/Spoon-Knife@main` will be created based on commits that already include check-spelling, and thus the `spell_check_this` codepath won't be used.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
