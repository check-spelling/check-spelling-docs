# Handle GitHub Varnish failures

## Background

This [job run](https://github.com/check-spelling/vector/actions/runs/3954529980/jobs/6771960799) failed fairly amusingly...

<details><summary>Job Run Summary</summary>

#### Annotations

10 errors and 10 warnings

[Check Spelling](https://github.com/check-spelling/vector/actions/runs/3954529980/jobs/6771960799#step:16:594)
Failed to retrieve cspell:software-terms/src/software-terms.txt -- https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/software-terms/src/software-terms.txt (dictionary-not-found)

[Check Spelling](https://github.com/check-spelling/vector/actions/runs/3954529980/jobs/6771960799#step:16:612)
Failed to retrieve cspell:node/node.txt -- https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/node/node.txt (dictionary-not-found)

[Check Spelling](https://github.com/check-spelling/vector/actions/runs/3954529980/jobs/6771960799#step:16:630)
Failed to retrieve cspell:aws/aws.txt -- https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/aws/aws.txt (dictionary-not-found)

[Check Spelling](https://github.com/check-spelling/vector/actions/runs/3954529980/jobs/6771960799#step:16:648)
Failed to retrieve cspell:html/html.txt -- https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/html/html.txt (dictionary-not-found)

[Check Spelling](https://github.com/check-spelling/vector/actions/runs/3954529980/jobs/6771960799#step:16:669)
Failed to retrieve cspell:django/django.txt -- https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/django/django.txt (dictionary-not-found)

[Check Spelling](https://github.com/check-spelling/vector/actions/runs/3954529980/jobs/6771960799#step:16:687)
Failed to retrieve cspell:lua/lua.txt -- https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/lua/lua.txt (dictionary-not-found)

[Check Spelling](https://github.com/check-spelling/vector/actions/runs/3954529980/jobs/6771960799#step:16:705)
Failed to retrieve cspell:rust/rust.txt -- https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/rust/rust.txt (dictionary-not-found)

[Check Spelling](https://github.com/check-spelling/vector/actions/runs/3954529980/jobs/6771960799#step:16:723)
Failed to retrieve cspell:mnemonics/src/mnemonics.txt -- https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/mnemonics/src/mnemonics.txt (dictionary-not-found)

[Check Spelling](https://github.com/check-spelling/vector/actions/runs/3954529980/jobs/6771960799#step:16:741)
Failed to retrieve cspell:elixir/elixir.txt -- https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/elixir/elixir.txt (dictionary-not-found)

[Check Spelling](https://github.com/check-spelling/vector/actions/runs/3954529980/jobs/6771960799#step:16:759)
Failed to retrieve cspell:css/css.txt -- https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/css/css.txt (dictionary-not-found)

[Check Spelling](https://github.com/check-spelling/vector/actions/runs/3954529980/jobs/6771960799#step:1:30)
Failed to download action 'https://api.github.com/repos/actions/checkout/tarball/ac593985615ec2ede58e132d2e21d2b1cbd6127c'. Error: Response status code does not indicate success: 503 (Service Unavailable).

[Check Spelling](https://github.com/check-spelling/vector/actions/runs/3954529980/jobs/6771960799#step:1:31)
Back off 12.226 seconds before retry.

[Check Spelling](https://github.com/check-spelling/vector/actions/runs/3954529980/jobs/6771960799#step:1:33)
Failed to download action 'https://api.github.com/repos/check-spelling/actions-checkout/tarball/c12e7286cb39113c32dd06ac576ed748853ee61e'. Error: Response status code does not indicate success: 503 (Service Unavailable).

[Check Spelling](https://github.com/check-spelling/vector/actions/runs/3954529980/jobs/6771960799#step:1:34)
Back off 21.874 seconds before retry.

[Check Spelling](https://github.com/check-spelling/vector/actions/runs/3954529980/jobs/6771960799#step:1:35)
Failed to download action 'https://api.github.com/repos/check-spelling/actions-checkout/tarball/c12e7286cb39113c32dd06ac576ed748853ee61e'. Error: Error while copying content to a stream.

[Check Spelling](https://github.com/check-spelling/vector/actions/runs/3954529980/jobs/6771960799#step:1:36)
Back off 25.092 seconds before retry.

[Check Spelling](https://github.com/check-spelling/vector/actions/runs/3954529980/jobs/6771960799#step:1:38)
Failed to download action 'https://api.github.com/repos/check-spelling/checkout-merge/tarball/3aa4a3dfa942930fc6d88a77e55f6e0001445cdc'. Error: Error while copying content to a stream.

[Check Spelling](https://github.com/check-spelling/vector/actions/runs/3954529980/jobs/6771960799#step:1:39)
Back off 17.261 seconds before retry.

[Check Spelling](https://github.com/check-spelling/vector/actions/runs/3954529980/jobs/6771960799#step:1:43)
Failed to download action 'https://api.github.com/repos/github/codeql-action/tarball/a34ca99b4610d924e04c68db79e503e1f79f9f02'. Error: Error while copying content to a stream.

[Check Spelling](https://github.com/check-spelling/vector/actions/runs/3954529980/jobs/6771960799#step:1:44)
Back off 15.937 seconds before retry.

</details>

<details><summary>Job Log</summary>

```
2023-01-19T01:39:07.5012450Z Requested labels: ubuntu-latest
2023-01-19T01:39:07.5012484Z Job defined at: check-spelling/vector/.github/workflows/spelling.yml@refs/heads/spell-check-with-spelling
2023-01-19T01:39:07.5012509Z Waiting for a runner to pick up this job...
2023-01-19T01:39:07.9572229Z Job is waiting for a hosted runner to come online.
2023-01-19T01:39:10.0751730Z Job is about to start running on the hosted runner: Hosted Agent (hosted)
2023-01-19T01:39:12.3693461Z Current runner version: '2.300.2'
2023-01-19T01:39:12.3721172Z ##[group]Operating System
2023-01-19T01:39:12.3721722Z Ubuntu
2023-01-19T01:39:12.3722018Z 22.04.1
2023-01-19T01:39:12.3722317Z LTS
2023-01-19T01:39:12.3722615Z ##[endgroup]
2023-01-19T01:39:12.3722899Z ##[group]Runner Image
2023-01-19T01:39:12.3723252Z Image: ubuntu-22.04
2023-01-19T01:39:12.3723638Z Version: 20230109.1
2023-01-19T01:39:12.3724110Z Included Software: https://github.com/actions/runner-images/blob/ubuntu22/20230109.1/images/linux/Ubuntu2204-Readme.md
2023-01-19T01:39:12.3724765Z Image Release: https://github.com/actions/runner-images/releases/tag/ubuntu22%2F20230109.1
2023-01-19T01:39:12.3725215Z ##[endgroup]
2023-01-19T01:39:12.3725587Z ##[group]Runner Image Provisioner
2023-01-19T01:39:12.3725895Z 2.0.98.1
2023-01-19T01:39:12.3726197Z ##[endgroup]
2023-01-19T01:39:12.3726910Z ##[group]GITHUB_TOKEN Permissions
2023-01-19T01:39:12.3727819Z Actions: read
2023-01-19T01:39:12.3728104Z Contents: read
2023-01-19T01:39:12.3728572Z Metadata: read
2023-01-19T01:39:12.3728914Z PullRequests: read
2023-01-19T01:39:12.3729301Z SecurityEvents: write
2023-01-19T01:39:12.3729678Z ##[endgroup]
2023-01-19T01:39:12.3733340Z Secret source: Actions
2023-01-19T01:39:12.3733832Z Prepare workflow directory
2023-01-19T01:39:12.4552110Z Prepare all required actions
2023-01-19T01:39:12.4734738Z Getting action download info
2023-01-19T01:39:12.6652901Z Download action repository 'check-spelling/check-spelling@prerelease' (SHA:7b3793a99cca206ab055d8fcad925fd1af8a31c1)
2023-01-19T01:39:26.5098798Z Getting action download info
2023-01-19T01:39:26.6801350Z Download action repository 'actions/checkout@v3' (SHA:ac593985615ec2ede58e132d2e21d2b1cbd6127c)
2023-01-19T01:39:49.9261717Z ##[warning]Failed to download action 'https://api.github.com/repos/actions/checkout/tarball/ac593985615ec2ede58e132d2e21d2b1cbd6127c'. Error: Response status code does not indicate success: 503 (Service Unavailable).
2023-01-19T01:39:49.9271645Z ##[warning]Back off 12.226 seconds before retry.
2023-01-19T01:40:06.4066695Z Download action repository 'check-spelling/actions-checkout@v3' (SHA:c12e7286cb39113c32dd06ac576ed748853ee61e)
2023-01-19T01:40:21.0392597Z ##[warning]Failed to download action 'https://api.github.com/repos/check-spelling/actions-checkout/tarball/c12e7286cb39113c32dd06ac576ed748853ee61e'. Error: Response status code does not indicate success: 503 (Service Unavailable).
2023-01-19T01:40:21.0394188Z ##[warning]Back off 21.874 seconds before retry.
2023-01-19T01:41:04.3973267Z ##[warning]Failed to download action 'https://api.github.com/repos/check-spelling/actions-checkout/tarball/c12e7286cb39113c32dd06ac576ed748853ee61e'. Error: Error while copying content to a stream.
2023-01-19T01:41:04.3974824Z ##[warning]Back off 25.092 seconds before retry.
2023-01-19T01:41:36.9646985Z Download action repository 'check-spelling/checkout-merge@prerelease' (SHA:3aa4a3dfa942930fc6d88a77e55f6e0001445cdc)
2023-01-19T01:41:40.4144955Z ##[warning]Failed to download action 'https://api.github.com/repos/check-spelling/checkout-merge/tarball/3aa4a3dfa942930fc6d88a77e55f6e0001445cdc'. Error: Error while copying content to a stream.
2023-01-19T01:41:40.4146405Z ##[warning]Back off 17.261 seconds before retry.
2023-01-19T01:41:58.6494013Z Download action repository 'actions/download-artifact@v3' (SHA:9bc31d5ccc31df68ecc42ccf4149144866c47d8a)
2023-01-19T01:41:59.5964352Z Download action repository 'actions/upload-artifact@v3' (SHA:0b7f8abb1508181956e8e162db84b466c27e18ce)
2023-01-19T01:42:00.3172035Z Download action repository 'github/codeql-action@v2' (SHA:a34ca99b4610d924e04c68db79e503e1f79f9f02)
2023-01-19T01:42:01.2506681Z ##[warning]Failed to download action 'https://api.github.com/repos/github/codeql-action/tarball/a34ca99b4610d924e04c68db79e503e1f79f9f02'. Error: Error while copying content to a stream.
2023-01-19T01:42:01.2507951Z ##[warning]Back off 15.937 seconds before retry.
2023-01-19T01:42:35.0583906Z ##[group]Run check-spelling/check-spelling@prerelease
2023-01-19T01:42:35.0584201Z with:
2023-01-19T01:42:35.0584573Z   suppress_push_for_open_pull_request: 1
2023-01-19T01:42:35.0584802Z   checkout: true
2023-01-19T01:42:35.0584989Z   check_file_names: 1
2023-01-19T01:42:35.0585266Z   spell_check_this: check-spelling/spell-check-this@prerelease
2023-01-19T01:42:35.0585530Z   post_comment: 0
2023-01-19T01:42:35.0585713Z   use_magic_file: 1
2023-01-19T01:42:35.0585931Z   experimental_apply_changes_via_bot: 1
2023-01-19T01:42:35.0586150Z   use_sarif: 1
2023-01-19T01:42:35.0586340Z   extra_dictionary_limit: 20
2023-01-19T01:42:35.0586577Z   check_commit_messages: title description
2023-01-19T01:42:35.0587893Z   extra_dictionaries: cspell:software-terms/src/software-terms.txt cspell:node/node.txt cspell:win32/src/win32.txt cspell:typescript/typescript.txt cspell:aws/aws.txt cspell:npm/npm.txt cspell:html/html.txt cspell:filetypes/filetypes.txt cspell:fullstack/fullstack.txt cspell:django/django.txt cspell:bash/bash-words.txt cspell:lua/lua.txt cspell:rust/rust.txt cspell:ruby/ruby.txt cspell:mnemonics/src/mnemonics.txt cspell:elixir/elixir.txt cspell:css/css.txt cspell:lorem-ipsum/dictionary.txt cspell:docker/src/docker-words.txt cspell:python/src/python/python-lib.txt cspell:python/src/common/extra.txt cspell:python/src/python/python.txt cspell:cpp/src/cpp.txt cspell:cpp/src/compiler-clang-attributes.txt cspell:cpp/src/ecosystem.txt cspell:cpp/src/stdlib-cpp.txt cspell:cpp/src/lang-keywords.txt cspell:cpp/src/lang-jargon.txt cspell:cpp/src/compiler-gcc.txt cspell:cpp/src/compiler-msvc.txt
2023-01-19T01:42:35.0589294Z   GITHUB_TOKEN: ***
2023-01-19T01:42:35.0589508Z   config: .github/actions/spelling
2023-01-19T01:42:35.0589726Z   experimental_path: .
2023-01-19T01:42:35.0590096Z   dictionary_url: https://raw.githubusercontent.com/check-spelling/check-spelling/dictionary-$DICTIONARY_VERSION/dict.txt
2023-01-19T01:42:35.0590459Z   dictionary_version: 20200211
2023-01-19T01:42:35.0590683Z   experimental_parallel_jobs: 2
2023-01-19T01:42:35.0591062Z   dictionary_source_prefixes: {"cspell": "https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/"}
2023-01-19T01:42:35.0591397Z   shortest_word: 3
2023-01-19T01:42:35.0591587Z   largest_file: 1048576
2023-01-19T01:42:35.0591781Z   unknown_word_limit: 5
2023-01-19T01:42:35.0592930Z   warnings: bad-regex,binary-file,deprecated-feature,large-file,limited-references,no-newline-at-eof,noisy-file,non-alpha-in-dictionary,unexpected-line-ending,whitespace-in-dictionary,minified-file,unsupported-configuration
2023-01-19T01:42:35.0594085Z   notices: candidate-pattern
2023-01-19T01:42:35.0594305Z   candidate_example_limit: 3
2023-01-19T01:42:35.0594505Z   summary_table: 1
2023-01-19T01:42:35.0594704Z   ignore-pattern: [^a-zA-Z']
2023-01-19T01:42:35.0594918Z   upper-pattern: [A-Z]
2023-01-19T01:42:35.0595122Z   lower-pattern: [a-z]
2023-01-19T01:42:35.0595326Z   not-lower-pattern: [^a-z]
2023-01-19T01:42:35.0595572Z   not-upper-or-lower-pattern: [^A-Za-z]
2023-01-19T01:42:35.0595818Z   punctuation-pattern: '
2023-01-19T01:42:35.0596179Z ##[endgroup]
2023-01-19T01:42:35.0924461Z ##[group]Run echo "PATH=/home/runner/work/_actions/check-spelling/check-spelling/prerelease/wrappers:$PATH" >> "$GITHUB_ENV"
2023-01-19T01:42:35.0925019Z [36;1mecho "PATH=/home/runner/work/_actions/check-spelling/check-spelling/prerelease/wrappers:$PATH" >> "$GITHUB_ENV"[0m
2023-01-19T01:42:35.0982367Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2023-01-19T01:42:35.0982655Z ##[endgroup]
2023-01-19T01:42:35.1370043Z ##[group]Run secpoll
2023-01-19T01:42:35.1370278Z [36;1msecpoll[0m
2023-01-19T01:42:35.1419802Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2023-01-19T01:42:35.1420073Z env:
2023-01-19T01:42:35.1420772Z   PATH: /home/runner/work/_actions/check-spelling/check-spelling/prerelease/wrappers:/home/runner/.local/bin:/opt/pipx_bin:/home/runner/.cargo/bin:/home/runner/.config/composer/vendor/bin:/usr/local/.ghcup/bin:/home/runner/.dotnet/tools:/snap/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
2023-01-19T01:42:35.1421503Z   THIS_ACTION_PATH: /home/runner/work/_actions/check-spelling/check-spelling/prerelease
2023-01-19T01:42:35.1421846Z   GH_ACTION_REPOSITORY: check-spelling/check-spelling
2023-01-19T01:42:35.1422107Z   GH_ACTION_REF: prerelease
2023-01-19T01:42:35.1422311Z ##[endgroup]
2023-01-19T01:42:35.6370082Z Found ok status for version 0.0.21: 'OK'
2023-01-19T01:42:35.7063192Z ##[group]Run check-spelling/actions-checkout@v3
2023-01-19T01:42:35.7063441Z with:
2023-01-19T01:42:35.7063609Z   path: .
2023-01-19T01:42:35.7063787Z   fetch-depth: 1
2023-01-19T01:42:35.7064123Z   token: ***
2023-01-19T01:42:35.7064330Z   repository: check-spelling/vector
2023-01-19T01:42:35.7064546Z   ssh-strict: true
2023-01-19T01:42:35.7064744Z   persist-credentials: true
2023-01-19T01:42:35.7064946Z   clean: true
2023-01-19T01:42:35.7065116Z   lfs: false
2023-01-19T01:42:35.7065294Z   submodules: false
2023-01-19T01:42:35.7065499Z   set-safe-directory: true
2023-01-19T01:42:35.7065696Z env:
2023-01-19T01:42:35.7066255Z   PATH: /home/runner/work/_actions/check-spelling/check-spelling/prerelease/wrappers:/home/runner/.local/bin:/opt/pipx_bin:/home/runner/.cargo/bin:/home/runner/.config/composer/vendor/bin:/usr/local/.ghcup/bin:/home/runner/.dotnet/tools:/snap/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
2023-01-19T01:42:35.7066827Z   replace_v3_actions_checkout: 1
2023-01-19T01:42:35.7067024Z ##[endgroup]
2023-01-19T01:42:35.9601338Z Syncing repository: check-spelling/vector
2023-01-19T01:42:35.9602998Z ##[group]Getting Git version info
2023-01-19T01:42:35.9603416Z Working directory is '/home/runner/work/vector/vector'
2023-01-19T01:42:35.9603871Z [command]/usr/bin/git version
2023-01-19T01:42:35.9727797Z git version 2.39.0
2023-01-19T01:42:35.9755696Z ##[endgroup]
2023-01-19T01:42:35.9773825Z Temporarily overriding HOME='/home/runner/work/_temp/6eba6c45-9b27-41ad-a3c7-73fe94006be1' before making global git config changes
2023-01-19T01:42:35.9776749Z Adding repository directory to the temporary git global config as a safe directory
2023-01-19T01:42:35.9785539Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/vector/vector
2023-01-19T01:42:35.9843074Z Deleting the contents of '/home/runner/work/vector/vector'
2023-01-19T01:42:35.9855352Z ##[group]Initializing the repository
2023-01-19T01:42:35.9859653Z [command]/usr/bin/git init /home/runner/work/vector/vector
2023-01-19T01:42:35.9926667Z hint: Using 'master' as the name for the initial branch. This default branch name
2023-01-19T01:42:35.9927068Z hint: is subject to change. To configure the initial branch name to use in all
2023-01-19T01:42:35.9927434Z hint: of your new repositories, which will suppress this warning, call:
2023-01-19T01:42:35.9927916Z hint: 
2023-01-19T01:42:35.9928225Z hint: 	git config --global init.defaultBranch <name>
2023-01-19T01:42:35.9928477Z hint: 
2023-01-19T01:42:35.9928800Z hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
2023-01-19T01:42:35.9929225Z hint: 'development'. The just-created branch can be renamed via this command:
2023-01-19T01:42:35.9929483Z hint: 
2023-01-19T01:42:35.9929709Z hint: 	git branch -m <name>
2023-01-19T01:42:35.9940484Z Initialized empty Git repository in /home/runner/work/vector/vector/.git/
2023-01-19T01:42:35.9954265Z [command]/usr/bin/git remote add origin https://github.com/check-spelling/vector
2023-01-19T01:42:35.9995056Z ##[endgroup]
2023-01-19T01:42:35.9995464Z ##[group]Disabling automatic garbage collection
2023-01-19T01:42:36.0001059Z [command]/usr/bin/git config --local gc.auto 0
2023-01-19T01:42:36.0033062Z ##[endgroup]
2023-01-19T01:42:36.0033557Z ##[group]Setting up auth
2023-01-19T01:42:36.0040036Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2023-01-19T01:42:36.0071912Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2023-01-19T01:42:36.0106869Z [command]/usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
2023-01-19T01:42:36.0142206Z ##[endgroup]
2023-01-19T01:42:36.0142819Z ##[group]Fetching the repository
2023-01-19T01:42:36.0151577Z [command]/usr/bin/git -c protocol.version=2 fetch --no-tags --prune --progress --no-recurse-submodules --depth=1 origin +88dd78e5964705f827553eb2971986fffe354611:refs/remotes/origin/spell-check-with-spelling
2023-01-19T01:42:36.3278685Z remote: Enumerating objects: 8189, done.        
2023-01-19T01:42:36.3284050Z remote: Counting objects:   0% (1/8189)        
2023-01-19T01:42:36.3284641Z remote: Counting objects:   1% (82/8189)        
2023-01-19T01:42:36.3286595Z remote: Counting objects:   2% (164/8189)        
2023-01-19T01:42:36.3287893Z remote: Counting objects:   3% (246/8189)        
2023-01-19T01:42:36.3289223Z remote: Counting objects:   4% (328/8189)        
2023-01-19T01:42:36.3291804Z remote: Counting objects:   5% (410/8189)        
2023-01-19T01:42:36.3293341Z remote: Counting objects:   6% (492/8189)        
2023-01-19T01:42:36.3294533Z remote: Counting objects:   7% (574/8189)        
2023-01-19T01:42:36.3295794Z remote: Counting objects:   8% (656/8189)        
2023-01-19T01:42:36.3297056Z remote: Counting objects:   9% (738/8189)        
2023-01-19T01:42:36.3298251Z remote: Counting objects:  10% (819/8189)        
2023-01-19T01:42:36.3299365Z remote: Counting objects:  11% (901/8189)        
2023-01-19T01:42:36.3301592Z remote: Counting objects:  12% (983/8189)        
2023-01-19T01:42:36.3302896Z remote: Counting objects:  13% (1065/8189)        
2023-01-19T01:42:36.3304082Z remote: Counting objects:  14% (1147/8189)        
2023-01-19T01:42:36.3305127Z remote: Counting objects:  15% (1229/8189)        
2023-01-19T01:42:36.3306243Z remote: Counting objects:  16% (1311/8189)        
2023-01-19T01:42:36.3307293Z remote: Counting objects:  17% (1393/8189)        
2023-01-19T01:42:36.3308358Z remote: Counting objects:  18% (1475/8189)        
2023-01-19T01:42:36.3309425Z remote: Counting objects:  19% (1556/8189)        
2023-01-19T01:42:36.3310526Z remote: Counting objects:  20% (1638/8189)        
2023-01-19T01:42:36.3312507Z remote: Counting objects:  21% (1720/8189)        
2023-01-19T01:42:36.3313641Z remote: Counting objects:  22% (1802/8189)        
2023-01-19T01:42:36.3318972Z remote: Counting objects:  23% (1884/8189)        
2023-01-19T01:42:36.3319266Z remote: Counting objects:  24% (1966/8189)        
2023-01-19T01:42:36.3320411Z remote: Counting objects:  25% (2048/8189)        
2023-01-19T01:42:36.3320918Z remote: Counting objects:  26% (2130/8189)        
2023-01-19T01:42:36.3322061Z remote: Counting objects:  27% (2212/8189)        
2023-01-19T01:42:36.3323211Z remote: Counting objects:  28% (2293/8189)        
2023-01-19T01:42:36.3324090Z remote: Counting objects:  29% (2375/8189)        
2023-01-19T01:42:36.3325160Z remote: Counting objects:  30% (2457/8189)        
2023-01-19T01:42:36.3326385Z remote: Counting objects:  31% (2539/8189)        
2023-01-19T01:42:36.3326989Z remote: Counting objects:  32% (2621/8189)        
2023-01-19T01:42:36.3328478Z remote: Counting objects:  33% (2703/8189)        
2023-01-19T01:42:36.3329523Z remote: Counting objects:  34% (2785/8189)        
2023-01-19T01:42:36.3330547Z remote: Counting objects:  35% (2867/8189)        
2023-01-19T01:42:36.3331717Z remote: Counting objects:  36% (2949/8189)        
2023-01-19T01:42:36.3332252Z remote: Counting objects:  37% (3030/8189)        
2023-01-19T01:42:36.3333438Z remote: Counting objects:  38% (3112/8189)        
2023-01-19T01:42:36.3334393Z remote: Counting objects:  39% (3194/8189)        
2023-01-19T01:42:36.3335473Z remote: Counting objects:  40% (3276/8189)        
2023-01-19T01:42:36.3336599Z remote: Counting objects:  41% (3358/8189)        
2023-01-19T01:42:36.3337035Z remote: Counting objects:  42% (3440/8189)        
2023-01-19T01:42:36.3338256Z remote: Counting objects:  43% (3522/8189)        
2023-01-19T01:42:36.3339698Z remote: Counting objects:  44% (3604/8189)        
2023-01-19T01:42:36.3340545Z remote: Counting objects:  45% (3686/8189)        
2023-01-19T01:42:36.3341406Z remote: Counting objects:  46% (3767/8189)        
2023-01-19T01:42:36.3342380Z remote: Counting objects:  47% (3849/8189)        
2023-01-19T01:42:36.3343440Z remote: Counting objects:  48% (3931/8189)        
2023-01-19T01:42:36.3344698Z remote: Counting objects:  49% (4013/8189)        
2023-01-19T01:42:36.3344999Z remote: Counting objects:  50% (4095/8189)        
2023-01-19T01:42:36.3346057Z remote: Counting objects:  51% (4177/8189)        
2023-01-19T01:42:36.3347115Z remote: Counting objects:  52% (4259/8189)        
2023-01-19T01:42:36.3348271Z remote: Counting objects:  53% (4341/8189)        
2023-01-19T01:42:36.3349293Z remote: Counting objects:  54% (4423/8189)        
2023-01-19T01:42:36.3350409Z remote: Counting objects:  55% (4504/8189)        
2023-01-19T01:42:36.3351500Z remote: Counting objects:  56% (4586/8189)        
2023-01-19T01:42:36.3352141Z remote: Counting objects:  57% (4668/8189)        
2023-01-19T01:42:36.3353237Z remote: Counting objects:  58% (4750/8189)        
2023-01-19T01:42:36.3353771Z remote: Counting objects:  59% (4832/8189)        
2023-01-19T01:42:36.3354788Z remote: Counting objects:  60% (4914/8189)        
2023-01-19T01:42:36.3355862Z remote: Counting objects:  61% (4996/8189)        
2023-01-19T01:42:36.3356878Z remote: Counting objects:  62% (5078/8189)        
2023-01-19T01:42:36.3357917Z remote: Counting objects:  63% (5160/8189)        
2023-01-19T01:42:36.3359278Z remote: Counting objects:  64% (5241/8189)        
2023-01-19T01:42:36.3359863Z remote: Counting objects:  65% (5323/8189)        
2023-01-19T01:42:36.3360951Z remote: Counting objects:  66% (5405/8189)        
2023-01-19T01:42:36.3362061Z remote: Counting objects:  67% (5487/8189)        
2023-01-19T01:42:36.3363079Z remote: Counting objects:  68% (5569/8189)        
2023-01-19T01:42:36.3364139Z remote: Counting objects:  69% (5651/8189)        
2023-01-19T01:42:36.3365169Z remote: Counting objects:  70% (5733/8189)        
2023-01-19T01:42:36.3366175Z remote: Counting objects:  71% (5815/8189)        
2023-01-19T01:42:36.3367361Z remote: Counting objects:  72% (5897/8189)        
2023-01-19T01:42:36.3368623Z remote: Counting objects:  73% (5978/8189)        
2023-01-19T01:42:36.3369352Z remote: Counting objects:  74% (6060/8189)        
2023-01-19T01:42:36.3370405Z remote: Counting objects:  75% (6142/8189)        
2023-01-19T01:42:36.3370959Z remote: Counting objects:  76% (6224/8189)        
2023-01-19T01:42:36.3371994Z remote: Counting objects:  77% (6306/8189)        
2023-01-19T01:42:36.3373103Z remote: Counting objects:  78% (6388/8189)        
2023-01-19T01:42:36.3374146Z remote: Counting objects:  79% (6470/8189)        
2023-01-19T01:42:36.3375376Z remote: Counting objects:  80% (6552/8189)        
2023-01-19T01:42:36.3376319Z remote: Counting objects:  81% (6634/8189)        
2023-01-19T01:42:36.3377450Z remote: Counting objects:  82% (6715/8189)        
2023-01-19T01:42:36.3378460Z remote: Counting objects:  83% (6797/8189)        
2023-01-19T01:42:36.3379531Z remote: Counting objects:  84% (6879/8189)        
2023-01-19T01:42:36.3380590Z remote: Counting objects:  85% (6961/8189)        
2023-01-19T01:42:36.3381651Z remote: Counting objects:  86% (7043/8189)        
2023-01-19T01:42:36.3382755Z remote: Counting objects:  87% (7125/8189)        
2023-01-19T01:42:36.3384173Z remote: Counting objects:  88% (7207/8189)        
2023-01-19T01:42:36.3384687Z remote: Counting objects:  89% (7289/8189)        
2023-01-19T01:42:36.3385572Z remote: Counting objects:  90% (7371/8189)        
2023-01-19T01:42:36.3386654Z remote: Counting objects:  91% (7452/8189)        
2023-01-19T01:42:36.3387173Z remote: Counting objects:  92% (7534/8189)        
2023-01-19T01:42:36.3387653Z remote: Counting objects:  93% (7616/8189)        
2023-01-19T01:42:36.3388230Z remote: Counting objects:  94% (7698/8189)        
2023-01-19T01:42:36.3389120Z remote: Counting objects:  95% (7780/8189)        
2023-01-19T01:42:36.3390139Z remote: Counting objects:  96% (7862/8189)        
2023-01-19T01:42:36.3390682Z remote: Counting objects:  97% (7944/8189)        
2023-01-19T01:42:36.3392069Z remote: Counting objects:  98% (8026/8189)        
2023-01-19T01:42:36.3392528Z remote: Counting objects:  99% (8108/8189)        
2023-01-19T01:42:36.3393027Z remote: Counting objects: 100% (8189/8189)        
2023-01-19T01:42:36.3393535Z remote: Counting objects: 100% (8189/8189), done.        
2023-01-19T01:42:36.3452829Z remote: Compressing objects:   0% (1/6213)        
2023-01-19T01:42:36.3594339Z remote: Compressing objects:   1% (63/6213)        
2023-01-19T01:42:36.3891114Z remote: Compressing objects:   2% (125/6213)        
2023-01-19T01:42:36.4125880Z remote: Compressing objects:   3% (187/6213)        
2023-01-19T01:42:36.4333060Z remote: Compressing objects:   4% (249/6213)        
2023-01-19T01:42:36.4583202Z remote: Compressing objects:   5% (311/6213)        
2023-01-19T01:42:36.4959528Z remote: Compressing objects:   6% (373/6213)        
2023-01-19T01:42:36.5309134Z remote: Compressing objects:   7% (435/6213)        
2023-01-19T01:42:36.5592065Z remote: Compressing objects:   8% (498/6213)        
2023-01-19T01:42:36.5830384Z remote: Compressing objects:   9% (560/6213)        
2023-01-19T01:42:36.6002882Z remote: Compressing objects:  10% (622/6213)        
2023-01-19T01:42:36.6231599Z remote: Compressing objects:  11% (684/6213)        
2023-01-19T01:42:36.6495427Z remote: Compressing objects:  12% (746/6213)        
2023-01-19T01:42:36.6796561Z remote: Compressing objects:  13% (808/6213)        
2023-01-19T01:42:36.7032632Z remote: Compressing objects:  14% (870/6213)        
2023-01-19T01:42:36.7220015Z remote: Compressing objects:  15% (932/6213)        
2023-01-19T01:42:36.7431819Z remote: Compressing objects:  16% (995/6213)        
2023-01-19T01:42:36.7681148Z remote: Compressing objects:  17% (1057/6213)        
2023-01-19T01:42:36.7921624Z remote: Compressing objects:  18% (1119/6213)        
2023-01-19T01:42:36.8091530Z remote: Compressing objects:  19% (1181/6213)        
2023-01-19T01:42:36.8158426Z remote: Compressing objects:  20% (1243/6213)        
2023-01-19T01:42:36.8163576Z remote: Compressing objects:  21% (1305/6213)        
2023-01-19T01:42:36.8163981Z remote: Compressing objects:  22% (1367/6213)        
2023-01-19T01:42:36.8164462Z remote: Compressing objects:  23% (1429/6213)        
2023-01-19T01:42:36.8165352Z remote: Compressing objects:  24% (1492/6213)        
2023-01-19T01:42:36.8167905Z remote: Compressing objects:  25% (1554/6213)        
2023-01-19T01:42:36.8168948Z remote: Compressing objects:  26% (1616/6213)        
2023-01-19T01:42:36.8169987Z remote: Compressing objects:  27% (1678/6213)        
2023-01-19T01:42:36.8170375Z remote: Compressing objects:  28% (1740/6213)        
2023-01-19T01:42:36.8170995Z remote: Compressing objects:  29% (1802/6213)        
2023-01-19T01:42:36.8171760Z remote: Compressing objects:  30% (1864/6213)        
2023-01-19T01:42:36.8172510Z remote: Compressing objects:  31% (1927/6213)        
2023-01-19T01:42:36.8173176Z remote: Compressing objects:  32% (1989/6213)        
2023-01-19T01:42:36.8173824Z remote: Compressing objects:  33% (2051/6213)        
2023-01-19T01:42:36.8174565Z remote: Compressing objects:  34% (2113/6213)        
2023-01-19T01:42:36.8175159Z remote: Compressing objects:  35% (2175/6213)        
2023-01-19T01:42:36.8175846Z remote: Compressing objects:  36% (2237/6213)        
2023-01-19T01:42:36.8176564Z remote: Compressing objects:  37% (2299/6213)        
2023-01-19T01:42:36.8177174Z remote: Compressing objects:  38% (2361/6213)        
2023-01-19T01:42:36.8177825Z remote: Compressing objects:  39% (2424/6213)        
2023-01-19T01:42:36.8178487Z remote: Compressing objects:  40% (2486/6213)        
2023-01-19T01:42:36.8179178Z remote: Compressing objects:  41% (2548/6213)        
2023-01-19T01:42:36.8183005Z remote: Compressing objects:  42% (2610/6213)        
2023-01-19T01:42:36.8198774Z remote: Compressing objects:  43% (2672/6213)        
2023-01-19T01:42:36.8202814Z remote: Compressing objects:  44% (2734/6213)        
2023-01-19T01:42:36.8213478Z remote: Compressing objects:  45% (2796/6213)        
2023-01-19T01:42:36.8227401Z remote: Compressing objects:  46% (2858/6213)        
2023-01-19T01:42:36.8253176Z remote: Compressing objects:  47% (2921/6213)        
2023-01-19T01:42:36.8297273Z remote: Compressing objects:  48% (2983/6213)        
2023-01-19T01:42:36.8353423Z remote: Compressing objects:  49% (3045/6213)        
2023-01-19T01:42:36.8403998Z remote: Compressing objects:  50% (3107/6213)        
2023-01-19T01:42:36.8441054Z remote: Compressing objects:  51% (3169/6213)        
2023-01-19T01:42:36.8741966Z remote: Compressing objects:  52% (3231/6213)        
2023-01-19T01:42:36.8742269Z remote: Compressing objects:  53% (3293/6213)        
2023-01-19T01:42:36.8771857Z remote: Compressing objects:  54% (3356/6213)        
2023-01-19T01:42:36.8816413Z remote: Compressing objects:  55% (3418/6213)        
2023-01-19T01:42:36.8869602Z remote: Compressing objects:  56% (3480/6213)        
2023-01-19T01:42:36.8992483Z remote: Compressing objects:  57% (3542/6213)        
2023-01-19T01:42:36.9106722Z remote: Compressing objects:  58% (3604/6213)        
2023-01-19T01:42:36.9157702Z remote: Compressing objects:  59% (3666/6213)        
2023-01-19T01:42:36.9201750Z remote: Compressing objects:  60% (3728/6213)        
2023-01-19T01:42:36.9277219Z remote: Compressing objects:  61% (3790/6213)        
2023-01-19T01:42:36.9373029Z remote: Compressing objects:  62% (3853/6213)        
2023-01-19T01:42:36.9511612Z remote: Compressing objects:  63% (3915/6213)        
2023-01-19T01:42:37.2159019Z remote: Compressing objects:  64% (3977/6213)        
2023-01-19T01:42:37.2207921Z remote: Compressing objects:  65% (4039/6213)        
2023-01-19T01:42:37.2336628Z remote: Compressing objects:  66% (4101/6213)        
2023-01-19T01:42:37.2405323Z remote: Compressing objects:  67% (4163/6213)        
2023-01-19T01:42:37.2554867Z remote: Compressing objects:  68% (4225/6213)        
2023-01-19T01:42:37.2647272Z remote: Compressing objects:  69% (4287/6213)        
2023-01-19T01:42:37.2807731Z remote: Compressing objects:  70% (4350/6213)        
2023-01-19T01:42:37.2912888Z remote: Compressing objects:  71% (4412/6213)        
2023-01-19T01:42:37.2920250Z remote: Compressing objects:  72% (4474/6213)        
2023-01-19T01:42:37.2921255Z remote: Compressing objects:  73% (4536/6213)        
2023-01-19T01:42:37.2922687Z remote: Compressing objects:  74% (4598/6213)        
2023-01-19T01:42:37.2923062Z remote: Compressing objects:  75% (4660/6213)        
2023-01-19T01:42:37.2923714Z remote: Compressing objects:  76% (4722/6213)        
2023-01-19T01:42:37.2924426Z remote: Compressing objects:  77% (4785/6213)        
2023-01-19T01:42:37.2925061Z remote: Compressing objects:  78% (4847/6213)        
2023-01-19T01:42:37.2925677Z remote: Compressing objects:  79% (4909/6213)        
2023-01-19T01:42:37.2926332Z remote: Compressing objects:  80% (4971/6213)        
2023-01-19T01:42:37.2926916Z remote: Compressing objects:  81% (5033/6213)        
2023-01-19T01:42:37.2927666Z remote: Compressing objects:  82% (5095/6213)        
2023-01-19T01:42:37.2928136Z remote: Compressing objects:  83% (5157/6213)        
2023-01-19T01:42:37.2928887Z remote: Compressing objects:  84% (5219/6213)        
2023-01-19T01:42:37.2929374Z remote: Compressing objects:  85% (5282/6213)        
2023-01-19T01:42:37.2930917Z remote: Compressing objects:  86% (5344/6213)        
2023-01-19T01:42:37.2931172Z remote: Compressing objects:  87% (5406/6213)        
2023-01-19T01:42:37.2931413Z remote: Compressing objects:  88% (5468/6213)        
2023-01-19T01:42:37.2931644Z remote: Compressing objects:  89% (5530/6213)        
2023-01-19T01:42:37.2931887Z remote: Compressing objects:  90% (5592/6213)        
2023-01-19T01:42:37.2932125Z remote: Compressing objects:  91% (5654/6213)        
2023-01-19T01:42:37.2938115Z remote: Compressing objects:  92% (5716/6213)        
2023-01-19T01:42:37.2946210Z remote: Compressing objects:  93% (5779/6213)        
2023-01-19T01:42:37.2955692Z remote: Compressing objects:  94% (5841/6213)        
2023-01-19T01:42:37.2962033Z remote: Compressing objects:  95% (5903/6213)        
2023-01-19T01:42:37.2971985Z remote: Compressing objects:  96% (5965/6213)        
2023-01-19T01:42:37.2972414Z remote: Compressing objects:  97% (6027/6213)        
2023-01-19T01:42:37.2980078Z remote: Compressing objects:  98% (6089/6213)        
2023-01-19T01:42:37.2995089Z remote: Compressing objects:  99% (6151/6213)        
2023-01-19T01:42:37.2995567Z remote: Compressing objects: 100% (6213/6213)        
2023-01-19T01:42:37.2996367Z remote: Compressing objects: 100% (6213/6213), done.        
2023-01-19T01:42:37.3636527Z Receiving objects:   0% (1/8189)
2023-01-19T01:42:37.3689117Z Receiving objects:   1% (82/8189)
2023-01-19T01:42:37.3828713Z Receiving objects:   2% (164/8189)
2023-01-19T01:42:37.3895398Z Receiving objects:   3% (246/8189)
2023-01-19T01:42:37.3924657Z Receiving objects:   4% (328/8189)
2023-01-19T01:42:37.3950039Z Receiving objects:   5% (410/8189)
2023-01-19T01:42:37.3974215Z Receiving objects:   6% (492/8189)
2023-01-19T01:42:37.4000981Z Receiving objects:   7% (574/8189)
2023-01-19T01:42:37.4026513Z Receiving objects:   8% (656/8189)
2023-01-19T01:42:37.4050832Z Receiving objects:   9% (738/8189)
2023-01-19T01:42:37.4073379Z Receiving objects:  10% (819/8189)
2023-01-19T01:42:37.4099994Z Receiving objects:  11% (901/8189)
2023-01-19T01:42:37.4120512Z Receiving objects:  12% (983/8189)
2023-01-19T01:42:37.4160407Z Receiving objects:  13% (1065/8189)
2023-01-19T01:42:37.4208780Z Receiving objects:  14% (1147/8189)
2023-01-19T01:42:37.4227129Z Receiving objects:  15% (1229/8189)
2023-01-19T01:42:37.4264396Z Receiving objects:  16% (1311/8189)
2023-01-19T01:42:37.4280476Z Receiving objects:  17% (1393/8189)
2023-01-19T01:42:37.4304069Z Receiving objects:  18% (1475/8189)
2023-01-19T01:42:37.4317147Z Receiving objects:  19% (1556/8189)
2023-01-19T01:42:37.4337139Z Receiving objects:  20% (1638/8189)
2023-01-19T01:42:37.4365131Z Receiving objects:  21% (1720/8189)
2023-01-19T01:42:37.4389985Z Receiving objects:  22% (1802/8189)
2023-01-19T01:42:37.4426558Z Receiving objects:  23% (1884/8189)
2023-01-19T01:42:37.4444261Z Receiving objects:  24% (1966/8189)
2023-01-19T01:42:37.4469547Z Receiving objects:  25% (2048/8189)
2023-01-19T01:42:37.4491031Z Receiving objects:  26% (2130/8189)
2023-01-19T01:42:37.4523659Z Receiving objects:  27% (2212/8189)
2023-01-19T01:42:37.4537441Z Receiving objects:  28% (2293/8189)
2023-01-19T01:42:37.4560401Z Receiving objects:  29% (2375/8189)
2023-01-19T01:42:37.4578669Z Receiving objects:  30% (2457/8189)
2023-01-19T01:42:37.4596878Z Receiving objects:  31% (2539/8189)
2023-01-19T01:42:37.4617002Z Receiving objects:  32% (2621/8189)
2023-01-19T01:42:37.4632550Z Receiving objects:  33% (2703/8189)
2023-01-19T01:42:37.4647132Z Receiving objects:  34% (2785/8189)
2023-01-19T01:42:37.4678640Z Receiving objects:  35% (2867/8189)
2023-01-19T01:42:37.4698502Z Receiving objects:  36% (2949/8189)
2023-01-19T01:42:37.4712733Z Receiving objects:  37% (3030/8189)
2023-01-19T01:42:37.4738078Z Receiving objects:  38% (3112/8189)
2023-01-19T01:42:37.4749311Z Receiving objects:  39% (3194/8189)
2023-01-19T01:42:37.4760438Z Receiving objects:  40% (3276/8189)
2023-01-19T01:42:37.4769492Z Receiving objects:  41% (3358/8189)
2023-01-19T01:42:37.4789025Z Receiving objects:  42% (3440/8189)
2023-01-19T01:42:37.4803165Z Receiving objects:  43% (3522/8189)
2023-01-19T01:42:37.4822921Z Receiving objects:  44% (3604/8189)
2023-01-19T01:42:37.4848469Z Receiving objects:  45% (3686/8189)
2023-01-19T01:42:37.4865911Z Receiving objects:  46% (3767/8189)
2023-01-19T01:42:37.4905281Z Receiving objects:  47% (3849/8189)
2023-01-19T01:42:37.4939261Z Receiving objects:  48% (3931/8189)
2023-01-19T01:42:37.4973905Z Receiving objects:  49% (4013/8189)
2023-01-19T01:42:37.5018100Z Receiving objects:  50% (4095/8189)
2023-01-19T01:42:37.5038897Z Receiving objects:  51% (4177/8189)
2023-01-19T01:42:37.5080100Z Receiving objects:  52% (4259/8189)
2023-01-19T01:42:37.5115777Z Receiving objects:  53% (4341/8189)
2023-01-19T01:42:37.5189152Z Receiving objects:  54% (4423/8189)
2023-01-19T01:42:37.5241254Z Receiving objects:  55% (4504/8189)
2023-01-19T01:42:37.5306401Z Receiving objects:  56% (4586/8189)
2023-01-19T01:42:37.5349167Z Receiving objects:  57% (4668/8189)
2023-01-19T01:42:37.5414426Z Receiving objects:  58% (4750/8189)
2023-01-19T01:42:37.5463684Z Receiving objects:  59% (4832/8189)
2023-01-19T01:42:37.5481063Z Receiving objects:  60% (4914/8189)
2023-01-19T01:42:37.5486434Z Receiving objects:  61% (4996/8189)
2023-01-19T01:42:37.5490923Z Receiving objects:  62% (5078/8189)
2023-01-19T01:42:37.5498470Z Receiving objects:  63% (5160/8189)
2023-01-19T01:42:37.5524088Z Receiving objects:  64% (5241/8189)
2023-01-19T01:42:37.5569703Z Receiving objects:  65% (5323/8189)
2023-01-19T01:42:37.5792389Z Receiving objects:  66% (5405/8189)
2023-01-19T01:42:37.5817710Z Receiving objects:  67% (5487/8189)
2023-01-19T01:42:37.5846644Z Receiving objects:  68% (5569/8189)
2023-01-19T01:42:37.5906707Z Receiving objects:  69% (5651/8189)
2023-01-19T01:42:37.5948385Z Receiving objects:  70% (5733/8189)
2023-01-19T01:42:37.5982452Z Receiving objects:  71% (5815/8189)
2023-01-19T01:42:37.6030682Z Receiving objects:  72% (5897/8189)
2023-01-19T01:42:37.6117230Z Receiving objects:  73% (5978/8189)
2023-01-19T01:42:37.6185392Z Receiving objects:  74% (6060/8189)
2023-01-19T01:42:37.6337896Z Receiving objects:  75% (6142/8189)
2023-01-19T01:42:37.6524690Z Receiving objects:  76% (6224/8189)
2023-01-19T01:42:37.6678709Z Receiving objects:  77% (6306/8189)
2023-01-19T01:42:37.6751703Z Receiving objects:  78% (6388/8189)
2023-01-19T01:42:37.6790928Z Receiving objects:  79% (6470/8189)
2023-01-19T01:42:37.6801781Z Receiving objects:  80% (6552/8189)
2023-01-19T01:42:37.6814329Z Receiving objects:  81% (6634/8189)
2023-01-19T01:42:37.6938589Z Receiving objects:  82% (6715/8189)
2023-01-19T01:42:37.6953486Z Receiving objects:  83% (6797/8189)
2023-01-19T01:42:37.6995749Z Receiving objects:  84% (6879/8189)
2023-01-19T01:42:37.7070701Z Receiving objects:  85% (6961/8189)
2023-01-19T01:42:37.7144494Z Receiving objects:  86% (7043/8189)
2023-01-19T01:42:37.7162907Z Receiving objects:  87% (7125/8189)
2023-01-19T01:42:37.7244599Z Receiving objects:  88% (7207/8189)
2023-01-19T01:42:37.7353411Z Receiving objects:  89% (7289/8189)
2023-01-19T01:42:37.7503097Z Receiving objects:  90% (7371/8189)
2023-01-19T01:42:37.8209542Z Receiving objects:  91% (7452/8189)
2023-01-19T01:42:37.8436735Z Receiving objects:  92% (7534/8189), 9.08 MiB | 18.05 MiB/s
2023-01-19T01:42:37.8462730Z Receiving objects:  93% (7616/8189), 9.08 MiB | 18.05 MiB/s
2023-01-19T01:42:37.8488554Z Receiving objects:  94% (7698/8189), 9.08 MiB | 18.05 MiB/s
2023-01-19T01:42:37.8522148Z Receiving objects:  95% (7780/8189), 9.08 MiB | 18.05 MiB/s
2023-01-19T01:42:37.8555870Z Receiving objects:  96% (7862/8189), 9.08 MiB | 18.05 MiB/s
2023-01-19T01:42:37.8578081Z Receiving objects:  97% (7944/8189), 9.08 MiB | 18.05 MiB/s
2023-01-19T01:42:37.9673693Z Receiving objects:  98% (8026/8189), 9.08 MiB | 18.05 MiB/s
2023-01-19T01:42:38.0299896Z Receiving objects:  99% (8108/8189), 9.08 MiB | 18.05 MiB/s
2023-01-19T01:42:38.0300741Z remote: Total 8189 (delta 600), reused 5866 (delta 430), pack-reused 0        
2023-01-19T01:42:38.0322259Z Receiving objects: 100% (8189/8189), 9.08 MiB | 18.05 MiB/s
2023-01-19T01:42:38.0322764Z Receiving objects: 100% (8189/8189), 17.76 MiB | 24.41 MiB/s, done.
2023-01-19T01:42:38.0329570Z Resolving deltas:   0% (0/600)
2023-01-19T01:42:38.0331221Z Resolving deltas:   1% (6/600)
2023-01-19T01:42:38.0333596Z Resolving deltas:   2% (12/600)
2023-01-19T01:42:38.0336501Z Resolving deltas:   3% (19/600)
2023-01-19T01:42:38.0340311Z Resolving deltas:   4% (24/600)
2023-01-19T01:42:38.0354141Z Resolving deltas:   5% (30/600)
2023-01-19T01:42:38.0358608Z Resolving deltas:   6% (36/600)
2023-01-19T01:42:38.0364151Z Resolving deltas:   7% (42/600)
2023-01-19T01:42:38.0366891Z Resolving deltas:   8% (48/600)
2023-01-19T01:42:38.0374529Z Resolving deltas:   9% (54/600)
2023-01-19T01:42:38.0376932Z Resolving deltas:  10% (60/600)
2023-01-19T01:42:38.0383268Z Resolving deltas:  11% (66/600)
2023-01-19T01:42:38.0384998Z Resolving deltas:  12% (72/600)
2023-01-19T01:42:38.0387569Z Resolving deltas:  13% (78/600)
2023-01-19T01:42:38.0389735Z Resolving deltas:  14% (84/600)
2023-01-19T01:42:38.0391622Z Resolving deltas:  15% (90/600)
2023-01-19T01:42:38.0393734Z Resolving deltas:  16% (96/600)
2023-01-19T01:42:38.0396122Z Resolving deltas:  17% (102/600)
2023-01-19T01:42:38.0400053Z Resolving deltas:  18% (108/600)
2023-01-19T01:42:38.0403224Z Resolving deltas:  19% (114/600)
2023-01-19T01:42:38.0406397Z Resolving deltas:  20% (120/600)
2023-01-19T01:42:38.0411397Z Resolving deltas:  21% (126/600)
2023-01-19T01:42:38.0414675Z Resolving deltas:  22% (132/600)
2023-01-19T01:42:38.0420479Z Resolving deltas:  23% (138/600)
2023-01-19T01:42:38.0424255Z Resolving deltas:  24% (144/600)
2023-01-19T01:42:38.0425907Z Resolving deltas:  25% (150/600)
2023-01-19T01:42:38.0427343Z Resolving deltas:  26% (156/600)
2023-01-19T01:42:38.0428783Z Resolving deltas:  27% (162/600)
2023-01-19T01:42:38.0430510Z Resolving deltas:  28% (168/600)
2023-01-19T01:42:38.0433100Z Resolving deltas:  29% (174/600)
2023-01-19T01:42:38.0433609Z Resolving deltas:  30% (180/600)
2023-01-19T01:42:38.0436080Z Resolving deltas:  31% (186/600)
2023-01-19T01:42:38.0437621Z Resolving deltas:  32% (192/600)
2023-01-19T01:42:38.0439268Z Resolving deltas:  33% (198/600)
2023-01-19T01:42:38.0440665Z Resolving deltas:  34% (204/600)
2023-01-19T01:42:38.0441217Z Resolving deltas:  35% (210/600)
2023-01-19T01:42:38.0443458Z Resolving deltas:  36% (216/600)
2023-01-19T01:42:38.0443831Z Resolving deltas:  37% (222/600)
2023-01-19T01:42:38.0448214Z Resolving deltas:  38% (228/600)
2023-01-19T01:42:38.0451126Z Resolving deltas:  39% (234/600)
2023-01-19T01:42:38.0453991Z Resolving deltas:  40% (240/600)
2023-01-19T01:42:38.0454578Z Resolving deltas:  41% (247/600)
2023-01-19T01:42:38.0456192Z Resolving deltas:  42% (252/600)
2023-01-19T01:42:38.0459203Z Resolving deltas:  43% (258/600)
2023-01-19T01:42:38.0462361Z Resolving deltas:  44% (264/600)
2023-01-19T01:42:38.0464142Z Resolving deltas:  45% (270/600)
2023-01-19T01:42:38.0465665Z Resolving deltas:  46% (276/600)
2023-01-19T01:42:38.0468383Z Resolving deltas:  47% (282/600)
2023-01-19T01:42:38.0470617Z Resolving deltas:  48% (288/600)
2023-01-19T01:42:38.0473483Z Resolving deltas:  49% (294/600)
2023-01-19T01:42:38.0476734Z Resolving deltas:  50% (300/600)
2023-01-19T01:42:38.0480772Z Resolving deltas:  51% (306/600)
2023-01-19T01:42:38.0489190Z Resolving deltas:  52% (312/600)
2023-01-19T01:42:38.0496176Z Resolving deltas:  53% (318/600)
2023-01-19T01:42:38.0505293Z Resolving deltas:  54% (324/600)
2023-01-19T01:42:38.0509801Z Resolving deltas:  55% (330/600)
2023-01-19T01:42:38.0510351Z Resolving deltas:  56% (336/600)
2023-01-19T01:42:38.0515022Z Resolving deltas:  57% (342/600)
2023-01-19T01:42:38.0517711Z Resolving deltas:  58% (348/600)
2023-01-19T01:42:38.0523360Z Resolving deltas:  59% (354/600)
2023-01-19T01:42:38.0525872Z Resolving deltas:  60% (360/600)
2023-01-19T01:42:38.0528438Z Resolving deltas:  61% (366/600)
2023-01-19T01:42:38.0531195Z Resolving deltas:  62% (372/600)
2023-01-19T01:42:38.0533841Z Resolving deltas:  63% (378/600)
2023-01-19T01:42:38.0534395Z Resolving deltas:  64% (384/600)
2023-01-19T01:42:38.0536367Z Resolving deltas:  65% (390/600)
2023-01-19T01:42:38.0536932Z Resolving deltas:  66% (396/600)
2023-01-19T01:42:38.0538763Z Resolving deltas:  67% (402/600)
2023-01-19T01:42:38.0539206Z Resolving deltas:  68% (408/600)
2023-01-19T01:42:38.0539411Z Resolving deltas:  69% (414/600)
2023-01-19T01:42:38.0541065Z Resolving deltas:  70% (420/600)
2023-01-19T01:42:38.0542877Z Resolving deltas:  71% (426/600)
2023-01-19T01:42:38.0545200Z Resolving deltas:  72% (432/600)
2023-01-19T01:42:38.0547540Z Resolving deltas:  73% (438/600)
2023-01-19T01:42:38.0550300Z Resolving deltas:  74% (444/600)
2023-01-19T01:42:38.0553863Z Resolving deltas:  75% (450/600)
2023-01-19T01:42:38.0558236Z Resolving deltas:  76% (456/600)
2023-01-19T01:42:38.0564479Z Resolving deltas:  77% (462/600)
2023-01-19T01:42:38.0568853Z Resolving deltas:  78% (468/600)
2023-01-19T01:42:38.0571744Z Resolving deltas:  79% (474/600)
2023-01-19T01:42:38.0574764Z Resolving deltas:  80% (480/600)
2023-01-19T01:42:38.0580904Z Resolving deltas:  81% (486/600)
2023-01-19T01:42:38.0587494Z Resolving deltas:  82% (492/600)
2023-01-19T01:42:38.0591874Z Resolving deltas:  83% (498/600)
2023-01-19T01:42:38.0595852Z Resolving deltas:  84% (504/600)
2023-01-19T01:42:38.0600991Z Resolving deltas:  85% (510/600)
2023-01-19T01:42:38.0603437Z Resolving deltas:  86% (516/600)
2023-01-19T01:42:38.0606016Z Resolving deltas:  87% (522/600)
2023-01-19T01:42:38.0622973Z Resolving deltas:  88% (528/600)
2023-01-19T01:42:38.0664099Z Resolving deltas:  89% (534/600)
2023-01-19T01:42:38.0692592Z Resolving deltas:  90% (540/600)
2023-01-19T01:42:38.0724259Z Resolving deltas:  91% (546/600)
2023-01-19T01:42:38.0736938Z Resolving deltas:  92% (552/600)
2023-01-19T01:42:38.0739043Z Resolving deltas:  93% (558/600)
2023-01-19T01:42:38.0741154Z Resolving deltas:  94% (564/600)
2023-01-19T01:42:38.0743309Z Resolving deltas:  95% (570/600)
2023-01-19T01:42:38.0745693Z Resolving deltas:  96% (576/600)
2023-01-19T01:42:38.0747613Z Resolving deltas:  97% (582/600)
2023-01-19T01:42:38.0749947Z Resolving deltas:  98% (589/600)
2023-01-19T01:42:38.0752889Z Resolving deltas:  99% (594/600)
2023-01-19T01:42:38.0783226Z Resolving deltas: 100% (600/600)
2023-01-19T01:42:38.0783553Z Resolving deltas: 100% (600/600), done.
2023-01-19T01:42:38.1138422Z From https://github.com/check-spelling/vector
2023-01-19T01:42:38.1139154Z  * [new ref]         88dd78e5964705f827553eb2971986fffe354611 -> origin/spell-check-with-spelling
2023-01-19T01:42:38.1170389Z ##[endgroup]
2023-01-19T01:42:38.1170952Z ##[group]Determining the checkout info
2023-01-19T01:42:38.1171536Z ##[endgroup]
2023-01-19T01:42:38.1174134Z ##[group]Checking out the ref
2023-01-19T01:42:38.1175099Z [command]/usr/bin/git checkout --progress --force -B spell-check-with-spelling refs/remotes/origin/spell-check-with-spelling
2023-01-19T01:42:38.5805447Z Switched to a new branch 'spell-check-with-spelling'
2023-01-19T01:42:38.5810363Z branch 'spell-check-with-spelling' set up to track 'origin/spell-check-with-spelling'.
2023-01-19T01:42:38.5835564Z ##[endgroup]
2023-01-19T01:42:38.5869044Z [command]/usr/bin/git log -1 --format='%H'
2023-01-19T01:42:38.5899305Z '88dd78e5964705f827553eb2971986fffe354611'
2023-01-19T01:42:38.6107661Z ##[group]Run unknown-words
2023-01-19T01:42:38.6107893Z [36;1munknown-words[0m
2023-01-19T01:42:38.6159843Z shell: /usr/bin/bash --noprofile --norc -e -o pipefail {0}
2023-01-19T01:42:38.6160090Z env:
2023-01-19T01:42:38.6160657Z   PATH: /home/runner/work/_actions/check-spelling/check-spelling/prerelease/wrappers:/home/runner/.local/bin:/opt/pipx_bin:/home/runner/.cargo/bin:/home/runner/.config/composer/vendor/bin:/usr/local/.ghcup/bin:/home/runner/.dotnet/tools:/snap/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
2023-01-19T01:42:38.6161213Z   replace_v3_actions_checkout: 1
2023-01-19T01:42:38.6165626Z   INPUTS: {
  "suppress_push_for_open_pull_request": "1",
  "checkout": "true",
  "check_file_names": "1",
  "spell_check_this": "check-spelling/spell-check-this@prerelease",
  "post_comment": "0",
  "use_magic_file": "1",
  "experimental_apply_changes_via_bot": "1",
  "use_sarif": "1",
  "extra_dictionary_limit": "20",
  "check_commit_messages": "title description",
  "extra_dictionaries": "cspell:software-terms/src/software-terms.txt cspell:node/node.txt cspell:win32/src/win32.txt cspell:typescript/typescript.txt cspell:aws/aws.txt cspell:npm/npm.txt cspell:html/html.txt cspell:filetypes/filetypes.txt cspell:fullstack/fullstack.txt cspell:django/django.txt cspell:bash/bash-words.txt cspell:lua/lua.txt cspell:rust/rust.txt cspell:ruby/ruby.txt cspell:mnemonics/src/mnemonics.txt cspell:elixir/elixir.txt cspell:css/css.txt cspell:lorem-ipsum/dictionary.txt cspell:docker/src/docker-words.txt cspell:python/src/python/python-lib.txt cspell:python/src/common/extra.txt cspell:python/src/python/python.txt cspell:cpp/src/cpp.txt cspell:cpp/src/compiler-clang-attributes.txt cspell:cpp/src/ecosystem.txt cspell:cpp/src/stdlib-cpp.txt cspell:cpp/src/lang-keywords.txt cspell:cpp/src/lang-jargon.txt cspell:cpp/src/compiler-gcc.txt cspell:cpp/src/compiler-msvc.txt",
  "check_extra_dictionaries": "",
  "GITHUB_TOKEN": "***",
  "bucket": "",
  "project": "",
  "config": ".github/actions/spelling",
  "experimental_path": ".",
  "dictionary_url": "https://raw.githubusercontent.com/check-spelling/check-spelling/dictionary-$DICTIONARY_VERSION/dict.txt",
  "dictionary_version": "20200211",
  "debug": "",
  "experimental_parallel_jobs": "2",
  "capture_output_unknown_words": "",
  "capture_output_stale_words": "",
  "capture_output_skipped_files": "",
  "dictionary_source_prefixes": "{\"cspell\": \"https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/\"}",
  "event_aliases": "",
  "shortest_word": "3",
  "longest_word": "",
  "experimental_commit_note": "",
  "report_title_suffix": "",
  "only_check_changed_files": "",
  "custom_task": "",
  "internal_state_directory": "",
  "anonymize_secpoll_source": "",
  "ignore_security_advisory": "",
  "largest_file": "1048576",
  "unknown_word_limit": "5",
  "warnings": "bad-regex,binary-file,deprecated-feature,large-file,limited-references,no-newline-at-eof,noisy-file,non-alpha-in-dictionary,unexpected-line-ending,whitespace-in-dictionary,minified-file,unsupported-configuration",
  "notices": "candidate-pattern",
  "quit_without_error": "",
  "ssh_key": "",
  "task": "",
  "disable_checks": "",
  "alternate_engine": "",
  "alternate_engine_key": "",
  "caller_container": "",
  "candidate_example_limit": "3",
  "summary_table": "1",
  "ignore-pattern": "[^a-zA-Z']",
  "upper-pattern": "[A-Z]",
  "lower-pattern": "[a-z]",
  "not-lower-pattern": "[^a-z]",
  "not-upper-or-lower-pattern": "[^A-Za-z]",
  "punctuation-pattern": "'"
}
2023-01-19T01:42:38.6169939Z   DEBUG: 
2023-01-19T01:42:38.6170227Z   THIS_ACTION_PATH: /home/runner/work/_actions/check-spelling/check-spelling/prerelease
2023-01-19T01:42:38.6170572Z   GH_ACTION_REPOSITORY: check-spelling/check-spelling
2023-01-19T01:42:38.6170826Z   GH_ACTION_REF: prerelease
2023-01-19T01:42:38.6171027Z ##[endgroup]
2023-01-19T01:42:51.2214545Z Installed: libhash-merge-perl
2023-01-19T01:42:53.8320011Z Retrieving expect from .github/actions/spelling/expect.txt
2023-01-19T01:42:54.0513204Z Retrieving excludes from .github/actions/spelling/excludes.txt
2023-01-19T01:42:59.7226998Z Downloaded https://raw.githubusercontent.com/check-spelling/check-spelling/dictionary-20200211/dict.txt (to /tmp/tmp.OuGxCUZW6Q)
2023-01-19T01:42:59.7227531Z (...Extra dictionaries...)
2023-01-19T01:43:29.0469760Z ##[error]Failed to retrieve cspell:software-terms/src/software-terms.txt -- https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/software-terms/src/software-terms.txt (dictionary-not-found)
2023-01-19T01:43:29.0470849Z HTTP/2 503 
2023-01-19T01:43:29.0471054Z server: Varnish
2023-01-19T01:43:29.0471369Z retry-after: 0
2023-01-19T01:43:29.0471645Z content-type: text/html; charset=utf-8
2023-01-19T01:43:29.0471917Z accept-ranges: bytes
2023-01-19T01:43:29.0472128Z date: Thu, 19 Jan 2023 01:43:29 GMT
2023-01-19T01:43:29.0472347Z via: 1.1 varnish
2023-01-19T01:43:29.0472629Z x-served-by: cache-iad-kiad7000059-IAD
2023-01-19T01:43:29.0472880Z x-cache: MISS
2023-01-19T01:43:29.0473092Z x-cache-hits: 0
2023-01-19T01:43:29.0473357Z x-timer: S1674092580.850247,VS0,VE29178
2023-01-19T01:43:29.0473645Z access-control-allow-origin: *
2023-01-19T01:43:29.0474007Z x-fastly-request-id: b56b160b2a371fd76c06910c6f73305d0c24172c
2023-01-19T01:43:29.0474458Z expires: Thu, 19 Jan 2023 01:48:29 GMT
2023-01-19T01:43:29.0474767Z vary: Authorization,Accept-Encoding
2023-01-19T01:43:29.0475035Z content-length: 451
2023-01-19T01:43:29.0475249Z 
2023-01-19T01:43:44.2711852Z ##[error]Failed to retrieve cspell:node/node.txt -- https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/node/node.txt (dictionary-not-found)
2023-01-19T01:43:44.2725530Z HTTP/2 503 
2023-01-19T01:43:44.2726114Z server: Varnish
2023-01-19T01:43:44.2726508Z retry-after: 0
2023-01-19T01:43:44.2726803Z content-type: text/html; charset=utf-8
2023-01-19T01:43:44.2727086Z accept-ranges: bytes
2023-01-19T01:43:44.2728142Z date: Thu, 19 Jan 2023 01:43:44 GMT
2023-01-19T01:43:44.2728351Z via: 1.1 varnish
2023-01-19T01:43:44.2728648Z x-served-by: cache-iad-kiad7000112-IAD
2023-01-19T01:43:44.2728893Z x-cache: MISS
2023-01-19T01:43:44.2729112Z x-cache-hits: 0
2023-01-19T01:43:44.2729370Z x-timer: S1674092609.140908,VS0,VE15099
2023-01-19T01:43:44.2729649Z access-control-allow-origin: *
2023-01-19T01:43:44.2730056Z x-fastly-request-id: a6ebed26a512955066fcc55f8b5e4222df772242
2023-01-19T01:43:44.2730335Z expires: Thu, 19 Jan 2023 01:48:44 GMT
2023-01-19T01:43:44.2730642Z vary: Authorization,Accept-Encoding
2023-01-19T01:43:44.2730906Z content-length: 452
2023-01-19T01:43:44.2731039Z 
2023-01-19T01:44:03.1866893Z ##[error]Failed to retrieve cspell:aws/aws.txt -- https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/aws/aws.txt (dictionary-not-found)
2023-01-19T01:44:03.1879487Z HTTP/2 503 
2023-01-19T01:44:03.1879726Z server: Varnish
2023-01-19T01:44:03.1880049Z retry-after: 0
2023-01-19T01:44:03.1880318Z content-type: text/html; charset=utf-8
2023-01-19T01:44:03.1880590Z accept-ranges: bytes
2023-01-19T01:44:03.1880812Z date: Thu, 19 Jan 2023 01:44:03 GMT
2023-01-19T01:44:03.1881010Z via: 1.1 varnish
2023-01-19T01:44:03.1881294Z x-served-by: cache-iad-kiad7000027-IAD
2023-01-19T01:44:03.1881550Z x-cache: MISS
2023-01-19T01:44:03.1881772Z x-cache-hits: 0
2023-01-19T01:44:03.1882041Z x-timer: S1674092632.149919,VS0,VE11024
2023-01-19T01:44:03.1882328Z access-control-allow-origin: *
2023-01-19T01:44:03.1882723Z x-fastly-request-id: 2345ee5fe2d5de004d5cf1a06e994bcb6700dc38
2023-01-19T01:44:03.1882995Z expires: Thu, 19 Jan 2023 01:49:03 GMT
2023-01-19T01:44:03.1883290Z vary: Authorization,Accept-Encoding
2023-01-19T01:44:03.1883566Z content-length: 452
2023-01-19T01:44:03.1883694Z 
2023-01-19T01:44:06.7403159Z ##[error]Failed to retrieve cspell:html/html.txt -- https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/html/html.txt (dictionary-not-found)
2023-01-19T01:44:06.7417403Z HTTP/2 502 
2023-01-19T01:44:06.7418173Z cache-control: no-cache
2023-01-19T01:44:06.7418647Z content-type: text/html; charset=utf-8
2023-01-19T01:44:06.7418989Z strict-transport-security: max-age=31536000
2023-01-19T01:44:06.7419316Z x-content-type-options: nosniff
2023-01-19T01:44:06.7420985Z x-frame-options: deny
2023-01-19T01:44:06.7421499Z x-xss-protection: 0
2023-01-19T01:44:06.7422133Z content-security-policy: default-src 'none'; style-src 'unsafe-inline'; img-src data:;
2023-01-19T01:44:06.7422690Z accept-ranges: bytes
2023-01-19T01:44:06.7422924Z date: Thu, 19 Jan 2023 01:44:06 GMT
2023-01-19T01:44:06.7481650Z via: 1.1 varnish
2023-01-19T01:44:06.7482635Z x-served-by: cache-iad-kiad7000059-IAD
2023-01-19T01:44:06.7482951Z x-cache: MISS
2023-01-19T01:44:06.7483184Z x-cache-hits: 0
2023-01-19T01:44:06.7483476Z x-timer: S1674092646.845610,VS0,VE864
2023-01-19T01:44:06.7483755Z access-control-allow-origin: *
2023-01-19T01:44:06.7484119Z x-fastly-request-id: 34f7718c561e6022697f88c4428e0219013c0df4
2023-01-19T01:44:06.7484396Z expires: Thu, 19 Jan 2023 01:49:06 GMT
2023-01-19T01:44:06.7484686Z vary: Authorization,Accept-Encoding
2023-01-19T01:44:06.7484851Z 
2023-01-19T01:44:14.3287640Z ##[error]Failed to retrieve cspell:django/django.txt -- https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/django/django.txt (dictionary-not-found)
2023-01-19T01:44:14.3297704Z HTTP/2 503 
2023-01-19T01:44:14.3297957Z server: Varnish
2023-01-19T01:44:14.3298262Z retry-after: 0
2023-01-19T01:44:14.3299828Z content-type: text/html; charset=utf-8
2023-01-19T01:44:14.3300095Z accept-ranges: bytes
2023-01-19T01:44:14.3300315Z date: Thu, 19 Jan 2023 01:44:14 GMT
2023-01-19T01:44:14.3300522Z via: 1.1 varnish
2023-01-19T01:44:14.3300797Z x-served-by: cache-iad-kiad7000143-IAD
2023-01-19T01:44:14.3301051Z x-cache: MISS
2023-01-19T01:44:14.3301270Z x-cache-hits: 0
2023-01-19T01:44:14.3301524Z x-timer: S1674092653.223045,VS0,VE1093
2023-01-19T01:44:14.3301815Z access-control-allow-origin: *
2023-01-19T01:44:14.3302189Z x-fastly-request-id: 1bc40512b60b27d21067cd57467c52ea14b297f1
2023-01-19T01:44:14.3302466Z expires: Thu, 19 Jan 2023 01:49:14 GMT
2023-01-19T01:44:14.3302752Z vary: Authorization,Accept-Encoding
2023-01-19T01:44:14.3303022Z content-length: 452
2023-01-19T01:44:14.3303152Z 
2023-01-19T01:44:33.8012284Z ##[error]Failed to retrieve cspell:lua/lua.txt -- https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/lua/lua.txt (dictionary-not-found)
2023-01-19T01:44:33.8023878Z HTTP/2 503 
2023-01-19T01:44:33.8024097Z server: Varnish
2023-01-19T01:44:33.8024421Z retry-after: 0
2023-01-19T01:44:33.8024700Z content-type: text/html; charset=utf-8
2023-01-19T01:44:33.8024976Z accept-ranges: bytes
2023-01-19T01:44:33.8025193Z date: Thu, 19 Jan 2023 01:44:33 GMT
2023-01-19T01:44:33.8025401Z via: 1.1 varnish
2023-01-19T01:44:33.8025678Z x-served-by: cache-iad-kiad7000162-IAD
2023-01-19T01:44:33.8025926Z x-cache: MISS
2023-01-19T01:44:33.8026145Z x-cache-hits: 0
2023-01-19T01:44:33.8026405Z x-timer: S1674092659.774916,VS0,VE15014
2023-01-19T01:44:33.8026683Z access-control-allow-origin: *
2023-01-19T01:44:33.8027061Z x-fastly-request-id: 6e5f1636be6d14bcc6b21886d69762b4f1c948db
2023-01-19T01:44:33.8027337Z expires: Thu, 19 Jan 2023 01:49:33 GMT
2023-01-19T01:44:33.8027621Z vary: Authorization,Accept-Encoding
2023-01-19T01:44:33.8027899Z content-length: 452
2023-01-19T01:44:33.8028031Z 
2023-01-19T01:44:43.5347901Z ##[error]Failed to retrieve cspell:rust/rust.txt -- https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/rust/rust.txt (dictionary-not-found)
2023-01-19T01:44:43.5358228Z HTTP/2 503 
2023-01-19T01:44:43.5358679Z server: Varnish
2023-01-19T01:44:43.5359242Z retry-after: 0
2023-01-19T01:44:43.5409932Z content-type: text/html; charset=utf-8
2023-01-19T01:44:43.5410236Z accept-ranges: bytes
2023-01-19T01:44:43.5410458Z date: Thu, 19 Jan 2023 01:44:43 GMT
2023-01-19T01:44:43.5410665Z via: 1.1 varnish
2023-01-19T01:44:43.5410936Z x-served-by: cache-iad-kiad7000059-IAD
2023-01-19T01:44:43.5411196Z x-cache: MISS
2023-01-19T01:44:43.5411417Z x-cache-hits: 0
2023-01-19T01:44:43.5411669Z x-timer: S1674092674.899796,VS0,VE9622
2023-01-19T01:44:43.5411955Z access-control-allow-origin: *
2023-01-19T01:44:43.5412325Z x-fastly-request-id: 5a225b63d3ebe616e01328091b3c4199cf836adc
2023-01-19T01:44:43.5412608Z expires: Thu, 19 Jan 2023 01:49:43 GMT
2023-01-19T01:44:43.5412906Z vary: Authorization,Accept-Encoding
2023-01-19T01:44:43.5413178Z content-length: 451
2023-01-19T01:44:43.5413317Z 
2023-01-19T01:44:59.0151181Z ##[error]Failed to retrieve cspell:mnemonics/src/mnemonics.txt -- https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/mnemonics/src/mnemonics.txt (dictionary-not-found)
2023-01-19T01:44:59.0162525Z HTTP/2 503 
2023-01-19T01:44:59.0162755Z server: Varnish
2023-01-19T01:44:59.0163077Z retry-after: 0
2023-01-19T01:44:59.0163355Z content-type: text/html; charset=utf-8
2023-01-19T01:44:59.0163629Z accept-ranges: bytes
2023-01-19T01:44:59.0163849Z date: Thu, 19 Jan 2023 01:44:59 GMT
2023-01-19T01:44:59.0164046Z via: 1.1 varnish
2023-01-19T01:44:59.0164327Z x-served-by: cache-iad-kiad7000143-IAD
2023-01-19T01:44:59.0164585Z x-cache: MISS
2023-01-19T01:44:59.0164796Z x-cache-hits: 0
2023-01-19T01:44:59.0165058Z x-timer: S1674092684.845293,VS0,VE15157
2023-01-19T01:44:59.0165527Z access-control-allow-origin: *
2023-01-19T01:44:59.0165910Z x-fastly-request-id: 91906e8acef121dfe4d9eabe2ab7ecde6834f230
2023-01-19T01:44:59.0166295Z expires: Thu, 19 Jan 2023 01:49:59 GMT
2023-01-19T01:44:59.0166594Z vary: Authorization,Accept-Encoding
2023-01-19T01:44:59.0166871Z content-length: 452
2023-01-19T01:44:59.0166993Z 
2023-01-19T01:45:02.0793454Z ##[error]Failed to retrieve cspell:elixir/elixir.txt -- https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/elixir/elixir.txt (dictionary-not-found)
2023-01-19T01:45:02.0807901Z HTTP/2 503 
2023-01-19T01:45:02.0808533Z server: Varnish
2023-01-19T01:45:02.0808897Z retry-after: 0
2023-01-19T01:45:02.0809178Z content-type: text/html; charset=utf-8
2023-01-19T01:45:02.0809466Z accept-ranges: bytes
2023-01-19T01:45:02.0809689Z date: Thu, 19 Jan 2023 01:45:02 GMT
2023-01-19T01:45:02.0809889Z via: 1.1 varnish
2023-01-19T01:45:02.0810183Z x-served-by: cache-iad-kiad7000059-IAD
2023-01-19T01:45:02.0810456Z x-cache: MISS
2023-01-19T01:45:02.0810693Z x-cache-hits: 0
2023-01-19T01:45:02.0810943Z x-timer: S1674092699.114100,VS0,VE2952
2023-01-19T01:45:02.0811233Z access-control-allow-origin: *
2023-01-19T01:45:02.0811621Z x-fastly-request-id: f6b5a82e722e94ef5853509c078ba41940bb2d24
2023-01-19T01:45:02.0811884Z expires: Thu, 19 Jan 2023 01:50:02 GMT
2023-01-19T01:45:02.0812178Z vary: Authorization,Accept-Encoding
2023-01-19T01:45:02.0812446Z content-length: 452
2023-01-19T01:45:02.0812575Z 
2023-01-19T01:45:03.6369287Z ##[error]Failed to retrieve cspell:css/css.txt -- https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/css/css.txt (dictionary-not-found)
2023-01-19T01:45:03.6383390Z HTTP/2 502 
2023-01-19T01:45:03.6383872Z cache-control: no-cache
2023-01-19T01:45:03.6384262Z content-type: text/html; charset=utf-8
2023-01-19T01:45:03.6384690Z strict-transport-security: max-age=31536000
2023-01-19T01:45:03.6385105Z x-content-type-options: nosniff
2023-01-19T01:45:03.6385462Z x-frame-options: deny
2023-01-19T01:45:03.6385821Z x-xss-protection: 0
2023-01-19T01:45:03.6386344Z content-security-policy: default-src 'none'; style-src 'unsafe-inline'; img-src data:;
2023-01-19T01:45:03.6386778Z accept-ranges: bytes
2023-01-19T01:45:03.6387068Z date: Thu, 19 Jan 2023 01:45:03 GMT
2023-01-19T01:45:03.6387349Z via: 1.1 varnish
2023-01-19T01:45:03.6387702Z x-served-by: cache-iad-kiad7000162-IAD
2023-01-19T01:45:03.6388039Z x-cache: MISS
2023-01-19T01:45:03.6388331Z x-cache-hits: 0
2023-01-19T01:45:03.6388675Z x-timer: S1674092702.177773,VS0,VE1427
2023-01-19T01:45:03.6389032Z access-control-allow-origin: *
2023-01-19T01:45:03.6389491Z x-fastly-request-id: 6f14115bd9a184b9dd6f35d36d710ca6e8432589
2023-01-19T01:45:03.6389836Z expires: Thu, 19 Jan 2023 01:50:03 GMT
2023-01-19T01:45:03.6390207Z vary: Authorization,Accept-Encoding
2023-01-19T01:45:03.6390447Z 
2023-01-19T01:45:08.7872130Z ##[error]Failed to retrieve cspell:lorem-ipsum/dictionary.txt -- https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/lorem-ipsum/dictionary.txt (dictionary-not-found)
2023-01-19T01:45:08.7886631Z HTTP/2 502 
2023-01-19T01:45:08.7887348Z cache-control: no-cache
2023-01-19T01:45:08.7887901Z content-type: text/html; charset=utf-8
2023-01-19T01:45:08.7888244Z strict-transport-security: max-age=31536000
2023-01-19T01:45:08.7888585Z x-content-type-options: nosniff
2023-01-19T01:45:08.7888840Z x-frame-options: deny
2023-01-19T01:45:08.7889090Z x-xss-protection: 0
2023-01-19T01:45:08.7889497Z content-security-policy: default-src 'none'; style-src 'unsafe-inline'; img-src data:;
2023-01-19T01:45:08.7889831Z accept-ranges: bytes
2023-01-19T01:45:08.7890054Z date: Thu, 19 Jan 2023 01:45:08 GMT
2023-01-19T01:45:08.7890256Z via: 1.1 varnish
2023-01-19T01:45:08.7890531Z x-served-by: cache-iad-kiad7000027-IAD
2023-01-19T01:45:08.7890781Z x-cache: MISS
2023-01-19T01:45:08.7890997Z x-cache-hits: 0
2023-01-19T01:45:08.7891253Z x-timer: S1674092704.734265,VS0,VE5021
2023-01-19T01:45:08.7891526Z access-control-allow-origin: *
2023-01-19T01:45:08.7892110Z x-fastly-request-id: 1c9541750668ccd65e6ec8c2491347dec3a26620
2023-01-19T01:45:08.7892470Z expires: Thu, 19 Jan 2023 01:50:08 GMT
2023-01-19T01:45:08.7893000Z vary: Authorization,Accept-Encoding
2023-01-19T01:45:08.7893204Z 
2023-01-19T01:45:19.0486180Z ##[error]Failed to retrieve cspell:python/src/python/python.txt -- https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/python/src/python/python.txt (dictionary-not-found)
2023-01-19T01:45:19.0500883Z HTTP/2 503 
2023-01-19T01:45:19.0501739Z server: Varnish
2023-01-19T01:45:19.0502185Z retry-after: 0
2023-01-19T01:45:19.0502507Z content-type: text/html; charset=utf-8
2023-01-19T01:45:19.0502878Z accept-ranges: bytes
2023-01-19T01:45:19.0503270Z date: Thu, 19 Jan 2023 01:45:19 GMT
2023-01-19T01:45:19.0503513Z via: 1.1 varnish
2023-01-19T01:45:19.0503872Z x-served-by: cache-iad-kiad7000027-IAD
2023-01-19T01:45:19.0504210Z x-cache: MISS
2023-01-19T01:45:19.0504523Z x-cache-hits: 0
2023-01-19T01:45:19.0504867Z x-timer: S1674092718.014783,VS0,VE1021
2023-01-19T01:45:19.0505240Z access-control-allow-origin: *
2023-01-19T01:45:19.0505687Z x-fastly-request-id: 264d06266d09e743a635f2ef8dcee69e2a9a1f2f
2023-01-19T01:45:19.0506005Z expires: Thu, 19 Jan 2023 01:50:19 GMT
2023-01-19T01:45:19.0506394Z vary: Authorization,Accept-Encoding
2023-01-19T01:45:19.0506772Z content-length: 452
2023-01-19T01:45:19.0506940Z 
2023-01-19T01:45:34.2410239Z ##[error]Failed to retrieve cspell:cpp/src/cpp.txt -- https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/cpp/src/cpp.txt (dictionary-not-found)
2023-01-19T01:45:34.2456051Z HTTP/2 503 
2023-01-19T01:45:34.2458642Z server: Varnish
2023-01-19T01:45:34.2459025Z retry-after: 0
2023-01-19T01:45:34.2459302Z content-type: text/html; charset=utf-8
2023-01-19T01:45:34.2459577Z accept-ranges: bytes
2023-01-19T01:45:34.2459806Z date: Thu, 19 Jan 2023 01:45:34 GMT
2023-01-19T01:45:34.2460000Z via: 1.1 varnish
2023-01-19T01:45:34.2460280Z x-served-by: cache-iad-kiad7000143-IAD
2023-01-19T01:45:34.2460556Z x-cache: MISS
2023-01-19T01:45:34.2460769Z x-cache-hits: 0
2023-01-19T01:45:34.2461052Z x-timer: S1674092719.147162,VS0,VE15081
2023-01-19T01:45:34.2461353Z access-control-allow-origin: *
2023-01-19T01:45:34.2461742Z x-fastly-request-id: 8beca78ccec9bdca3798ef90270b9944b362c0c6
2023-01-19T01:45:34.2462024Z expires: Thu, 19 Jan 2023 01:50:34 GMT
2023-01-19T01:45:34.2462318Z vary: Authorization,Accept-Encoding
2023-01-19T01:45:34.2462588Z content-length: 452
2023-01-19T01:45:34.2462712Z 
2023-01-19T01:45:42.4641687Z ##[error]Failed to retrieve cspell:cpp/src/compiler-clang-attributes.txt -- https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/cpp/src/compiler-clang-attributes.txt (dictionary-not-found)
2023-01-19T01:45:42.4656291Z HTTP/2 502 
2023-01-19T01:45:42.4657080Z cache-control: no-cache
2023-01-19T01:45:42.4657425Z content-type: text/html; charset=utf-8
2023-01-19T01:45:42.4657774Z strict-transport-security: max-age=31536000
2023-01-19T01:45:42.4658121Z x-content-type-options: nosniff
2023-01-19T01:45:42.4658378Z x-frame-options: deny
2023-01-19T01:45:42.4658628Z x-xss-protection: 0
2023-01-19T01:45:42.4659047Z content-security-policy: default-src 'none'; style-src 'unsafe-inline'; img-src data:;
2023-01-19T01:45:42.4659389Z accept-ranges: bytes
2023-01-19T01:45:42.4659614Z date: Thu, 19 Jan 2023 01:45:42 GMT
2023-01-19T01:45:42.4659819Z via: 1.1 varnish
2023-01-19T01:45:42.4660094Z x-served-by: cache-iad-kiad7000059-IAD
2023-01-19T01:45:42.4660343Z x-cache: MISS
2023-01-19T01:45:42.4660564Z x-cache-hits: 0
2023-01-19T01:45:42.4660824Z x-timer: S1674092734.339570,VS0,VE8092
2023-01-19T01:45:42.4661094Z access-control-allow-origin: *
2023-01-19T01:45:42.4661451Z x-fastly-request-id: 2530687577db3869490b3607b841487a9a1f5f14
2023-01-19T01:45:42.4661712Z expires: Thu, 19 Jan 2023 01:50:42 GMT
2023-01-19T01:45:42.4661997Z vary: Authorization,Accept-Encoding
2023-01-19T01:45:42.4662162Z 
2023-01-19T01:46:04.5322552Z ##[error]Failed to retrieve cspell:cpp/src/stdlib-cpp.txt -- https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/cpp/src/stdlib-cpp.txt (dictionary-not-found)
2023-01-19T01:46:04.5330340Z HTTP/2 502 
2023-01-19T01:46:04.5330886Z cache-control: no-cache
2023-01-19T01:46:04.5331572Z content-type: text/html; charset=utf-8
2023-01-19T01:46:04.5332082Z strict-transport-security: max-age=31536000
2023-01-19T01:46:04.5332761Z x-content-type-options: nosniff
2023-01-19T01:46:04.5333195Z x-frame-options: deny
2023-01-19T01:46:04.5333804Z x-xss-protection: 0
2023-01-19T01:46:04.5334363Z content-security-policy: default-src 'none'; style-src 'unsafe-inline'; img-src data:;
2023-01-19T01:46:04.5335067Z accept-ranges: bytes
2023-01-19T01:46:04.5335442Z date: Thu, 19 Jan 2023 01:46:04 GMT
2023-01-19T01:46:04.5335987Z via: 1.1 varnish
2023-01-19T01:46:04.5336427Z x-served-by: cache-iad-kiad7000094-IAD
2023-01-19T01:46:04.5337037Z x-cache: MISS
2023-01-19T01:46:04.5337434Z x-cache-hits: 0
2023-01-19T01:46:04.5338042Z x-timer: S1674092757.971915,VS0,VE7527
2023-01-19T01:46:04.5338494Z access-control-allow-origin: *
2023-01-19T01:46:04.5339213Z x-fastly-request-id: 2d83068b445c8264392a82aca7cbd9cc28693984
2023-01-19T01:46:04.5339651Z expires: Thu, 19 Jan 2023 01:51:04 GMT
2023-01-19T01:46:04.5340278Z vary: Authorization,Accept-Encoding
2023-01-19T01:46:04.5340598Z 
2023-01-19T01:46:08.3360740Z ##[error]Failed to retrieve cspell:cpp/src/lang-keywords.txt -- https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/cpp/src/lang-keywords.txt (dictionary-not-found)
2023-01-19T01:46:08.3375367Z HTTP/2 502 
2023-01-19T01:46:08.3376140Z cache-control: no-cache
2023-01-19T01:46:08.3376491Z content-type: text/html; charset=utf-8
2023-01-19T01:46:08.3376837Z strict-transport-security: max-age=31536000
2023-01-19T01:46:08.3377176Z x-content-type-options: nosniff
2023-01-19T01:46:08.3377448Z x-frame-options: deny
2023-01-19T01:46:08.3377698Z x-xss-protection: 0
2023-01-19T01:46:08.3378125Z content-security-policy: default-src 'none'; style-src 'unsafe-inline'; img-src data:;
2023-01-19T01:46:08.3378471Z accept-ranges: bytes
2023-01-19T01:46:08.3378703Z date: Thu, 19 Jan 2023 01:46:08 GMT
2023-01-19T01:46:08.3378913Z via: 1.1 varnish
2023-01-19T01:46:08.3379187Z x-served-by: cache-iad-kiad7000143-IAD
2023-01-19T01:46:08.3379440Z x-cache: MISS
2023-01-19T01:46:08.3379658Z x-cache-hits: 0
2023-01-19T01:46:08.3379909Z x-timer: S1674092765.628658,VS0,VE3673
2023-01-19T01:46:08.3380195Z access-control-allow-origin: *
2023-01-19T01:46:08.3380573Z x-fastly-request-id: 3bfe8fe2e5519335fab53e28ea92fbedcf337421
2023-01-19T01:46:08.3380856Z expires: Thu, 19 Jan 2023 01:51:08 GMT
2023-01-19T01:46:08.3381145Z vary: Authorization,Accept-Encoding
2023-01-19T01:46:08.3381310Z 
2023-01-19T01:46:13.7814752Z ##[error]Failed to retrieve cspell:cpp/src/lang-jargon.txt -- https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/cpp/src/lang-jargon.txt (dictionary-not-found)
2023-01-19T01:46:13.7828915Z HTTP/2 502 
2023-01-19T01:46:13.7829693Z cache-control: no-cache
2023-01-19T01:46:13.7830051Z content-type: text/html; charset=utf-8
2023-01-19T01:46:13.7830407Z strict-transport-security: max-age=31536000
2023-01-19T01:46:13.7830753Z x-content-type-options: nosniff
2023-01-19T01:46:13.7831021Z x-frame-options: deny
2023-01-19T01:46:13.7831274Z x-xss-protection: 0
2023-01-19T01:46:13.7831681Z content-security-policy: default-src 'none'; style-src 'unsafe-inline'; img-src data:;
2023-01-19T01:46:13.7832036Z accept-ranges: bytes
2023-01-19T01:46:13.7832257Z date: Thu, 19 Jan 2023 01:46:13 GMT
2023-01-19T01:46:13.7832460Z via: 1.1 varnish
2023-01-19T01:46:13.7832734Z x-served-by: cache-iad-kiad7000162-IAD
2023-01-19T01:46:13.7832996Z x-cache: MISS
2023-01-19T01:46:13.7833215Z x-cache-hits: 0
2023-01-19T01:46:13.7833466Z x-timer: S1674092768.436893,VS0,VE5311
2023-01-19T01:46:13.7833752Z access-control-allow-origin: *
2023-01-19T01:46:13.7834122Z x-fastly-request-id: bef70b7045564c20ad6349d488c204bc48f9540f
2023-01-19T01:46:13.7834920Z expires: Thu, 19 Jan 2023 01:51:13 GMT
2023-01-19T01:46:13.7835226Z vary: Authorization,Accept-Encoding
2023-01-19T01:46:13.7835470Z 
2023-01-19T01:46:15.3960043Z ##[error]Failed to retrieve cspell:cpp/src/compiler-gcc.txt -- https://raw.githubusercontent.com/check-spelling/cspell-dicts/v20220816/dictionaries/cpp/src/compiler-gcc.txt (dictionary-not-found)
2023-01-19T01:46:15.3971056Z HTTP/2 502 
2023-01-19T01:46:15.3971568Z cache-control: no-cache
2023-01-19T01:46:15.3972475Z content-type: text/html; charset=utf-8
2023-01-19T01:46:15.3972858Z strict-transport-security: max-age=31536000
2023-01-19T01:46:15.3973182Z x-content-type-options: nosniff
2023-01-19T01:46:15.3973444Z x-frame-options: deny
2023-01-19T01:46:15.3973694Z x-xss-protection: 0
2023-01-19T01:46:15.3974112Z content-security-policy: default-src 'none'; style-src 'unsafe-inline'; img-src data:;
2023-01-19T01:46:15.3974450Z accept-ranges: bytes
2023-01-19T01:46:15.3974665Z date: Thu, 19 Jan 2023 01:46:15 GMT
2023-01-19T01:46:15.3974887Z via: 1.1 varnish
2023-01-19T01:46:15.3975158Z x-served-by: cache-iad-kiad7000059-IAD
2023-01-19T01:46:15.3975412Z x-cache: MISS
2023-01-19T01:46:15.3975642Z x-cache-hits: 0
2023-01-19T01:46:15.3975893Z x-timer: S1674092774.880679,VS0,VE1482
2023-01-19T01:46:15.3976176Z access-control-allow-origin: *
2023-01-19T01:46:15.3976551Z x-fastly-request-id: 3de179c7f5025d6e884ca44e74c42e2876bca19e
2023-01-19T01:46:15.3976830Z expires: Thu, 19 Jan 2023 01:51:15 GMT
2023-01-19T01:46:15.3977120Z vary: Authorization,Accept-Encoding
2023-01-19T01:46:15.3977285Z 
2023-01-19T01:46:33.5023135Z ##[error]Process completed with exit code 4.
2023-01-19T01:46:33.5329009Z Post job cleanup.
2023-01-19T01:46:33.5360610Z Post job cleanup.
2023-01-19T01:46:33.6656307Z [command]/usr/bin/git version
2023-01-19T01:46:33.6701743Z git version 2.39.0
2023-01-19T01:46:33.6750174Z Temporarily overriding HOME='/home/runner/work/_temp/83bbd43b-044c-4a02-aa0b-3eee8742c10d' before making global git config changes
2023-01-19T01:46:33.6751771Z Adding repository directory to the temporary git global config as a safe directory
2023-01-19T01:46:33.6757707Z [command]/usr/bin/git config --global --add safe.directory /home/runner/work/vector/vector
2023-01-19T01:46:33.6796537Z [command]/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
2023-01-19T01:46:33.6831046Z [command]/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
2023-01-19T01:46:33.6855428Z http.https://github.com/.extraheader
2023-01-19T01:46:33.6868890Z [command]/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
2023-01-19T01:46:33.7125251Z Evaluate and set job outputs
2023-01-19T01:46:33.7137615Z Cleaning up orphan processes
```

</details>

## Plan

There is some handling for retries. Offhand, I think I want to try to parse the
`date: Thu, 19 Jan 2023 01:44:06 GMT` and `expires: Thu, 19 Jan 2023 01:49:06 GMT` fields to calculate a delay.

Note that these headers are not always present (especially for `502`...).

In theory the process is:

1. `date`=`now`()
2. `request_date`=`parse`(`headers`, `'date'`)
3. `expires_date`=`parse`(`headers`, `'expires'`)
4. `cache_duration`=`max`(`expires_date` && `request_date` && (`expires_date`-`request_date`), `1`)
5. `sleep_until`(`date`+`cache_duration`)
6. `retry_count`++
7. `do_retry`()

## Status

check-spelling [v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22) tolerates `429` and `503` responses.

### 502

Sometimes GitHub just returns something like this:

```
HTTP/2 502 
content-type: text/plain; charset=utf-8
x-served-by: cache-dfw-kdfw8210077
content-length: 9
```

This was not handled by check-spelling [v0.0.22](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.22) as a `503` was expected.
[v0.0.23](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.23) will tolerate `502` as well.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
