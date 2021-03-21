# `patterns` Examples

```
# this is a comment

# patch hunk comments
^\@\@ -\d+(?:,\d+|) \+\d+(?:,\d+|) \@\@ .*
# git index header
index [0-9a-z]{7,40}\.\.[0-9a-z]{7,40}

# data urls
"data:[^"]*"
'data:[^']*'
data:[-a-zA-Z=;:/0-9+]*,\S*

# The `\b` here means a break, it's the fancy way to handle urls, but it makes things harder to read
# In this examples content, I'm using a number of different ways to match things to show various approaches
# asciinema
\basciinema\.org/a/[0-9a-zA-Z]+

# AWS
\b[0-9a-z]{10}\.execute-api\.[-0-9a-z]+\.amazonaws\.com\b
\b\w+\.[-0-9a-z]+\.elb\.amazonaws\.com\b

# Here, we're matching `http://` and `https://` by using `s?`
# YouTube
https?://(?:(?:www\.|)youtube\.com|youtu.be)/(?:channel/|embed/|playlist\?list=|watch\?v=|)[-a-zA-Z0-9?&=_]*
<\s*youtube\s+id=['"][-a-zA-Z0-9?_]*['"]
\bimg\.youtube\.com/vi/[-a-zA-Z0-9?&=_]*
# Google Analytics
\bgoogle-analytics\.com/collect.[-0-9a-zA-Z?%=&_.~]*
# Google APIs
\bgoogleapis\.com/[a-z]+/v\d+/[a-z]+/[@./?=\w]+
\b[-a-zA-Z0-9.]*\bstorage\d*\.googleapis\.com(?:/\S*|)
# Google Calendar
\bcalendar\.google\.com/calendar/u/\d+/embed\?src=[@./?=\w]+
\w+\@group\.calendar\.google\.com\b
# Google DataStudio
\bdatastudio\.google\.com/(?:(?:c/|)u/\d+/|)(?:embed/|)(?:open|reporting|datasources|s)/[-0-9a-zA-Z]+(?:/page/[-0-9a-zA-Z]+|)
# The leading `/` here is as opposed to the `\b` above
# ... a short way to match `https://` or `http://` since most urls have one of those prefixes
# Google Docs
/docs\.google\.com/[a-z]+/d/(?:e/|)[0-9a-zA-Z_-]+/?
# Google Groups
https://groups\.google\.com/d/topic/[^/]+/[a-zA-Z0-9]+/discussion
https://groups\.google\.com/d/msg/[^/]+/[a-zA-Z0-9]+/[a-zA-Z0-9]+
# Google themes
themes\.googleusercontent\.com/static/fonts/[^/]+/v\d+/[^.]+.
# Google CDN
\bclients2\.google(?:usercontent|)\.com[-0-9a-zA-Z/.]*
# Goo.gl
/goo\.gl/[a-zA-Z0-9]+
# Google Chrome Store
\bchrome\.google\.com/webstore/detail/\w*(?:/\w*|)

# GitHub SHAs
\bapi.github\.com/repos/[^/]+/[^/]+/[^/]+/[0-9a-f]+\b
(?:\[[0-9a-f]+\]\(https:/|)/github\.com/[^/]+/[^/]+/[^/]+/[0-9a-f]+(?:[-0-9a-zA-Z/#.]*|)\b
\bgithub\.com/[^/]+/[^/]+[@#][0-9a-f]+\b
# githubusercontent
/[-a-z0-9]+\.githubusercontent\.com/[-a-zA-Z0-9?&=_\/.]*
# gist github
/gist\.github\.com/[^/]+/[0-9a-f]+

# binanace
accounts.binance.com/[a-z/]*oauth/authorize\?[-0-9a-zA-Z&%]*

# circleci
https://circleci.com/gh/[^/]+/[^/]+/[^/]+(?:/[^/]+|).[a-z]+\?[-0-9a-zA-Z=&]+

# imgur
\.imgur\.com/[^.]+

# Internet Archive
\barchive\.org/web/\d+/([-\w.?,'/\\+&%$#_:]*)

# discord
/discord(?:app\.com|\.gg)/(?:invite/)?[a-zA-Z0-9]{7,8}

# medium
link\.medium\.com/[a-zA-Z0-9]+

# microsoft
\b(?:download\.visualstudio|docs|msdn)\.microsoft\.com/[-_a-zA-Z0-9()=./]*

# now.sh
/[0-9a-z-.]+\.now\.sh\b

# oracle
\bdocs\.oracle\.com/[-0-9a-zA-Z./_?#&=]*

# chromatic.com
/\S+.chromatic.com\S*[")]

# codacy
\bapi\.codacy\.com/project/badge/Grade/[0-9a-f]+

# mailgun
\.api\.mailgun\.net/v3/domains/[0-9a-z]+\.mailgun.org/messages/[0-9a-zA-Z=@]*
\b[0-9a-z]+.mailgun.org

# requestb.in
\brequestb\.in/[0-9a-z]+

# sched
\b[a-z0-9]+\.sched\.com\b

# Slack
slack://[a-zA-Z0-9?&=]+
\bslack\.com/[-0-9a-zA-Z/_]*

# stackexchange -- https://stackexchange.com/feeds/sites
\b(?:askubuntu|serverfault|stack(?:exchange|overflow)|superuser).com/questions/\d+/[a-z-]+

# Sentry
[0-9a-f]{32}\@o\d+\.ingest\.sentry\.io\b

# ipfs
ipfs://[0-9a-f]*
\bdweb\.link/ipfs/[0-9a-f]*

# w3
\bw3\.org/[-0-9a-zA-Z/#.]+

# URL escaped characters
\%[0-9A-F]{2}
# c99 hex digits (not the full format, just one I've seen)
0x[0-9a-fA-F](?:\.[0-9a-fA-F]*|)[pP]
# sha256
sha256:[0-9a-f]+
# sha-... -- uses a fancy capture
(['"]|&quot;)[0-9a-f]{40,}\g{-1}
# hex in url queries
=[0-9a-fA-F]+&
# PGP
\b(?:[0-9A-F]{4} ){9}[0-9A-F]{4}\b
# hex digits including css/html color classes:
(?:[\\0][xX]|\\u|[uU]\+|#x?|\%23)[0-9a-fA-FgGrR_]{2,}(?:[uU]?[lL]{0,2}|u\d+)\b
# uuid:
[<({"'>][0-9a-fA-F]{8}-(?:[0-9a-fA-F]{4}-){3}[0-9a-fA-F]{12}[<'"})>]
# the negative lookahead here is to allow catching 'templatesz' as a misspelling
# but to otherwise recognize a Windows path with \templates\foo.template or similar:
\\templates(?![a-z])
# ignore long runs of a single character:
\b([A-Za-z])\g{-1}{3,}\b
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
\b(?:\\n|)curl(?:\s+-[a-zA-Z]+)+
# tar arguments
\b(?:\\n|)tar(?:\s+-[a-zA-Z]+|\s[a-z]+)+
# macOS temp folders
/var/folders/\w\w/\w+/T/
```
