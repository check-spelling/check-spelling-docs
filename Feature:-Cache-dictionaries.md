# Cache dictionaries

There is _some_ cost to dictionaries, so it seems to be worth caching them (especially with `.dic`+`.aff`).

## Implementation

Dictionaries will go to a specific directory and [actions/cache](https://github/actions/cache) will track the directory.

The dictionary retrieval code can choose to skip retrieving any file(s) it already has.

### Invalidation

Each dictionary's ETAG will be stored.

Use the ETAG to retrieve (or not) the content.

### Clearing cache entries manually

#### Programmatically
1. You can get a list of caches using [actions/cache: list-github-actions-caches-for-a-repository](https://docs.github.com/rest/actions/cache#list-github-actions-caches-for-a-repository)
2. You can delete a cache entry by id using [actions/cache: delete-a-github-actions-cache-for-a-repository-using-a-cache-id](https://docs.github.com/rest/actions/cache#delete-a-github-actions-cache-for-a-repository-using-a-cache-id)

#### Interactively

Caches are accessible below workflows on the actions page of each repository and can be deleted directly.