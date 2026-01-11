# Regression testing

## To-date

Right now, most check-spelling testing is done through live use of the action.

## Phase 0

1. Create a repository [check-spelling-sandbox/autotest-check-spelling](https://github.com/check-spelling-sandbox/autotest-check-spelling)
2. Give it a secret so that it can push to its own repository
3. Create a workflow which pushes the current commits from check-spelling and check-spelling-sandbox for `main` and `prerelease` to newly https://raw.githubusercontent.com/check-spelling-sandbox/autotest-check-spelling/main/.github/workflows/autotest.yml

### Rationale

This enables at least catching bugs involving dates changing (there was one fixed for [v0.0.24](https://github.com/check-spelling/check-spelling/releases/v0.0.24)).

## Plan 1

1. Create a repository `check-spelling/regression-tests`
2. Create a template of commits
3. Create a workflow which on each push applies each of the templated commits filling in the targeted revision and pushing them to `check-spelling/regression-tests`
4. Ideally have the workflow retrieve the results of each of the commits' actions and compare them against expected results. -- It should be possible to do this using either additional steps in the workflow job or using another job in the workflow or by using workflow call with a final workflow.

## Plan 2

1. Create a `check-spelling-test` org.
2. Create a PAT for a bot user (possibly the existing [@check-spelling-bot](https://github.com/check-spelling-bot)).
3. Create a secret in the regression testing repository for that PAT.
4. Use `gh` in workflows to create a brand new repository for each thing it tests.
   1. Create the repository
   2. Insert the workflow(s)
   3. Create pull requests
   4. Add comments
   5. Check on how things are feeling.
5. It could probably even have a second PAT which just has enough permission to poke the original repository to trigger data collection from the events in the test repository.

## Timeline

Date | Phase
-|-
2024-11-01 | [Phase 0](#phase-0) [check-spelling-sandbox/autotest-check-spelling](https://github.com/check-spelling-sandbox/autotest-check-spelling)
Uncertain | [Plan 1](#plan-1) `check-spelling/regression-tests`
...

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
