# Regression testing

## To-date

Right now, most check-spelling testing is done through live use of the action

## Plan

1. Create a repository `check-spelling/regression-tests`
2. Create a template of commits
3. Create a workflow which on each push applies each of the templated commits filling in the targeted revision and pushing them to `check-spelling/regression-tests`
4. Ideally have the workflow retrieve the results of each of the commits' actions and compare them against expected results.

## Timeline

Uncertain