1. Create a workflow file (`.github/workflows/spelling.yml`) in your repository:
   ```yml
   name: Spell checking
   on:
     push:
     schedule:
       # * is a special character in YAML so you have to quote this string
       - cron: '15 * * * *'
   jobs:
     build:
       name: Spell checking
       runs-on: ubuntu-latest
       steps:
       - uses: actions/checkout@v2.0.0
         with:
           fetch-depth: 5
       - uses: check-spelling/check-spelling@0.0.17-alpha
   ```
   See [[Configuration: Workflows]] for information on the
   [[push|Configuration: Workflows#push]] /
   [[pull_request|Configuration: Workflows#pull_request]] /
   [[schedule|Configuration: Workflows#schedule]]
   events and how they work with this action.
1. If you don't specify [[a config env variable|Configuration#config]],
   then the remainder of your configuration will be done in
   [[files|Configuration#files]] within the
   `.github/actions/spelling` directory.
    1. You'll probably want to create an [[excludes|Configuration#excludes]] file
       (e.g. `.github/actions/spelling/excludes.txt`)
       to exclude files that don't contain words to check.
    1. You may want to create a [[patterns|Configuration#patterns]] file
       (e.g. `.github/actions/spelling/patterns.txt`)
       to mask certain patterns.
    1. You may want to supplement the dictionary or remove entries from it using
       [[allow|Configuration#allow]] / [[reject|Configuration#reject]] files
       respectively (e.g. `.github/actions/spelling/allow.txt` /
       `.github/actions/spelling/reject.txt`).
1. If the default dictionary doesn't work well, you can replace it.
    1. If there's a public dictionary URL that works better than the default one,
       you can replace it by specifying a
       [[dictionary_url|Configuration#dictionary_url]] in the `spelling.yml`
       workflow, e.g.:
       ```
           # ...
           steps:
           - uses: check-spelling/check-spelling@0.0.17-alpha
             env:
               dictionary_url: 'https://url.to.a/different/dictionary.txt'
       ```
    1. Alternatively, you can maintain your own using a
       [[dictionary|Configuration#dictionary]] file
       (e.g. `.github/actions/spelling/dictionary.txt`).
1. Over time you'll probably want to adjust these files.
1. You can maintain an [[expect|Configuration#expect]] file
   (e.g. `.github/actions/spelling/expect.txt`) to temporarily accept tokens
   which you're using but which aren't actually words.
   The action will suggest commands to maintain this file.
1. Best practices for workflows is to use a pinned version.
   There is generally a `prerelease` branch with evolving features,
   but you shouldn't use it unless you need a specific feature from it.
   You can configure GitHub's 
   [dependabot](https://docs.github.com/en/github/administering-a-repository/keeping-your-dependencies-updated-automatically)
   to receive notifications about updates to your workflow(s).

ℹ️ In general, a file `task.txt` can be replaced with a directory `task/`
  containing multiple files ending with `.txt` if you prefer --
  the files will be merged together.