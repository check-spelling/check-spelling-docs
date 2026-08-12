## Workflows

### Default

The default workflow is (check-spelling is integrated into the base repo):

1. Base branch has check-spelling.
2. Forks from the base also have check-spelling.
3. People can make a change to check-spelling in the fork / PR and it can merge into the base.

### Alternative

An alternative workflow is (check-spelling is not integrated into the base repo):

1. Upstream doesn't have check-spelling
2. Add check-spelling to a fork (e.g. check-spelling/zig)
3. PR is made from a repo that still doesn't have check-spelling into one that does
4. talk-to-the-bot knows that it can't update the HEAD of the PR, as that would obviously cause a conflict, so it's disabled
5. check-spelling (classic) could know this, and give a command to update the BASE instead of the HEAD
6. people could then push the updates to the BASE

## Work

1. Teach classic to recognize the case (as talk-to-the-bot already does) and have it suggest patches to BASE instead of HEAD
2. Teach talk-to-the-bot how to update HEAD instead of BASE -- this requires considering the permissions model a lot more. It might also involve a different set of commands, since the default is to both Add and Remove items from `expect.txt`. I'd be tempted to have it default to only adding, and require a fancier command for removal. A lot of work is required here.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
