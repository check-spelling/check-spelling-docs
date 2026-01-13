# Step Summary

GitHub introduced [Job Step Summary](https://github.blog/2022-05-09-supercharging-github-actions-with-job-summaries/) as a way to migrate actions away from using comments. (check-spelling is one of those actions...)

There are a number of benefits (1mb limits for summaries instead of 64k for summaries).

There are some downsides:

- While it's possible to reply to, react to, or resolve/minimize a comment, it isn't possible to do any of these things for a summary.

- The `summary_raw` endpoint may be fairly new (I don't recall seeing it when I was developing this feature).

## Initial implementation

Because I didn't see `summary_raw`, the integration for check-spelling involves uploading an artifact and having the apply code (of which there are a couple of variations) download the artifact and extract the data from it. To an extent, this simplifies the code, but it does mean that the data will be garbage collected at some point (comments are effectively forever).

Roughly, the output is the same as the comment output. Unlike comments, it doesn't enforce the 64k limit. I'm not currently enforcing a 1mb limit, so if you manage to generate >1mb, the summary will fail -- if you run into this, please file a bug, I'd like to think about what to do when this happens instead of just writing something up.

See [Behavior change: Job Summaries](./Behavior-change:-Job-Summaries).

## Possible changes

I _might_ add support for retrieving the data from `summary_raw` instead. But, I don't know that I will.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
