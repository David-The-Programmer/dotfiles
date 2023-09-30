# Setup guide for Git configs

**Note, this is my own setup for using Git/Github with SSH, this assumes Git is already installed.**

This is a reference/guide to setting up SSH with Github on Arch Linux.
In summary, the process to set up SSH with Github includes:
1. Creation of a new entry in KeePassXC for the SSH key
2. Generation of SSH key
3. Addition of generated SSH key to entry in KeePassXC
4. Set up of the `ssh-agent` service
5. Addition of generated SSH public key to Github
6. Testing SSH with Github

## Prerequisites

Packages that need to be installed:
- [KeePassXC](https://github.com/keepassxreboot/keepassxc)
- [OpenSSH](https://archlinux.org/packages/core/x86_64/openssh/)

```sh
yay -S keepassxc openssh
```

Set the username, email and preferred editor for git.
```sh
git config --global user.name "<username>"

git config --global user.email "<email>"

git config --global core.editor nvim
```

## 1. Creation of new entry in KeePassXC
1. Go into the KeePassXC GUI and create a new entry. The title of the entry should be: `Github SSH Key`.
2. Leave all other fields blank.
3. Save the entry by clicking the `Ok` button.

## 2. Generation of SSH Keys
1. Run the following command: `ssh-keygen -t ed25519 -C "Personal Github SSH Key"`
2. When prompted about the location to save the SSH key, press enter to accept the default location shown. The key will be shredded later.
3. When prompted about the passphrase, press enter. There is no need for a passphrase as the key will be stored in the encrypted KeePassXC database.

## 3. Addition of generated SSH key to KeePassXC entry
1. Double click on the entry to edit. 
2. Go to the `Advanced` menu on the left. Go to the `Attachments` section. Click on `Add` to add the private key. By default, the location of the key would be `~/.ssh/id_ed25519`.
3. Go to the `SSH Agent` menu on the left. 
4. Select the options: 
    - `Add key to agent when the database is opened/unlocked`
    - `Remove key from agent when the database is closed/locked`
    
    Having these options enabled will ensure that the key is cached the `ssh-agent` only when the database was unlocked by the user and removed when the database is locked. This prevents unauthorised usage of the key by the `ssh-agent`. 
5. Do not enable the option `Require user confirmation when this key is used` as it requires a lot of configuration for it to work properly, thus not worth the effort.
6. In the `SSH Agent Menu`, ensure the key file attached previously is selected in the dropdown menu for `Attachment`.
7. Click on the `Add to Agent` button to ensure that the key is added to the `ssh-agent` for the first time.
8. Click on `Ok` to save the edits to the entry.
9. Now that the key file is added and securely stored in the KeePassXC database, we can shred the key by running: `shred -vzu -n5 ~/.ssh/id_ed25519 ~/.ssh/id_ed25519.pub`. This will ensure that the key files are not stored in plain text, which is a highly unsecure way to store them.
10. Ensure that the comment shown in the `SSH Agent` menu matches the one written when generating the SSH key, which if you follow this guide would be "personal github ssh key".

## 4. Set up of the `ssh-agent` service
1. Create a file in `~/.config/systemd/user/ssh-agent.service`. The file should have the content below.
    ```
    [Unit]
    Description=SSH key agent
    
    [Service]
    Type=simple
    Environment=SSH_AUTH_SOCK=%t/ssh-agent.socket
    ExecStart=/usr/bin/ssh-agent -D -a $SSH_AUTH_SOCK
    
    [Install]
    WantedBy=default.target
    ```
2. Add `SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"` to `~/.config/environment.d/ssh_auth_socket.conf`
3. Run the command `systemctl --user enable --now ssh-agent` to enable the `ssh-agent` service.
4. Reboot for the configurations above to take effect.
5. Running `ssh-add -l` should output `The agent has no identities.` when the KeePassXC database is locked. When it is unlocked, `ssh-add -l` should output the SSH key fingerprint, as shown in under `Fingerprint` in the `SSH Agent` menu of the KeePassXC entry.

## 5. Addition of generated SSH public key to Github
1. Click on your profile icon and click to `Settings`
2. Go to the `SSH and GPG keys` menu on the left.
3. Click on `New SSH key`.
4. Enter the title of the KeePassXC entry in the `Title` input field.
5. Ensure the option `Authentication Key` is selected for the `Key Type` input field.
6. Enter the public key found in the `Key` input field. The public key can be found in the `Public Key` section in the `SSH Agent` menu of the KeePassXC entry.
7. Click on `Add SSH Key`.

## 6. Testing SSH with Github
1. To test if SSH with Github was setup correctly, clone one of your private repos that are on Github. Ensure you unlocked the KeePassXC database first.
2. If prompted with the following message: 
    ```
    This key is not known by any other names.
    Are you sure you want to continue connecting (yes/no/[fingerprint])?
    ```
    Type the full word `yes` and press enter.

3. The repo should be cloned with no error messages.

## Usage

Once you do any git operations like `clone`, `push`, `fetch`, etc, which require authentication should just work without any prompts or errors. Always ensure to unlock the KeePassXC before doing such operations.

## Useful links

https://peterbabic.dev/blog/make-ssh-prompt-password-keepassxc/

https://www.padok.fr/en/blog/ssh-keys-keepassxc

https://ferrario.me/using-keepassxc-to-manage-ssh-keys/

https://www.freecodecamp.org/news/securely-erasing-a-disk-and-file-using-linux-command-shred

https://unix.stackexchange.com/questions/339840/how-to-start-and-use-ssh-agent-as-systemd-service

https://github.com/keepassxreboot/keepassxc/issues/7718
