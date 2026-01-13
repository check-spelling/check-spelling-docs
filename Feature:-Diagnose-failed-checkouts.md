# Diagnose failed checkouts

## Background
checking out a repository is actually a lot of work, in fact, GitHub's [actions/checkout](https://github.com/actions/checkout) repository is approximately twice as large as [check-spelling](https://github.com/check-spelling/check-spelling)!

Unfortunately, one of the things that can happen when people try to check out a repository is that it can fail, and it can fail for lots of reasons.

## Goal

Ideally, if, when you use check-spelling, the checkout fails, you should be able to get a helpful message explaining what's going wrong with a hint about how to fix it.

If check-spelling can suggest a likely cause and solution, it will.

If it can't, it will suggest looking for a ticket for [`checkout-failed-unknown-cause`](https://github.com/check-spelling-sandbox/check-spelling/issues?q=is%3Aissue%20checkout-failed-unknown-cause) and possibly filing one if you can't find a relevant issue. This feature will be improved in the future as other causes are analyzed.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
