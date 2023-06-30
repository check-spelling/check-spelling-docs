# `.git-blame-ignore-revs`

One concern people have about taking spelling fixes
(or whitespace cleanup for that matter)
is that blame is shifted
(potentially for large swaths of the codebase)
to a drive-by contributor.

It's actually possible to partially address this with the
introduction of a file.

Consensus for the filename appears to be `.git-blame-ignore-revs`:
* [Rob Allen: Ignoring mass reformatting commits with git blame](https://akrabat.com/ignoring-revisions-with-git-blame/)
* [Moxio: Ignoring bulk change commits with git blame](https://www.moxio.com/blog/43/ignoring-bulk-change-commits-with-git-blame)
* [Used in Chromium](https://chromium.googlesource.com/chromium/src.git/+/f0596779e57f46fccb115a0fd65f0305894e3031/.git-blame-ignore-revs)
* [Request to support in GitHub](https://github.community/t/support-ignore-revs-file-in-githubs-blame-view/3256/12)
* [Request to support in GitLab](https://gitlab.com/gitlab-org/gitlab/-/issues/31423)

This isn't something that a cleanup PR itself should
include, because it's reliant on the final commit-refs
which aren't known until the PR is merged (especially
if a project rebases, but also it'd be painful to
maintain while responding to reviews).

But it shouldn't be particularly hard to write a bot
which given a bunch of GitHub (or GitLab) PRs (or commits)
generated a PR (or just a commit) to update the file.

It seems like a pretty neat small project, which someone
could/should do.

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
