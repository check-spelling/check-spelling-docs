# Miscellaneous commands

## Empty remote

```sh
#!/bin/sh
if [ -d ~/code/empty ]; then
  cd ~/code/empty
else
  cd $(mktemp -d)
  git init
fi
for a in $(git ls-remote $1|perl -pne 's/^\S*\s+/:/'); do git push $1 $a 2>/dev/null & done
```

## Adding another remote

```sh
git remote add $ORG -t $BRANCH --no-tags $(git remote get-url origin |perl -pne 's{:.*/}{:'$ORG'/}')
```

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
