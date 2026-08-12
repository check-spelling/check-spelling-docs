# Content Mappings

Currently there are a couple of [hard-coded](#hard-coded) aliases in the word splitter.

There are a couple of others that probably [should be offered](#future), and it'd be better if this were something that users could configure instead of requiring a new release each time.

## Proposal

Something like a `mappings.json`, which would probably be json-c (json with comments, possibly tolerating a trailing comma...):

```json
{
  "&(?:apos|#39|#x27|%27);|'{2,}": "'",
  "&(?:quot|#34|#x22|%22);": "\"",
  "\\(aq": "'"
}
```

## hard-coded

### Right Single Quotation Mark

This happened enough that it was worth supporting before I wrote a proper module for it.

Right Single Quotation Mark (`’`)

```pl
   # https://www.fileformat.info/info/unicode/char/2019/
   my $rsqm = "\xE2\x80\x99";
   s/$rsqm/'/g;
```

#### html entity encoded single quote

apostrophe (`'`)

```pl
  s/\&(?:apos|#39|#x27);/'/g;
```

## Future

### Ligatures

* ﬃ -> ffi
* ﬀ -> ff

### HTML Entities

It might make sense to just teach the tool to convert all HTML entities into their pretty forms...

The main ones that I'm considering are:

#### html entity encoded double quotes

quotation mark (`"`)

```pl
  s/\&(?:quot|#34|#x22);/"/g;
```

### troff

apostrophe (`'`)

```pl
  s/\\(aq/'/g
```

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
