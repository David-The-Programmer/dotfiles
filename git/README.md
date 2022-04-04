# Setup guide for Git configs

**Note, this is my own setup for using Git/Github with HTTPs, this assumes Git is already installed.**

This git config uses [git-credential-manager](https://github.com/GitCredentialManager/git-credential-manager) to store git credentials. The option used for storage is the GPG/pass compatible files option, as described [here](https://github.com/GitCredentialManager/git-credential-manager/blob/main/docs/credstores.md).

There is no install/uninstall shell script to generate the git config file as there are a lots of manual user input required, which would make the script unnecessary. The installation instructions will build the git config file.

## Installation

Packages that need to be installed:
- [pass](https://www.passwordstore.org/)
- [git-credential-manager](https://github.com/GitCredentialManager/git-credential-manager)

```sh
yay -S git-credential-manager-core-bin pass
```
Note not to install the `git-credential-manager-core` package, that has some installation issues.

After installation of those packages, run the following command to configure the git-credential-manager.
```sh
git-credential-manager-core configure
```

Set the username, email and preferred editor for git.
```sh
git config --global user.name "<username>"

git config --global user.email "<email>"

git config --global core.editor vim
```

Subequently, create a GPG key pair using the gpg tool.
```sh
gpg --gen-key
```
Set the name (user ID) of the gpg key to `github_creds`. As for email, just press empty to not enter an email.

You would be asked for a passphrase for the key pair, make sure to remember this passphrase, as you would need it whenever prompted by gpg due to executing git operations that require authentication.

After that, use the pass tool to initialise the credential store.
```sh
pass init <gpg_uid>
```
`<gpg_uid>` is the user ID of a GPG key pair on your system.

After that, run the following command to make sure git uses GPG for credential storage.
```sh
git config --global credential.credentialStore gpg
```

## Usage

Once you do any git operations like `clone`, `push`, `fetch`, etc, which require authentication, a prompt should be there asking for you to sign into Github via the browser. A browser tab should open prompting to authorise git-credential-manager for those git operations. After that, these operations should work without needing to authenticate again.

You would be prompted to enter the passphrase you used earlier. You maybe prompted to enter a password to unlock the keyring after entering the passphrase. This password should be your own laptop password.

## Uninstallation

Unconfigure the git-credential-manager.
```sh
git-credential-manager-core unconfigure
```
Delete the git config file.
```sh
rm ~/.gitconfig
```
Remove gpg credential store from pass.
```sh
pass rm git/https/github.com/<github_username>
```
Delete private/secret & public keys generated from gpg.
```sh
gpg --delete-secret-key <key_uid>

gpg --delete-key <key_uid>
```
Keys can be listed via the command below:
```sh
gpg --list-keys
```
Uninstalling git-credential-manager and pass.
```sh
yay -R git-credential-manager-core-bin pass
```
## Useful links

- [How to remove gpg keys](https://blog.chapagain.com.np/gpg-remove-keys-from-your-public-keyring/)
- [How to change gpg key passphrase](https://blog.chapagain.com.np/gpg-how-to-change-edit-private-key-passphrase/)
- [Guide for pass](https://www.passwordstore.org/)
- [Guide for git-credential-manager credential storage](https://github.com/GitCredentialManager/git-credential-manager/blob/main/docs/credstores.md)
- [Guide for git-credential-manager](https://github.com/GitCredentialManager/git-credential-manager)


