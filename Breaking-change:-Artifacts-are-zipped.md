# Breaking change: Artifacts are zipped

Included in [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20)

## Background

Prior to [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20), check-spelling produced a number of (generally) tiny files which it used to produce a comment in a secondary pass.

Occasionally [actions/upload-artifact](https://github.com/actions/upload-artifact) / [actions/download-artifact](https://github.com/actions/download-artifact) would hit some error on some of the files and trigger a backoff that would take a while to resolve.

## Solution

Instead of trying to upload a half dozen or so tiny files, check-spelling will now zip the files proactively before uploading, and unzip them after.

## Hazards

- If someone upgrades the check job to a version that does this, but doesn't upgrade the comment job to a version that supports this, the generated artifacts will not work.
- If a workflow has custom code relying on the files from artifact, it will need to be adjusted. -- I doubt anyone is doing this.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
