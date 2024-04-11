# Report associated comment for forbidden patterns

Currently, forbidden patterns just report the line / match with a forbidden pattern and there's an expectation that users will either be able to figure out the problem by looking at the line, or they'll open up the forbidden patterns file and see a comment/blame reference explaining why the pattern is present.

## Related features

For [Feature: Suggest patterns](./Feature:-Suggest-patterns.md) (which was implemented after [Feature: Forbidden patterns](./Feature:-Forbidden-patterns.md)), if there's a comment preceding a pattern, the output includes the comment.

## Proposal

It seems like it'd be valuable to try to offer the same sort of output for forbidden patterns instead of forcing users to open the file.

Note that the features aren't quite the same in that pattern suggestions are lumped together in a single blob in a report, whereas, in general, forbidden patterns are reported on a per-file-per-line bases and _generally_ only support a single line of output.

I think that I'll implement this by adding a section to the report containing each of the tripped forbidden patterns and their comments.

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
