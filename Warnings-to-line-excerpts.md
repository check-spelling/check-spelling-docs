As of [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21), you won't need to do this.

As of a certain version, you can convert this output:

```
Warning: samples/client/petstore/java/okhttp-gson-parcelableModel/src/main/java/org/openapitools/client/model/FileSchemaTestClass.java: line 222, columns 21-30, Warning - `Arrayfiles` is not a recognized word. (unrecognized-spelling)
```

Using this script:
```
perl -ne 'next unless s{Warning: ([^:]+): line (\d+).*?- \`(.*?)\`.*}{grep -H -n . $1 |grep :$2:|grep --color=always "$3"};print'
```

Into a command like this:

```
grep -H -n . samples/client/petstore/java/okhttp-gson-parcelableModel/src/main/java/org/openapitools/client/model/FileSchemaTestClass.java |grep :222:|grep --color=always "Arrayfiles"
```

Which when run will yield output like this:
> samples/client/petstore/java/okhttp-gson-parcelableModel/src/main/java/org/openapitools/client/model/FileSchemaTestClass.java:222:      JsonArray json**Arrayfiles** = jsonObj.getAsJsonArray("files");