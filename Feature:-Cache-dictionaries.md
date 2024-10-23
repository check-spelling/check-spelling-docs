# Cache dictionaries

There is _some_ cost to dictionaries, so it seems to be worth caching them (especially with `.dic`+`.aff`).

## Implementation

Dictionaries will go to a specific directory and [actions/cache](https://github/actions/cache) will track the directory.

The dictionary retrieval code can choose to skip retrieving any file(s) it already has.

ℹ️ Caching is not implemented as of [v0.0.23](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.23). You could merge a number of dictionaries into a single file and reference it instead if you believe the performance of downloading a bunch of dictionaries in parallel is problematic. At the time of the release of [v0.0.23](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.23), the behavior of actions/cache was sufficiently problematic that all caching code was removed.

### Invalidation

Each dictionary's ETAG will be stored.

Use the ETAG to retrieve (or not) the content.

> The code doesn't currently handle the case that there is no etag from the server, that should be added (in the interim, please use servers that generate etags...)

### Clearing cache entries manually

#### Programmatically

1. You can get a list of caches using [actions/cache: list-github-actions-caches-for-a-repository](https://docs.github.com/rest/actions/cache#list-github-actions-caches-for-a-repository)
2. You can delete a cache entry by id using [actions/cache: delete-a-github-actions-cache-for-a-repository-using-a-cache-id](https://docs.github.com/rest/actions/cache#delete-a-github-actions-cache-for-a-repository-using-a-cache-id)

#### Interactively

Caches are accessible below workflows on the actions page of each repository and can be deleted directly.

## Storage

There have been a couple of iterations so far... Layouts 1 and 2 (with etags) don't handle collisions in dictionary names particularly well...

### Proposed layout

```
dictionary/
- {sha}/
  - {extension}
- ...

urls/
- {random}/
  - raw.url
  - resolved.url
  - etag
  - sha
- ...
```

### Approach

1. Given a new unresolved url.
2. Resolve it.
3. Check `urls/*/resolved.url` to see if it is already present (=> 6).

4. Create `urls/{random}`.
5. Write `raw.url` and `resolved.url` to the directory.

6. Use the matching `urls/{random}` directory.

7. Use the etag (if available) to see if it's current (=> done).
8. Save the file to a temp.
9. Calculate the sha.
10. Write the new `etag` and `sha` to the directory (from 6).
11. Write `dictionary/{sha}/{extension}` (`{sha}` from 9, `{extension}` from 2).

#### Cleanup after all resolution is done

1. detect any `directory/{sha}` for which there is no urls/{\*}/sha containing that value and delete it.
2. detect any `urls/{*}/sha` for which there's more than one `urls/{*}` with the same `sha` file value and warn about it.

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
