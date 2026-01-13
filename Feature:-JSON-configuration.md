# JSON configuration

## Background

1. GitHub workflows and actions are defined using yaml.
2. The `.github/workflows` directory is also protected against normal pushes.
3. Most of the configuration for check-spelling lives in a different directory (typically `.github/actions/spelling`).
4. Parsing yaml is moderately painful.
5. GitHub Reusable workflows would require defining the same sorts of values as the action yaml does, but with new defaults, which is just incredibly painful.
6. GitHub Runtime doesn't actually expose workflow inputs to `combined` workflows -- instead one has to manually beg for them.
7. GitHub APIs themselves tend to yield JSON and the GitHub Action Runtime itself also deals in JSON.

The second to last point means that the action definition is incredibly verbose in places where it shouldn't need to be.
The last point means that check-spelling needs a json parser in order to do anything (it uses `jq`).

## Proposal

Instead of having lots of lines of config in the `action.yml` file, and similar lines in the reusable workflow, I'm contemplating having just one or two configurable items in the `action.yml` -- mostly the path to the config directory [`config`](Configuration#config) and the [`custom_task`](Configuration#customtask)).

A new file will be added (tentatively `config.json`) containing the other configuration that used to be defined in `action.yml` and specified in the workflow.

## Progress and Migration

Using `toJSON(inputs)` allows me to capture the current inputs (and thus greatly simplify the action.yml code).

### Benefits

- Configuration doesn't need to be specified 2+ times (spelling, comment, optional update phase).
- Only the pieces of configuration that are used by a given path would need to be parsed (currently the action.yml has to convert all inputs into env vars before the action actually starts running).

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
