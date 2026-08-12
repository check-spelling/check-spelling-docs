Just in time for Halloween 🎃 (2021), a spooky 👻 fast 🏃 speed improvement.

## Background

In the [distant past](https://github.com/check-spelling/check-spelling/commit/52d5ec0bfe3b7c7e32f083bdf0edcfaad435d909), I ran into versions of `xargs` which would somehow fail because the constructed command-line exceeded the available space.

In response, I made it absolutely pessimistic about how `xargs` worked.

With the introduction of parallelism (initially via [parallel](https://github.com/check-spelling/check-spelling/commit/17c203fa5f67b7e4d378023ea9f17960c7162999), but more recently directly via [xargs](https://github.com/check-spelling/check-spelling/commit/d757f67f1ff629fa3b77696e01aebd3d8ac36b2e)), it was also afraid of leaving one job with a long list of work while the other threads were finished. I did a bit of testing and settled on 8 as better than 1 and unlikely to leave a huge imbalance.

GitHub Action Runtime has a [fairly large default environment](https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/environment-variables-full-list-github-actions) which impacts the argument capacity for running subtasks.

With all this, the parallel task was instructed to run the actual core spell checker on files in batches of 8.

Each time the spell checker runs, it opens the dictionary (a text file) and reads in its contents into a hashmap (implemented using a standard Perl hash(table)).

## Changes

Instead of checking 8 files at a time, I'm splitting the work into approximately 4 rounds per thread.

## Future work

I've been toying with sorting the check list to put the largest files first. [Configurable file size limits](./Feature:-Configurable-file-size-limits) means that the meta analyzer potentially has access to this information before it starts assigning files to workers.

In theory this could reduce the likelihood that the last worker will be stuck working on a really large file.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
