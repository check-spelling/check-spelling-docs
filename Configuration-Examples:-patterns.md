# `patterns` Examples

```
# patch hunk comments
^\@\@ -\d+(?:,\d+|) \+\d+(?:,\d+|) \@\@ .*
# git index header
index [0-9a-z]{12}\.\.[0-9a-z]{12}
# this is a comment
# YouTube
https?://(?:(?:www\.|)youtube\.com|youtu.be)/(?:channel/|embed/|)[-a-zA-Z0-9?&=_]*
# data urls
data:[a-zA-Z=;,/0-9+-]+
# Google Docs
/docs\.google\.com/[a-z]+/d/(?:e/|)[0-9a-zA-Z_-]+/
# Google Groups
https://groups\.google\.com/d/topic/[^/]+/[a-zA-Z0-9]+/discussion
# Goo.gl
/goo\.gl/[a-zA-Z0-9]+
# GitHub SHAs
/github\.com/[^/]+/[^/]+/[^/]+/[0-9a-f]+\b
# githubusercontent
/[a-z-]+\.githubusercontent\.com/[-a-zA-Z0-9?&=_\/.]*
# gist github
/gist\.github\.com/[^/]+/[0-9a-f]+
# imgur
\.imgur\.com/[^.]+
# discord
/discord(?:app\.com|\.gg)/(?:invite/)?[a-zA-Z0-9]{7,8}
# now.sh
/[0-9a-z-.]+\.now\.sh\b
# chromatic.com
/\S+.chromatic.com\S*[")]
# URL escaped characters
\%[0-9A-F]{2}
# c99 hex digits (not the full format, just one I've seen)
0x[0-9a-fA-F](?:\.[0-9a-fA-F]*|)[pP]
# sha-1
"[0-9a-f]{40}"
# hex in url queries
=[0-9a-fA-F]+&
# hex digits including css/html color classes:
(?:[\\0][xX]|\\u|[uU]\+|#|\%23)[0-9a-fA-FgGrR]{2,}[uU]?[lL]{0,2}\b
# uuid:
[{"'][0-9a-fA-F]{8}-(?:[0-9a-fA-F]{4}-){3}[0-9a-fA-F]{12}['"}]
# the negative lookahead here is to allow catching 'templatesz' as a misspelling
# but to otherwise recognize a Windows path with \templates\foo.template or similar:
\\templates(?![a-z])
# ignore long runs of a single character:
\b([A-Za-z])\1{3,}\b
# Note that the next example is no longer necessary if you are using
# to match a string starting with a `#`, use a character-class:
[#]backwards
# marker to ignore all code on line
^.*/\* #no-spell-check-line \*/.*$
# marker for ignoring a comment to the end of the line
// #no-spell-check.*$
# <word>v1
v1(?:\b|(?=[a-z]))
# curl arguments
\b(?:)curl(?:\s+-[a-zA-Z]+)+
# tar arguments
\b(?:)tar(?:\s+-[a-zA-Z]+|\s[a-z]+)+
```
