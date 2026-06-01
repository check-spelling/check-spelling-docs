# Update expect list

Prior to [v0.0.18](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.18), the action reports a comment which includes a posix(ish) shell command to update the expect list.

It would be much nicer if one could click something and have the action update the expect list.

As of [v0.0.18](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.18), you can enable this with:

```yaml
    with:
      experimental_apply_changes_via_bot: 1
```

## Implementation

### Comment handling

This is implemented in [v0.0.20](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20):

1. 🤖 posts a comment
1. 🤖 gets its url
1. 🤖 update the comment with the url and instructions saying roughly "reply quoting this line"
1. 🤺 user performs the action above
1. 🤖 responds to the action by retrieving the comment (based on the url which is encoded in the reply)
1. ➡ proceed to work

### Commit implementation

1. Retrieve the shell script from the comment, run its equivalent, git add -u, commit.
1. The command (which used to be **posix shell**) is now [Perl](./Feature:-Other-shells)
1. With the command retrieved from the comment
1. Perform the command equivalent (the command is refactored so that the same code can be shared between the two code paths)
1. I don't intend to delete empty files, as they represent structure even if they're temporarily empty.
1. Record the changes (`git add -u`)
1. Create a commit:

   - **Committer** will be the bot
   - **Author** will be the user who commented (need to get username + email address)
   - **Date** will be the comment's date
   - Message will be something like:

     ```
     Applying automated check-spelling metadata updates

     Commands as per <bot-comment-url>
     Accepted in <user-comment-url>
     ```

1. Git push

## Constraints

### Commit Credentials

One can push to GitHub using two mechanisms:

- [HTTPS tokens](#https-tokens)
- [SSH keys](#ssh-keys)

#### HTTPS tokens

Historically HTTPS tokens could have been a user's password, but support for that was [removed a while back](https://github.blog/2020-12-15-token-authentication-requirements-for-git-operations/).

HTTPS tokens can be a [personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) with various arbitrary permissions or the [`GITHUB_TOKEN`](#githubtoken).

##### `GITHUB_TOKEN`

The [`GITHUB_TOKEN`](https://docs.github.com/en/actions/security-guides/automatic-token-authentication) can allow pushes, but when used, it [doesn't trigger other workflows](https://docs.github.com/en/actions/security-guides/automatic-token-authentication#using-the-github_token-in-a-workflow), which means it's problematic for automatic updates.

This mode will trigger a [Disclaimer about missing status](./Feature:-Disclaimer-about-missing-status).

To enable a smoother approach, the repository can be configured to use a [read-write deploy key](./Feature:-Update-with-deploy-key).

#### SSH keys

SSH keys can be user keys, or deploy keys.

Deploy keys can be read-only or [read-write](#read-write-deploy-key).

⚠️ Note that if you use `ssh-key`, it should be a valid private key file (not a PAT/`GITHUB_TOKEN`).
As of [v0.0.21](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.21), check-spelling won't actively complain/warn if you pass a PAT, but it doesn't guarantee that it will work either. A future version may use `ssh-keygen -y -f file` to validate the input...

##### read-write deploy key

Using a [read-write deploy key](https://docs.github.com/en/developers/overview/managing-deploy-keys#setup-2) should allow [**@check-spelling-bot**](https://github.com/check-spelling-bot) to update your PR and also trigger workflows. This will be the recommended approach as of v0.0.20 or thereabouts.

Essentially, this involves:

1. [Creating an encrypted secret](https://docs.github.com/en/actions/security-guides/encrypted-secrets#creating-encrypted-secrets-for-a-repository) -- be mindful of the [secret naming constraints](https://docs.github.com/en/actions/security-guides/encrypted-secrets#naming-your-secrets), e.g., `CHECK_SPELLING`.
2. Changing the workflow for the update comment handler's `uses: action/checkout` step to provide the secret, e.g.:

```yaml
- name: checkout
  uses: actions/checkout@v3
  with:
    ssh-key: "${% raw %}{{{% endraw %} secrets.CHECK_SPELLING }}"
```

###### read-write deploy key limitations

ℹ️ This will only work if the pull request source and destination are in the same repository.
If you're reading this and were trying to make a pull request from a fork into a different repository and would like to take advantage of this feature, you can follow these steps:

1. Go to your fork (`your-fork`).
2. If necessary, [Enable workflows in your fork](https://github.com/github/docs/issues/15761)
3. [Create a read-write deploy key](https://docs.github.com/en/developers/overview/managing-deploy-keys#deploy-keys)
4. [Create a secret](https://docs.github.com/en/actions/security-guides/encrypted-secrets#creating-encrypted-secrets-for-a-repository) using the public key for the deploy key using the name of the secret from the check-spelling workflow
5. Create a pull request in your fork (`your-fork`) from the same branch (`head-branch`) as in the upstream pull request, targeting the same base branch (`destination-branch`) as the upstream (`upstream-fork`) pull's base branch (`destination-branch`).
6. Follow the instructions from the workflow in order to seamlessly update your branch -- doing this will update the branch, and thus should update the branch in the upstream PR and trigger workflows in it.

### Comment limit

GitHub returns an error if the comment is too long:

> "body is too long (maximum is 65536 characters)"

This functions as a limit on the number of words reported initially.

Also, duplicating the words to expect list is just ugly.

Once the comment is effectively self-aware, the command is able to retrieve the bullet list instead of encoding the words twice.

### CheckRunEvent: action

While it seems like it'd be nice to use:
GitHub's [CheckRunEvent: action](https://developer.github.com/v3/activity/events/types/#checkrunevent-api-payload)
which offers a way to implement fix-it functionality.

I'm not sure if that's available for GitHub Actions.

⛈ I couldn't find a way to do this

### Reaction handling

It'd be really shiny if someone could click the 😶 and select the 🚀 [Reaction](https://developer.github.com/v3/reactions/) to trigger this.

⛈ Unfortunately, the [Reactions preview](https://developer.github.com/changes/2016-05-12-reactions-api-preview) doesn't appear to support this functionality.

### Create a PR for the PR / branch

I may need to add fallback code whereby I create / recycle a branch (based on the name of the PR/branch) and then open a PR against the original branch. (I'll revisit this based on feedback)

## Downsides

### Required checks

If you have set the spell checker check as mandatory, you're going to need to add a dummy commit to the end of the branch, otherwise the spell checker will not run again and validate that it's happy with the branch.

The best dummy change is a blank line in the expect file itself. It will have minimal impact on blame, should be an easy merge conflict to resolve, and another pass of this feature will wipe it out.

### Blind Updates

I see a lot of people running the commands blindly and missing the fact that there are real misspellings in the output.

- Part of this is that they aren't used to looking at the output.

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
