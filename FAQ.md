# Frequently Asked Questions

- [How do I upgrade?](#how-do-i-upgrade)

- [How do I get comments to collapse?](#how-do-i-get-comments-to-collapse)

- [Why can't I see the 👼 SARIF report?](#why-cant-i-see-the--sarif-report)

## How do I upgrade?

The recommended approach to upgrading is to _merge_ the contents of https://github.com/check-spelling/spell-check-this/tree/main/.github into your `.github` directory.

For the [workflow](https://raw.githubusercontent.com/check-spelling/spell-check-this/main/.github/workflows/spelling.yml),
you'll generally want to copy over any settings that you've applied (typically dictionary configuration) and remove any items you've removed.

New releases of check-spelling will add new features, some of which may be enabled by default. But, often, to avoid behavior changes to existing deployments, they require opting in, and thus additional flags via [workflow parameters](Configuration.md#workflow-parameters).

The [spell-check-this template repository](https://github.com/check-spelling/spell-check-this) enables some settings which you might not want, in some ways it's a showcase of what check-spelling can do (e.g. check PR summary and descriptions, or even commit messages).

## How do I get comments to collapse?

There are lots of reasons comments won't collapse, but the fix is generally to [refresh your workflow](#how-do-i-upgrade).

When you _push_ to a **Pull Request**, the workflow that matters is generally the **base branch** (although, also the **Pull Request**'s **head branch**).

When you _comment_ on a **Pull Request**, the workflow that matters is the one for your **default branch**.

## Why can't I see the 👼 SARIF report?

Reports for some repositories will have an entry like:

> See the [📂 files](#) view, the [📜action log](#) or [👼 SARIF report](#) for details.

Users without write access to the repository will probably not be able to see the [👼 SARIF report](#), and will instead see a 404 page.

This relates to the fact that SARIF was designed for reporting results from security scanners, as such GitHub restricts who has access to the reports. For more information, see [SARIF output visibility](./Feature:-SARIF-output.md#visibility).

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
