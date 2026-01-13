# Spelling comments without config

## Past

Through [0.0.16-alpha](https://github.com/check-spelling/check-spelling/releases/tag/0.0.16-alpha), if you didn't create an `expect` file, the output listing unrecognized words (and the command to create the `expect` file) was only available in the Action run logs.

I had a model of assuming people would want to review things and use the output before merging somewhere.

## Consideration

In retrospect, and based on experience and feedback, I've decided that having the output and commands to construct the `expect` file should be reported as a comment just as with later runs.

Also, because of the way GitHub formats the logs, it's actually moderately painful to extract output from them to run as a command, and thus relying on a comment is generally better.

## Behavior Change

With this change, any run which results in unrecognized words should post a comment, even if there isn't an `expect` file.

⚠️ Note: The comment may fail if the number of unrecognized words is incredibly long.
In those cases, one will probably want to write some `exclude` entries (or `only`) in order to limit what the tool analyzes.

This change shouldn't impact existing users as they're already set up with an `expect` file.
It should only impact the onboarding process hopefully making it smoother.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
