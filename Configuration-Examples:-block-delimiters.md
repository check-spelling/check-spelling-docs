# `block delimiters` Examples

```block-delimiters.list
# Public Keys
-----BEGIN PUBLIC KEY-----
-----END PUBLIC KEY-----

# RSA Private Key
-----BEGIN RSA PRIVATE KEY-----
-----END RSA PRIVATE KEY-----

# GPG Public Key
-----BEGIN PGP PUBLIC KEY BLOCK-----
-----END PGP PUBLIC KEY BLOCK-----

```

# See also

- [Block Ignore](./Feature:-Block-Ignore.md)

# Notes

- This feature is experimental, and the file format may evolve based on implementation experience.
- `block delimiters` will result in the start/stop line not being checked for (forbidden)patterns or unrecognized words.
- `block delimiters` doesn't support `#` as the first character of a block delimiter -- if you encounter a case where `#` is the first character of a delimiter, please file a ticket with your example.
- The start and stop delimiters are checked for as strings not regular expressions.
- Block delimiter checks happen before pattern evaluation (and are effectively mutually exclusive to them).
- Each block delimiter must have both a start and stop delimiter and there can only be a single stop for a given start delimiter. If you encounter a case where you need to have a choice of possible stop delimiters for a specific start delimiter, please file a ticket with your example.

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
