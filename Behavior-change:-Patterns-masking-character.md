# Behavior change: Patterns masking character

## Background

Originally patterns resulted in roughly a single "` `", and more recently a "` `" per matched character.

## Problems

With the introduction of [Forbidden patterns](./Feature:-Forbidden-patterns), how those masked items worked mattered a bit.

Specifically, if one used this pattern (from [Configuration Examples: patterns](./Configuration-Examples:-patterns)):

```
# version suffix <word>v#
[Vv]\d+(?:\b|(?=[a-zA-Z_]))
```

And this forbidden pattern (from [Configuration Examples: forbidden](./Configuration-Examples:-forbidden)):

```
# Reject duplicate words
\b(\w{3,})\s\g{-1}\b
```

And had input:

```
define('DYNDNS_PROVIDER_VALUES', 'all-inkl azure azurev6 citynetwork cloudflare cloudflare-v6 cloudns custom custom-v6 desec desec-v6 digitalocean digitalocean-v6 dnsexit dnsimple dnsimple-v6 dnsmadeeasy dnsomatic domeneshop domeneshop-v6 dreamhost dreamhost-v6 duiadns duiadns-v6 dyfi dyndns dyndns-custom dyndns-static dyns dynv6 dynv6-v6 easydns easydns-v6 eurodns freedns freedns-v6 freedns2 freedns2-v6 glesys gandi-livedns gandi-livedns-v6 godaddy godaddy-v6 googledomains gratisdns he-net he-net-v6 he-net-tunnelbroker hover linode linode-v6 loopia mythicbeasts mythicbeasts-v6 name.com name.com-v6 namecheap nicru nicru-v6 noip noip-v6 noip-free noip-free-v6 onecom onecom-v6 ods opendns ovh-dynhost route53 route53-v6 selfhost spdyn spdyn-v6 strato yandex yandex-v6 zoneedit');
```

Which was roughly equivalent to:

```
define('DYNDNS_PROVIDER_VALUES', 'all-inkl azure azurev6 citynetwork');
```

The pattern would result in the spell checker seeing:

```
define('DYNDNS_PROVIDER_VALUES', 'all-inkl azure azure   citynetwork');
```

And then flagging

```
 azure azure
```

As a duplicate word (`azure`).

## Change

Instead of masking `patterns` with "` `", as of [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20), patterns will be masked with "`=`".

It's unlikely that anyone will notice this change as the only place this should matter is forbidden patterns which are v0.0.20 feature.

The spell checker itself ignores non-alpha characters (treating them as equivalent to "` `") already. So the "`=`" is really only relevant during evaluation of [Forbidden patterns](./Feature:-Forbidden-patterns).

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
