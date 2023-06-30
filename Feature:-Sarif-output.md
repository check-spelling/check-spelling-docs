# SARIF output

GitHub has [SARIF support for code scanning](https://docs.github.com/en/code-security/code-scanning/integrating-with-code-scanning/sarif-support-for-code-scanning).

When data is published to GitHub in this format, GitHub is supposed to automatically generate shiny annotations.

## Timeline

Release | Features
-|-
[v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21) | [Initial support](#enabling)
[prerelease](https://github.com/check-spelling/check-spelling/commits/prerelease) | [Adjusting sarif.json](#adjusting-sarifjson)

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
      uses: check-spelling/check-spelling@v0.0.21
      with:
        # ...
        use_sarif: 1
```

## Visibility

In general:

> Security alerts for a repository are visible to people with write, maintain, or admin access to the repository

See [Granting access to security alerts](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-security-and-analysis-settings-for-your-repository#granting-access-to-security-alerts) for more information.

This means that if you're a contributor without write access to a repository, you probably won't be able to click the [👼 SARIF report?](#) link.

If you'd like to see a similar report, you should be able to create a pull request in your fork and trigger the same workflow and view the equivalent report there.

## Adjusting sarif.json

After v0.0.21 (available in prerelease), there's the ability to add a `sarif.json` file to adjust severities or other fields.

This is experimental (as is SARIF support in general).

https://github.com/check-spelling/check-spelling/issues/43

## Implementation plan

&#x2611; Generate Sarif json

&#x2611; Support uploading it using [github/codeql-action/upload-sarif@releases/v2](https://github.com/github/codeql-action/tree/releases/v2/upload-sarif)

&#x2611; Decide on how to opt-in/opt-out of using this format -- currently `use_sarif: 1`

&#x2611; Test in the check-spelling org -- in progress

&#x2611; Trial it in other repositories

&#x2610; Iterate


---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
