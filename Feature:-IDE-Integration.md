# IDE Integration

## Visual Studio Code

### cspell

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