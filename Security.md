# Security

Please note: this wiki is not secured.

Spammers do periodically attack GitHub wikis and at least a couple of attacks have been made to this specific wiki.

## Security Polling

Check Spelling performs [Security Polling](./Feature:-Security-Polling) to verify that the running version isn't known insecure.

## Policy

The formal [security/policy](https://github.com/check-spelling/check-spelling/security/policy) is in the repository.

## Scanning

### CodeQL

[CodeQL](https://github.com/github/codeql-action) is not used by this repository because it doesn't support Shell/Perl.

> CodeQL supports [ 'cpp', 'csharp', 'go', 'java', 'javascript', 'python' ]

There is a single legacy JavaScript file which replaced Docker and has been replaced by Composite actions as part of the runtime bootstrapping process. Scanning that file is absolutely pointless. The file (and the Dockerfile) will eventually be deleted.

### ShellCheck

[actions/shellcheck](https://github.com/marketplace/actions/shellcheck) will probably be added eventually.

It's expected that making it happy will require a non-trivial amount of effort.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
