# Cache dictionaries

There is _some_ cost to dictionaries, so it might be worth caching them (especially with `.dic`+`.aff`).

## Implementation

Dictionaries will go to a specific directory and [actions/cache](https://github/actions/cache) will track the directory.

The dictionary retrieval code can choose to skip retrieving any file(s) it already has.

### Invalidation

Each dictionary's ETAG and url should be stored.

If the url is different, invalidate.
Use the ETAG to retrieve (or not) the content.

### Clearing cache entries manually

1. You can get a list of caches using [actions/cache: list-github-actions-caches-for-a-repository](https://docs.github.com/rest/actions/cache#list-github-actions-caches-for-a-repository)
2. You can delete a cache entry by id using [actions/cache: delete-a-github-actions-cache-for-a-repository-using-a-cache-id](https://docs.github.com/rest/actions/cache#delete-a-github-actions-cache-for-a-repository-using-a-cache-id)
