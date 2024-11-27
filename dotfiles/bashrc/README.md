# `bashrc` and `bash_profile`

You will need to copy all of this files to the home folder of your user (`~`).

```bash
# Make a backup and copy the .bashrc
cp ~/.bashrc ~/.bashrc.bak  # Make a backup
cp bashrc ~/.bashrc         # Copy the actual file

# Copy the bash_profile, that will start Xorg server on login
cp bash_profile ~/.bash_profile
```

The auxiliar `git-prompt.sh` file is located under the `scripts/startup/`
directory.
