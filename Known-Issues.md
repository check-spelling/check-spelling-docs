# Known Issues

* [Too many unrecognized word](#Too_many_unrecognized_words)
* [@dependabot can't comment](#dependabot-cant-comment)

## Too many unrecognized words

### Problem

If the generated comment exceeds GitHub's limit, it'll be rejected.

### Cause

Usually this happens when a bunch of binary files are added and are not in `excludes`.

### Indications

* For `push`, `pull_request`, and `pull_request_target`, there will be a :x: indicator, but there will not be a comment.
* The Action Log should include the information.

### Recommendations

* Use `excludes` or `patterns` to suppress some of the content.

## @dependabot can't comment

### Cause

`@dependabot` makes special `push` events without the standard `comment` permission, as it's a really magical account. Normally a third party would have its own private fork, `push` to the fork and create a `pull_request` (+ `pull_request_target`) to the destination repository. But that isn't `@dependabot` is implemented.

### Resolution

See [[@dependabot]]