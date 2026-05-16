Git configuration
=================

`gitignore`
-----------

Global gitignore file. Move this file to `~/.gitignore`.

`hooks/pre-push`
----------------

Git hook that rejects pushes containing commits authored with the personal
email address. Move it to `~/.config/git/hooks/pre-push`, making sure it
is executable.

`global-config.sh`
------------------

Script for setting up the global git configuration. Run it once to apply
all settings:

```bash
bash global-config.sh
```

Better to run it after creating the `~/.config/git/hooks/` directory.
