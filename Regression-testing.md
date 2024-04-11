# Regression testing

## To-date

Right now, most check-spelling testing is done through live use of the action

## Plan

1. Create a repository `check-spelling/regression-tests`
2. Create a template of commits
3. Create a workflow which on each push applies each of the templated commits filling in the targeted revision and pushing them to `check-spelling/regression-tests`
4. Ideally have the workflow retrieve the results of each of the commits' actions and compare them against expected results.

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

Uncertain

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
