# Cache dictionaries

There is _some_ cost to dictionaries, so it might be worth caching them (especially with `.dic`+`.aff`).

## Implementation

I think I'll change dictionaries to go to a specific directory and use @actions/cache to track the directory.

The dictionary retrieval code can choose to skip retrieving any file(s) it already has.
