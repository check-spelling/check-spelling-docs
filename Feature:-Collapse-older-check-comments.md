If a PR has a commit that introduces a spelling mistake, and then a new commit cleans it up, or introduces new misspellings, it'd be nice if the older comment were collapsed as **outdated**.

In v0.0.18, when one asks the bot to apply changes, the changes suggestion and request comments are collapsed, so the collapsing code is ready.

The naive implementation is to use a bit of GraphQL to ask for the right comments and some filtering to find the comment node.

There's a simpler approach to this instead which is to use the cache action to store the comment node.

With the comment node, it's trivial to call the collapsing code.

This will be available in 0.0.20.

