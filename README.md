# check-spelling-docs

This branch is responsible for maintaining the
[check-spelling/check-spelling-docs gh-pages](https://github.com/check-spelling/check-spelling-docs/tree/gh-pages)
content.

It mostly contains a number of [workflows](.github/workflows/):
* [refresh](.github/workflows/refresh.yml) is responsible for pulling in new content from the [check-spelling/check-spelling wiki](https://github.com/check-spelling/check-spelling/wiki)
* [jekyll-gh-pages](.github/workflows/jekyll-gh-pages.yml) is responsible for publishing the content to gh-pages
* [link-checker](.github/workflows/link-checker.yml) is responsible for checking links in the published site
* [spelling](.github/workflows/spelling.yml) is responsible for checking the spelling of both this branch and the gh-pages branch

Supporting scripts:
* [`build.sh`](build.sh) processes all of the wiki pages (calling `process-md.pl` and `add-footer.pl`)
* [`process-md.pl`](process-md.pl) handles most divergences between GitHub's wiki markdown and gh-pages's markdown (with the exception of a quirk in relating to `code` anchors which is handled by [jekyll-gh-pages](.github/workflows/jekyll-gh-pages.yml))
* [`add-footer.pl`](add-footer.pl) ensures that each page has a footer
