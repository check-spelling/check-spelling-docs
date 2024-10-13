# Heuristic exclude suggestions

I've also been thinking about having the system do heuristics, if there are proportionally many items for a given file, it's probably worth suggesting to `exclude` the file.

Roughly implementation compares the number of unique dictionary words in a file with the number of unique non dictionary words in the file. If there are more non dictionary words, the file will be skipped.

This is implemented in `0.0.18`. _prerelease_

To get a file to be checked, one will need to:

- add words to the dictionary (`allow.txt`)
- reduce the number of non dictionary by masking patterns (`patterns.txt`)
- reduce the number of non dictionary words (by fixing typos)

## Simple exclusion suggestions

I think initially if the number of files is large, I'll suggest that users look for entire directories to exclude, file names to exclude, or file extensions to exclude. (Pure static text)

## Advanced exclusion suggestions

The heuristics can also try to suggest ignoring common directories, common file names, or file extensions.

Note to self:
Currently the list of checked files [isn't persisted](https://github.com/check-spelling/check-spelling/blob/b07c0693e379e95c8d091519066bb2cec15e00d7/unknown-words.sh#L525-L526)

imagine it's in a file called `$checked_files`
the list of files to consider excluding is `$should_exclude_file`

### Availability

In [v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22), output could look like this:
https://github.com/check-spelling/spamassassin/commit/ce13394f9b5a421b6b3949b7a5b480f6fe9fe84e#commitcomment-124692605

<details><summary>Some files were automatically ignored :see_no_evil:</summary>

These sample patterns would exclude them:

```
(?:^|/)base64\.txt$
(?:^|/)bs\.lm$
(?:^|/)cy\.lm$
(?:^|/)et\.lm$
(?:^|/)eu\.lm$
(?:^|/)fi\.lm$
(?:^|/)ga\.lm$
(?:^|/)gd\.lm$
(?:^|/)hr\.us-ascii\.lm$
(?:^|/)hu\.lm$
(?:^|/)hy\.lm$
(?:^|/)is\.lm$
(?:^|/)lt\.lm$
(?:^|/)lv\.lm$
(?:^|/)mr\.lm$
(?:^|/)ne\.lm$
(?:^|/)nl\.lm$
(?:^|/)pl\.lm$
(?:^|/)qu\.lm$
(?:^|/)README\.Debian$
(?:^|/)sa\.lm$
(?:^|/)sk\.us-ascii\.lm$
(?:^|/)sk\.windows-1250\.lm$
(?:^|/)sl\.iso-8859-2\.lm$
(?:^|/)sl\.us-ascii\.lm$
(?:^|/)sq\.lm$
(?:^|/)sr\.us-ascii\.lm$
(?:^|/)sw\.lm$
(?:^|/)user_prefs$
(?:^|/)vi\.lm$
(?:|$^ 87.50% - excluded 7/8)^t/data/spam/olevbmacro/
(?:|$^ 96.00% - excluded 96/100)^textcat/
/data/nice/dmarc/[^/]+$
[^/]\.dat$
[^/]\.ln$
[^/]\.log$
[^/]\.mmdb$
^\Qbuild/pga/source/f2c.c\E$
^\Qdebian/GPG.KEY\E$
^\Qdebian/spamc.manpages\E$
^\Qdebian/spamc.substvars\E$
^\Qlm/inactive/br.lm\E$
^\Qlm/inactive/gv.lm\E$
^\Qlm/inactive/mingo.lm\E$
^\Qrules-extras/10_uridnsbl_skip_financial.cf\E$
^\Qrules/20_freemail_domains.cf\E$
^\Qrules/30_text_de.cf\E$
^\Qrules/30_text_pl.cf\E$
^\Qrules/60_bayes_stopwords.cf\E$
^\Qrules/60_welcomelist_auth.cf\E$
^\Qrules/sa-update-pubkey.txt\E$
^\Qrulesrc/sandbox/jhardin/40_local_419replyto.cf\E$
^\Qrulesrc/sandbox/jhardin/40_local_azurephish.cf\E$
^\Qrulesrc/sandbox/jhardin/40_local_googlestorage.cf\E$
^\Qrulesrc/sandbox/pds/20_cashshorteners.cf\E$
^\Qrulesrc/sandbox/smf/20_url_shorteners.cf\E$
^\Qrulesrc/sandbox/wtogami/20_misc.cf\E$
^\Qrulesrc/sandbox/wtogami/20_unsafe.cf\E$
^\Qspamc/Makefile.in\E$
^\Qt.rules/BOUNCE_MESSAGE/fp-bug5882-att4301\E$
^\Qt.rules/FRT_VALIUM1/fp-bug6086-zmi\E$
^\Qt.rules/MIME_BASE64_TEXT/fp-bug-5909\E$
^\Qt/data/dkim/arc/ok01.eml\E$
^\Qt/data/dkim/test-pass-06.msg\E$
^\Qt/data/dkim/test-pass-09.msg\E$
^\Qt/data/dkim/test-pass-10.msg\E$
^\Qt/data/dkim/test-pass-11.msg\E$
^\Qt/data/dkim/test-pass-12.msg\E$
^\Qt/data/dkim/test-pass-13.msg\E$
^\Qt/data/dkim/test-pass-14.msg\E$
^\Qt/data/dkim/test-pass-15.msg\E$
^\Qt/data/dkim/test-pass-16.msg\E$
^\Qt/data/etc/testhost.cert\E$
^\Qt/data/geodb/create_ipcc.sh\E$
^\Qt/data/geodb/ipcc.db\E$
^\Qt/data/mime-subject.txt\E$
^\Qt/data/nice/cjk/big5-base64.1\E$
^\Qt/data/spam/dmarc/strictrejectko.eml\E$
^\Qt/data/spam/extracttext/gtube_pdf.eml\E$
^\Qt/data/spam/extracttext/gtube_png.eml\E$
^\Qt/data/spamc_blank.cf\E$
^\Qt/rcvd_parser.t\E$
^debian/files$
^debian/spamc/
^masses/corpora/mass-find-nonspam$
^rules/languages$
^rulesrc/scores/stats-set2$
^rulesrc/scores/stats-set3$
^t/data/nice/004$
^t/data/nice/mime5$
^t/data/nice/mime8$
^t/data/nice/mime9$
^t/data/spam/bsmtpnull$
^t/data/spam/hashbl$
^t/data/txrep/6$
^t/data/txrep/7$
^t/data/welcomelists/ibm_enews_de$
^t/data/welcomelists/netcenter-direct_de$
^t/test_dir$
```

You should consider excluding directory paths (e.g. `(?:^|/)vendor/`), filenames (e.g. `(?:^|/)yarn\.lock$`), or file extensions (e.g. `\.gz$`)

You should consider adding them to:

```
.github/actions/spelling/excludes.txt
```

File matching is via Perl regular expressions.

To check these files, more of their words need to be in the dictionary than not. You can use `patterns.txt` to exclude portions, add items to the dictionary (e.g. by adding them to `allow.txt`), or fix typos.

</details>

#### Highlights

Pattern | Notes
-|-
`(?:^\|/)base64\.txt$` | A file in any directory including the root (with escaping for a single character)
`(?:\|$^ 87.50% - excluded 7/8)^t/data/spam/olevbmacro/` | All files within a certain path, even though a small portion of files weren't naturally excluded
`/data/nice/dmarc/[^/]+$` | Any files within a series of directories
`[^/]\.dat$` | Any file with a specific file extension (there must be at least one character before the file extension)
`^debian/files$` | A specific file (no escaping)
`^debian/spamc/` | All files within a certain path

### Directory path

Given open `$checked_files` and `$should_exclude_file` in parallel. Create a stack for each that counts the number of children of the current directory, upon leaving, compare w/ the parallel stack. If it's significant, suggest ignoring. Discard stack items upon moving to siblings, and add values to parents upon leaving children.

### File extensions

... are pretty easy:

```sh
get_extension_counts() {
  cat |
  perl -ne 's{^.*/}{};next unless s{^.*\.}{.}; print' |
  sort |
  uniq -c |
  perl -pne 's{\s*(\d+)\s+(\.\S+)}{$2 $1}'
}
```

for each extension from `get_extension_counts` compare the should_exclude and checked values, and if the former is a significant portion of the latter, suggest excluding using `\.EXTENSION$`.

### File names

Like File extensions, but instead of capturing the rhs of the `.` for the filename, capture the whole filename.

## Scoring suggestions

1. Generate all reasonable regular expressions (this excludes ones where they match too many non excluded files)
2. Calculate the matching files for each (and the count of matching files)
3. Sort from most matches to fewest (tie-breaker being shorter regular expressions)
4. Loop through candidates, taking the first one
5. Add all of its files to the list of files no longer interesting
6. Go to the next candidate, subtract out no longer interesting files, and check its current count against the next candidate count
7. If it's still highest, select it
8. If it isn't, queue it to be rechecked at approximately where it should be in the scoring world and go to the next candidate

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
