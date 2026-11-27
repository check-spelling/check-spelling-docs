# Forbidden patterns

Included in [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20)

Since the spell checker has to run against all lines, there was a request to be able to reject a pattern, even though it is technically composed of valid words.

The canonical example was [`m_data`](https://github.com/nasa/fprime/discussions/855#discussion-3469739) which is apparently a macro in [VxWorks](https://www.windriver.com/products/vxworks) that at least [nasa/fprime](https://github.com/nasa/fprime/pull/797) and [Qt](https://github.com/qtproject/qt-solutions/blame/fb7bc42bfcc578ff3fa3b9ca21a41e96eb37c1c7/qtscriptclassic/src/qscriptbuffer_p.h#L46) tripped over.

But there are definitely other examples, e.g., of a deprecated API.

Originally drafted as [Reject specific patterns](./Feature:-Reject-patterns).


## Implementation

I can imagine adding an extra pass right before (or after? still thinking about this) `patterns.txt` which looks for `reject-patterns.txt`
/ `forbidden.txt` that works like `patterns.txt`, but is run between patterns and the main spelling pass and screams if it finds matches.

## Implementation details

Items in forbidden wouldn't blank things, they'd just flag separately and possibly report the specific pattern/line number that objected.

### Caveats

To date, the check-spelling has not really cared which file contributed a piece of input, it just merges everything together. Remembering sources adds overhead. I'm not sure how important this would be here.

## Sample consumers

### `m_data`

Add as `\bm_data\b`

### `Javascript`

- When you add `javascript` to `expect.txt`, it will start accepting `Javascript` even though it should be `JavaScript`

Add as `\bJavascript\b`

### `MicroSoft`

Both `micro` and `soft` are in the dictionary, so this will not naturally be flagged, even though it is probably problematic.

Add as `\bMicroSoft\b`

### Duplicate words

```
# Reject duplicate words
\b(\w{3,})\s\g{-1}\b
```

### Homophones and case botches

See [Highlight homophones and case botches](./Feature:-Highlight-homophones-and-case-botches)

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
