# Check Images

## Background
People (and AI) can burn typos into pictures in addition to making typos in text files.

## Implementation

Use [tesseract-ocr/tesseract](https://github.com/tesseract-ocr/tesseract) to OCR image files and store their content as an artifact. Files can  then be checked normally.

If pictures are updated, the cached content will be ignored and the files will be processed again. The cache is implemented as an artifact (which will generally expire in 30 days).

### To enable

```yaml
check-images: 1
```

### Available

[v0.0.26](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.26)

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
