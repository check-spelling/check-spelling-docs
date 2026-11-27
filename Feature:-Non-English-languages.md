# Non-English languages

The spell checker is really only aware of ~26 letters and some variations of `'`.

The default dictionary is English.

In theory it could also spell check (classical) Latin, Rotokas, Interlingua, and Ido, but currently that's about it.

For everything else, if it works on something, it's probably just the English programming language/markup, and if you're lucky it's ignoring everything else.

At some point in the distant future, I can try to figure out how to refactor things to deal w/ character sets and things (I suspect I'll require all content to be in Unicode, since I really don't want to have to deal with encodings, and Unicode still gives me enough headaches with UTF-8/UTF-16/UCS-2/UTF-32/UCS-4, endianness, and normalization).

- See [Feature: Character Encoding Auto Detection](./Feature:-Character-Encoding-Auto-Detection) for some thoughts.

The simplification makes the code much easier to work with and lets me work on things a piece at a time. Any character roughly not in that set is effectively equivalent to a ` ` by the time the spell checker starts looking for words.

## Ignoring non-ascii words

The `patterns.txt` file can strip out your non-ascii words if you like.

I think the following (untested) `patterns.txt` entry should work:

```js
# skip any word that has at least one non-ascii character (the spell checker would split on those characters)
\S*(?:[^[:ascii:]]+\S*)+
```

I'd love to hear if it does. Note that it will prevent the auto-detection in 0.0.18-alpha from working, but that's not a big deal.

If it does, I'll probably add it to sample patterns, and add it commented out to spell-check-this. -- It conflicts w/ [auto-detecting files to skip](./Feature:-Autodetect-noisy-files), so I wouldn't want it on by default.

## Unicode

From cmouse:

```perl
use 5.022;
use feature 'unicode_strings';
use strict;
use warnings;
use Encode qw/decode_utf8 FB_DEFAULT/;
binmode STDIN;
binmode STDOUT, ':utf8';

while (<<>>) {
  $_ = decode_utf8($_, FB_DEFAULT);
  s/[^[:word:][:space:]]+/ /g;
  print;
}
```

For normal files, that's:

```perl
...
open FILE, '<', $filename;
binmode FILE;
while (<>) {
  $_ = decode_utf8($_, FB_DEFAULT);
...
}
```

### See also

- [Character Encoding Auto Detection](./Feature:-Character-Encoding-Auto-Detection)
- [Configurable word characters](./Feature:-Configurable-word-characters)

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
