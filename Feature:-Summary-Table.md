# Summary Table

Include a section in the [Step Summary](./Feature:-Step-Summary.md) with links to individual lines for report items similar to the links that would be available from [SARIF output](./Feature:-SARIF-output.md).

## Background

The [SARIF output](./Feature:-SARIF-output.md) feature generally only works for repository members, so, while it's quite fancy, it's problematic for open source repositories.

## Implementation

Where possible, each [Event category](Event-descriptions.md) reported by check-spelling will be given its own expandable section with a table containing a row per entry with a link to the relevant line.

## Considerations

Each object that GitHub supports has some sort of size limitation, in order to avoid failing, anything that generates data needs to keep these limits in mind....

Output | Limit
-|-
Commit comment | 64 kb
PR comment | 64 kb
Step Summary | 1 mb
Sarif output | 5000 entries
Artifacts | ?

When check-spelling creates comments, it has an algorithm for trimming sections to avoid running afoul of the 64 kb limit. The Step Summary feature has some basic code to avoid tripping on the 1 mb limit. In testing, that limit has been hit.

In order to avoid losing the entire Step Summary when this feature is enabled, sections will be omitted if they would push the report over the size limit.

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
