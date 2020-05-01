# Avoid using colors in names

I received feedback that colors were problematic.

I think to address this, I'll add support for:

* `expect` <=> `whitelist`

I'll probably make this the primary term and offer the old one as backwards compatibility (along w/ making PRs to existing consumers to migrate).

In some ways, `expect` is actually more accurate as the action tries to prune the list of things which are no longer necessary.