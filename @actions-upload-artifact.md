# Notes on uploading artifacts manually

1. The official way to upload an artifact is [actions/upload-artifact](https://github.com/actions/upload-artifact)
2. That uses [@actions/artifact](https://github.com/actions/toolkit/tree/main/packages/artifact)
3. Specifically, it uses `artifact.create().uploadArtifact(artifactName, files, rootDirectory, options)` see [example](https://github.com/actions/toolkit/tree/main/packages/artifact#example-using-absolute-file-paths)
4. That uses [@actions/http-client/auth](https://raw.githubusercontent.com/actions/http-client/544584c8ca4a255395fd73c66bc5eb90ac8abea1/auth.ts)

The underlying stuff uses:
* `ACTIONS_RUNTIME_TOKEN`
* `ACTIONS_RUNTIME_URL`
* `GITHUB_RETENTION_DAYS`
* `GITHUB_RUN_ID`
* `GITHUB_WORKSPACE`
* `getApiVersion = (() => '6.0-preview')`
```js
    const artifactUrl = `${ACTIONS_RUNTIME_URL}_apis/pipelines/workflows/${GITHUB_RUN_ID}/artifacts?api-version=${getApiVersion()}`;
```
https://raw.githubusercontent.com/actions/toolkit/c861dd8859fe5294289fcada363ce9bc71e9d260/packages/artifact/src/internal/utils.ts#L176
```js
  requestOptions['Accept'] = `application/json;api-version=${getApiVersion()}`
```
* `contentType='application/json`
```js
client.post(artifactUrl, data, headers),
```

```sh
artifactContainerName=check-spelling
artifactFileName=add.txt
fileToUpload=$(mktemp)
echo "helllo
whorld" > $fileToUpload
private_API_VERSION="6.0-preview"
baseUrl="${ACTIONS_RUNTIME_URL}_apis/pipelines/workflows/${GITHUB_RUN_ID}/artifacts"

artifactParams=$(mktemp)
echo '{"Type": "actions_storage"}' | jq -c -M --arg artifactName $artifactContainerName '. + {Name: $artifactName}' > $artifactParams
artifactContainer=$(mktemp)
curl -X POST -d @$artifactParams -vvv \
 -H 'Content-Type: application/json;api-version=6.0-preview' \
 -H "Authorization: Bearer $ACTIONS_RUNTIME_TOKEN" \
"$baseUrl" > $artifactContainer
something=test.case
fileUrl="$baseUrl&itemPath=$artifactFileName"
fileParams=$(mktemp)
curl -X POST -d @$fileToUpload -vvv \
 -H "Authorization: Bearer $ACTIONS_RUNTIME_TOKEN" \
 "$fileUrl"

```

The implementation in Python: https://raw.githubusercontent.com/KOLANICH-libs/miniGHAPI.py/09388fba1145275181fe6ca7f7e3c526abc96d4f/miniGHAPI/undocumented.py (it is bound to hash because can be moved into another file in future)

Few highlights:

* providing api version as a part of a query string is not heeded, works fine without it.

* There are 3 queries.

1. create an artifact container
2. upload the artifact into a file within container. THIS MUST BE A RANGE QUERY. IT IS SUSPECTED IT CAN BE USED TO PATCH PARTS OF FILES, WHICH MAY BE USEFUL FOR STORING BINARY DATABASES AND FUSE FILESYSTEMS.
3. PATCH the container. The artifact will not appear within a pipeline without this query. GitHub official action code sets the size in it, but in fact it has no effect at all, likely it is just a discrepancy between the server and client code. It is suspected that the PATCH query can be utilised to make the artifact appear not as a zip archive.

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
