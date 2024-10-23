# IDE Integration

## Visual Studio Code

### cspell

Things to try:

```json
"cSpell.customDictionaries": {
  "custom-allow": { "name": "custom-allow", "path": "${workspaceFolder}/.github/actions/spelling/allow.txt" },
  "custom-expect": { "name": "custom-expect", "path": "${workspaceFolder}/.github/actions/spelling/expect.txt" , "addWords": true }
}
```

- Ref: [streetsidesoftware/vscode-spell-checker#681](https://github.com/streetsidesoftware/vscode-spell-checker/issues/681)

---
[FAQ](FAQ.md) | [Showcase](Showcase.md) | [Event descriptions](Event-descriptions.md) | [Configuration information](Configuration-information.md) | [Known Issues](Known-Issues.md) | [Possible features](Possible-features.md) | [Deprecations](Deprecations.md) | [Release notes](Release-notes.md) | [Helpful scripts](Helpful-scripts.md)
