#!/bin/sh
if [ ! -e index.md ] && [ -e Home.md ]; then
  git mv Home.md index.md
fi
./process-md.pl ./*.md
for maybe_missing_eol in ./*.md; do
  if [ -s "$maybe_missing_eol" ] && [ "$(tail -1 "$maybe_missing_eol" | wc -l | xargs)" -eq 0 ]; then
    echo >> "$maybe_missing_eol"
  fi
done
if [ -s _Footer.md ]; then
  footer=$(head -1 _Footer.md)
  git ls-files '*.md' -z |
  footer="$footer" ./add-footer.pl
fi
