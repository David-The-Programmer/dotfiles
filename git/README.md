# Setup guide for Git

**Note, this is my own setup for using Git with HTTPs**

Will be using [git-credential-manager](https://github.com/GitCredentialManager/git-credential-manager)

Will be using GPG/pass compatible files method to store the git credentials, as described [here](https://github.com/GitCredentialManager/git-credential-manager/blob/main/docs/credstores.md)

Packages that need to be installed
- [pass](https://www.passwordstore.org/)
- [git-credential-manager](https://github.com/GitCredentialManager/git-credential-manager)

Take note when installing the git-credential-manager, use the command 
```sh
yay -S git-credential-manager-core-bin
```
Note not to install the `git-credential-manager-core` package, that has some installation issues

TODO-WIP: Document exact configuration steps here after installation

After installation of those packages, run the following command to configure the `git-credential-manager`
```sh
git-credential-manager-core configure
```

After installation of those packages, make sure to create a GPG key pair using the `gpg` tool.
```sh
gpg --gen-key
```
The name of the gpg key can be `github_creds` or something

After that, use the `pass` tool to initialise the credential store
```sh
pass init <gpg-id>
```
`<gpg-id>` is the user ID of a GPG key pair on your system.

After that, run the following command to make sure git uses GPG for credential storage
```sh
git config --global credential.credentialStore gpg
```

## TODO-Usage section

Once you do any git operations like `push`, `fetch`, etc, a prompt should be there asking for personal access token or for you to sign in. After that, these operations should work without needing to authenticate again.
