### Adding another remote
```sh
git remote add -t $BRANCH --no-tags $ORG git remote get-url origin |perl -pne 's{:.*/}{:'$ORG'/}'
```