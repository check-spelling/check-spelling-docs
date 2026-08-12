# Security Polling

Inspired by [PowerDNS's Security Polling](https://doc.powerdns.com/authoritative/security.html#security-polling),
check-spelling will check to see if the current version has a reported security advisory.

If there's a reported security advisory, you should read it and take a recommended action.

## States

1. If there is no reported security advisory and your workflow doesn't define `ignore_security_advisory`, the action will run (this is the default case).

2. If there is a reported security advisory and your workflow doesn't acknowledge that advisory, the action will abort.

   You should read the advisory, and preferably upgrade to a later version. The advisory should offer advice about what to do.

   The advice might be "please disable this action for the time being", if that happens, I'm sorry, but, better safe than sorry.

3. If your workflow defines `ignore_security_advisory` and there is no reported security advisory, the action will abort.

   It is unsafe to pretend that a version might be ok just because you want to run it.

4. If your workflow defines `ignore_security_advisory` and the advisory doesn't match, the action will abort.

   It is unsafe to pretend that a version might be ok just because you want to run it.

5. If your workflow defines `ignore_security_advisory` and it matches the published advisory, the action will run (under protest).

   Do this at your own risk.

   Ideally, you should upgrade to a fixed version.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
