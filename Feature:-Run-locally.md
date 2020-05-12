# Running locally to check for new errors

Possible approaches:

* [Single script](#single-script)
* [Docker image](#Docker-image)

## Single script

The original tool was self contained, but the current script is considerably fancier...

As the script slowly evolves from shell+perl+jq to perl+jq (it could switch from perl+jq to node), maybe it could become a single script again.

In the long term, I'd rather this, but I don't expect to implement this anytime soon.

## Docker image

As of **0.0.15-alpha**, there is a `Dockerfile` and its default path is to *check spelling* (there are other paths for checking pull requests and there will be a path for interacting with comments).
⚠️ The Docker file will no longer be the main entrypoint in GitHub as of **0.0.16-alpha**.

* Publish a docker image.

* Provide a command:

   `docker run --rm some-registry/check-spelling:prelease -v $PWD:/check-this:ro`

### Users pass environment variables

The simplest version would require the user to pass `-e bucket ...` and `-e project ...`.

The implementation cost for this isn't terribly high, as there's already a Docker file and the changes required to support this are fairly minimal.

### GitHub Workflow discovery

A fancier version could look through `.github/workflows/` and find the check-spelling configurations.

This would require much more work and would never be perfect. It should be able to fish out multiple run cases, but I don't expect that I'd handle `if` conditions or any prerequisites.

### Pick a registry

This would require picking a registry.

* [[GitHub|https://github.com/features/packages#pricing]] charges after 1GB of outbound use. I'd hope that I wouldn't hit this, but I could easily be unlucky.
* [[Quay.io|https://quay.io]] appears to be free for open source, although their web portal instructions point to a path which isn't free.