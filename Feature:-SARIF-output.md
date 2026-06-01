# SARIF output

[Static Analysis Results Interchange Format (SARIF)](https://sarifweb.azurewebsites.net/) is an industry standard enabling tools and development environments to interoperate. 

GitHub has [SARIF support for code scanning](https://docs.github.com/en/code-security/code-scanning/integrating-with-code-scanning/sarif-support-for-code-scanning).

When data is published to GitHub in this format, GitHub is supposed to automatically generate shiny annotations.

Sometimes [`@github-advanced-security`](https://github.com/apps/github-advanced-security) will leave a comment on pull requests:

![1000002788](https://github.com/check-spelling/check-spelling/assets/2119212/530d7cbf-802e-48b6-9e7a-deacaa3ccf1f)

Users of [Visual Studio Code](https://code.visualstudio.com/) can install the [SARIF Viewer](https://marketplace.visualstudio.com/items?itemName=MS-SarifVSCode.sarif-viewer) extension to retrieve the reports. 

## Timeline

Release | Features
-|-
[v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21) | [Initial support](#enabling)
[v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22) | [Adjusting sarif.json](#adjusting-sarifjson)

## Enabling

SARIF support is still very experimental, but the general idea is that you need to give it permissions to write security-events and you need to tell the action to generate them.

Note that you may be able to drop the `comment` job entirely if you enable SARIF. It's still early, hopefully it'll be clear whether this is in fact correct soon.

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
      uses: check-spelling/check-spelling@main
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

## Adjusting `sarif.json`

With [v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22), there's the ability to add a `sarif.json` file to adjust severities or other fields.

This is experimental (as is SARIF support in general).

https://github.com/check-spelling/check-spelling/issues/43

## Results

![Code scanning in PR](https://raw.githubusercontent.com/check-spelling/art/main/output/github-code-scanning-in-pr.png)

![Code scanning list](https://raw.githubusercontent.com/check-spelling/art/main/output/github-code-scanning-list.png)

![Code scanning entry](https://raw.githubusercontent.com/check-spelling/art/main/output/github-code-scanning-alert.png)

## Implementation plan

&#x2611; Generate SARIF json

&#x2611; Support uploading it using [github/codeql-action/upload-sarif@releases/v2](https://github.com/github/codeql-action/tree/releases/v2/upload-sarif)

&#x2611; Decide on how to opt-in/opt-out of using this format -- currently `use_sarif: 1`

&#x2611; Test in the check-spelling org -- in progress

&#x2611; Trial it in other repositories

&#x2610; Iterate


---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
