# Convert paths to excludes regular expressions

```sh
perl -pne 's{\.}{\\.}g;s/^/^/;s/$/\$/'
```
