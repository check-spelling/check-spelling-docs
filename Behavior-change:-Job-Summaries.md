# Job Summaries

Job Summaries are an alternative to comments

## Comments (...v0.0.20)

- Currently, check-spelling writes its reports using comments which have a 64k size limit. Some repositories hit this limit (although typically only during the initial onboarding).
- Creating a comment requires write permissions to either PRs to repositories (which is a security concern).
- People rightfully complain about check-spelling polluting PR discussions. The latest version of check-spelling will automatically collapse these reports which should partially alleviate this.
- Because of the size issues, and security concerns, a second stage is necessary, and an artifact is used to pass data between stages.
- Comments don't inherently know their own url, but when one creates one, the result includes the url, and one can rewrite the comment to embed the url.
- Artifact urls aren't known until after a workflow completes, which is a real problem, but the download-artifact feature is able to find them anyway...

## Job Summaries ([v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21)+)

- Job Summaries can be considerably larger (1mb?).
- Job Summaries don't require write permissions.
- Job Summaries are tied to the ✅ / ❌ / Details link for a Job and thus mostly disappear when they cease to be current.
- Job Summaries wouldn't need artifacts since all the data could be included in the summary itself.
- It's unclear how to determine the url of a Job Summary, and it's unlikely that one could rewrite a Job Summary later.

## Timeline

I haven't figured out how to integrate this feature into my workflow.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
