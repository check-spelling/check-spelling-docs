Prior to 0.0.17, in order to get the shiny features from check-spelling, to get started, one needed to:
* specify `bucket` and `project` as part of the configuration.
* create an `expect` (or similar) file.


With 0.0.17, `bucket` and `project` are replaced by `config` which defaults to `.github/actions/spelling` (as if one had specified `bucket: .github/actions` and `project: spelling`). Note that `bucket` and `project` are still supported (and to retain backwards compatibility these override `config`).

With 0.0.17, the action will provide comments when it runs even if there is no `expect` (or similar) file. This should lead to a more natural flow.