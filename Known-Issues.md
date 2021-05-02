# Known Issues

* [Too many unrecognized word](#Too_many_unrecognized_words)

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
