# Sarif output

GitHub has [SARIF support for code scanning](https://docs.github.com/en/code-security/code-scanning/integrating-with-code-scanning/sarif-support-for-code-scanning).

When data is published to GitHub in this format, GitHub is supposed to automatically generate shiny annotations.

## Enabling

Sarif support is still very experimental, but the general idea is that you need to give it permissions to write security-events and you need to tell the action to generate them.

Note that you may be able to drop the `comment` job entirely if you enable sarif. It's still early, hopefully it'll be clear whether this is in fact correct soon.

```workflow
jobs:
  spelling:
    permissions:
      # ...
      security-events: write
    # ...
    steps:
    - name: check-spelling
      id: spelling
      # hopefully sarif will be available in v0.0.21
      uses: check-spelling/check-spelling@preprelease
      with:
        # ...
        use_sarif: 1
```

## Implementation plan

- [x] Generate Sarif json
- [x] Support uploading it using [github/codeql-action/upload-sarif@releases/v2](https://github.com/github/codeql-action/tree/releases/v2/upload-sarif)
- [x] Decide on how to opt-in/opt-out of using this format -- currently `use_sarif: 1`
- [ ] Test in the check-spelling org -- in progress
- [ ] Select one or two repositories to trial this feature -- one candidate has volunteered

