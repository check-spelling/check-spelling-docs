# Sarif output

GitHub has [SARIF support for code scanning](https://docs.github.com/en/code-security/code-scanning/integrating-with-code-scanning/sarif-support-for-code-scanning).

When data is published to GitHub in this format, GitHub is supposed to automatically generate shiny annotations.

## Implementation plan

1. Generate Sarif json
2. Support uploading it using [github/codeql-action/upload-sarif@releases/v2](https://github.com/github/codeql-action/tree/releases/v2/upload-sarif)
3. Decide on how to opt-in/opt-out of using this format
