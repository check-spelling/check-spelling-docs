If a PR has a commit that introduces a spelling mistake, and then a new commit cleans it up, or introduces new misspellings, it'd be nice if the older comment were collapsed as **outdated**.

In v0.0.18, when one asks the bot to apply changes, the changes suggestion and request comments are collapsed, so the collapsing code is ready. It'll just require a bit of GraphQL to ask for the right comments, some filtering, and then calling the collapsing code.
