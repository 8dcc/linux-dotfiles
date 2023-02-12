## `sshd_config`
Move this file to `/etc/ssh/sshd_config` in your server.

You will need to edit the `AllowUsers` line. You need to put there the user you will use to log in. Keep in mind that root login is disabled.
```bash
AllowUsers <YOUR-USER>
```

## `config`
Move this file to `~/.ssh/config` in your client machine.

This file **needs** to be edited, changing the IP and User. This file is supposed to add an alias for your server, making [connect-ssh.sh](https://github.com/8dcc/arch-dotfiles/tree/main/Scripts/Group2) useless, enabling you to use:
```bash
ssh server    # Server name in edited in the file
```
