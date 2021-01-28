# `patterns` Examples

```
# patch hunk comments
^\@\@ -\d+(?:,\d+|) \+\d+(?:,\d+|) \@\@ .*
# git index header
index [0-9a-z]{7,12}\.\.[0-9a-z]{7,12}
# this is a comment
# AWS
\b[0-9a-z]{10}\.execute-api\.[-0-9a-z]+\.amazonaws\.com\b
# YouTube
https?://(?:(?:www\.|)youtube\.com|youtu.be)/(?:channel/|embed/|playlist\?list=|watch\?v=)[-a-zA-Z0-9?&=_]*
<\s*youtube\s+id=['"][-a-zA-Z0-9?_]*['"]
# data urls
data:[a-zA-Z=;,/0-9+-]+
# Google Analytics
\bgoogle-analytics\.com/collect.[-0-9a-zA-Z?%=&_.~]*
# Google APIs
\bgoogleapis\.com/[a-z]+/v\d+/[a-z]+/[@./?=\w]+
# Google Calendar
\bcalendar\.google\.com/calendar/u/\d+/embed\?src=[@./?=\w]+
\w+\@group\.calendar\.google\.com\b
# Google DataStudio
\bdatastudio\.google\.com/(?:(?:c/|)u/\d+/|)(?:embed/|)(?:open|reporting|datasources|s)/[-0-9a-zA-Z]+(?:/page/[-0-9a-zA-Z]+|)
# Google Docs
/docs\.google\.com/[a-z]+/d/(?:e/|)[0-9a-zA-Z_-]+/
# Google Groups
https://groups\.google\.com/d/topic/[^/]+/[a-zA-Z0-9]+/discussion
https://groups\.google\.com/d/msg/[^/]+/[a-zA-Z0-9]+/[a-zA-Z0-9]+
# Google themes
themes\.googleusercontent\.com/static/fonts/[^/]+/v\d+/[^.]+.
# Goo.gl
/goo\.gl/[a-zA-Z0-9]+
# GitHub SHAs
(?:\[[0-9a-f]+\]\(https:/|)/github\.com/[^/]+/[^/]+/[^/]+/[0-9a-f]+\b
\bgithub\.com/[^/]+/[^/]+[@#][0-9a-f]+\b
# githubusercontent
/[a-z-]+\.githubusercontent\.com/[-a-zA-Z0-9?&=_\/.]*
# gist github
/gist\.github\.com/[^/]+/[0-9a-f]+
# imgur
\.imgur\.com/[^.]+
# Internet Archive
\barchive\.org/web/\d+/([-\w.?,'/\\+&%$#_:]*)
# discord
/discord(?:app\.com|\.gg)/(?:invite/)?[a-zA-Z0-9]{7,8}
# medium
link\.medium\.com/[a-zA-Z0-9]+
# msdn
msdn\.microsoft\.com/[^/]+/library/\S*\.aspx
# now.sh
/[0-9a-z-.]+\.now\.sh\b
# chromatic.com
/\S+.chromatic.com\S*[")]
# codacy
\bapi\.codacy\.com/project/badge/Grade/[0-9a-f]+
# sched
\b[a-z0-9]+\.sched\.com\b
# Slack
slack://[a-zA-Z0-9?&=]+
\bslack\.com/[-0-9a-zA-Z/_]*
# stackexchange -- https://stackexchange.com/feeds/sites
\b(?:askubuntu|serverfault|stack(?:exchange|overflow)|superuser).com/questions/\d+/[a-z-]+
# Sentry
[0-9a-f]{32}\@o\d+\.ingest\.sentry\.io\b

# URL escaped characters
\%[0-9A-F]{2}
# c99 hex digits (not the full format, just one I've seen)
0x[0-9a-fA-F](?:\.[0-9a-fA-F]*|)[pP]
# sha256
sha256:[0-9a-f]+
# sha-1
"[0-9a-fA-F]{40}"
# hex in url queries
=[0-9a-fA-F]+&
# hex digits including css/html color classes:
(?:[\\0][xX]|\\u|[uU]\+|#x?|\%23)[0-9a-fA-FgGrR_]{2,}(?:[uU]?[lL]{0,2}|u\d+)\b
# uuid:
[<({"'][0-9a-fA-F]{8}-(?:[0-9a-fA-F]{4}-){3}[0-9a-fA-F]{12}['"})>]
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
# <word>v#
[Vv]\d+(?:\b|(?=[a-zA-Z_]))
# curl arguments
\b(?:)curl(?:\s+-[a-zA-Z]+)+
# tar arguments
\b(?:)tar(?:\s+-[a-zA-Z]+|\s[a-z]+)+
```
