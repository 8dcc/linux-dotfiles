# GnuPG

Configuration for the GNU Privacy Guard suite of programs.

The `gpg-agent.conf` file should be moved to `~/.gnupg/gpg-agent.conf`. It has
settings for specifying:

- The timeout (in seconds) after the last GnuPG activity. In this case it will
  prompt for GPG authentication after 1 hour.
- We allow loopback pientry, needed for some programs.
- The `pientry` program used (GUI instead of TTY).
