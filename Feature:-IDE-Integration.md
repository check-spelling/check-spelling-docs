# IDE Integration

## Visual Studio Code

### cspell

Things to try:

```json
"cSpell.dictionaryDefinitions": [
  {
    "name": "custom-allow", "path": "${workspaceFolder}/.github/actions/spelling/allow.txt"
  },
  {
    "name": "custom-expect", "path": "${workspaceFolder}/.github/actions/spelling/expect.txt"
  },
],
"cSpell.dictionaries": [
  "custom-allow",
  "custom-expect"
],
```

```json
"cSpell.customDictionaries": {
  "custom-allow": { "name": "custom-allow", "path": "${workspaceFolder:Root}/.github/actions/spelling/allow.txt" },
  "custom-expect": { "name": "custom-expect", "path": "${workspaceFolder:Root}/internal-terms.txt" , "addWords": true }
},
```

* Ref: [streetsidesoftware/vscode-spell-checker#681](https://github.com/streetsidesoftware/vscode-spell-checker/issues/681)