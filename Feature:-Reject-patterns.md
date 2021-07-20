# Reject specific patterns

Since the spell checker has to run against all lines, there was a request to be able to reject a pattern, even though it is technically composed of valid words.

The canonical example was [m_data](https://github.com/nasa/fprime/discussions/855#discussion-3469739).

But there are definitely other examples, e.g., of a deprecated API.

## Implementation

I can imagine adding an extra pass right before `patterns.txt` which looks for `reject-patterns.txt` items and screams if it finds them.