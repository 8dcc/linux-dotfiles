## `sshd_config`
Move this file to `/etc/ssh/sshd_config` in your server.

I don't think you need to edit this file.

## `config`
Move this file to `~/.ssh/config` in your client machine.

This file **needs** to be edited, changing the IP and User. This file is supposed to add an alias for your server, making [connect-ssh.sh](https://github.com/r4v10l1/arch-files/tree/main/Scripts/Group2) useless, enabling you to use:
```bash
ssh server    # Server name in edited in the file
```
