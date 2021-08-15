# Forbidden patterns

People have asked about being able to reject certain patterns. They aren't technically spelling errors, but since check-spelling is already looking.

## Proposal

`forbidden.txt` that works like `patterns.txt`, but is run between patterns and the main spelling pass.

## Implementation details

Items in forbidden wouldn't blank things, they'd just flag separately and possibly report the specific pattern/line number that objected.

### Caveats

To date, the check-spelling has not really cared which file contributed a piece of input, it just merges everything together. Remembering sources adds overhead. I'm not sure how important this would be here.

## Sample consumers

### `Javascript`

- When you add `javascript` to `expect.txt`, it will start accepting `Javascript` even though it should be `JavaScript`

Add as `\bJavascript\b`

### MicroSoft

Both `micro` and `soft` are in the dictionary, so this will not naturally be flagged, even though it is probably problematic.

Add as `\bMicroSoft\b`