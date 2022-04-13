## Bashrc

You will need to copy all of this files to the home folder of your user (`~`).
```bash
# Make a backup and copy the .bashrc
cp ~/.bashrc ~/.bashrc.bak  # Make a backup
cp bashrc ~/.bashrc  # Copy the actual file

# Copy the `git-prompt.sh` file to `~/.git-prompt.sh`
cp git-prompt.sh ~/.git-prompt.sh

# Copy the `gcco` file (previously a function in the `.bashrc`) to `~/.gcco`
cp gcco ~/.gcco
sudo chmod +x ~/.gcco
```
