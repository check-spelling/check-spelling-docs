# Aliases

Currently there are a couple of hard-coded aliases in the word splitter.

There are a couple of others that probably should be offered, and it'd be better if this were something that users could configure instead of requiring a new release each time.

## Right Single Quotation Mark

Right Single Quotation Mark (`’`)

```pl
   # https://www.fileformat.info/info/unicode/char/2019/
   my $rsqm = "\xE2\x80\x99";
   s/$rsqm/'/g;
```

## HTML Entities

It might make sense to just teach the tool to convert all HTML entities into their pretty forms...

The main ones that I'm considering are:

### html entity encoded single and double quotes

apostrophe (`'`)
```pl
  s/\&(?:apos|#39|#x27);/'/g;
```

quotation mark (`"`)
```pl
  s/\&(?:quot|#34|#x22);/"/g;
```
