# Run in GitLab

The yaook/meta folks were able to run check-spelling for a while using act w/ their own GitLab runners:

https://gitlab.com/yaook/meta/-/blob/d13a74aaa51be8b2dc6a8801c710efbff683d5a4/.gitlab-ci.yml#L34-48

At some point it broke:

https://gitlab.com/yaook/meta/-/jobs/3267487105

It's unclear why.

I think this was a regression in nektos/act that was fixed in https://github.com/nektos/act/pull/1493

## Alternatives

You should be able to use [Run from command line](./Feature:-Run-from-command-line) -- just ensure that check-spelling is available and the repository to check are available.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
