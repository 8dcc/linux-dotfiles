<div align="center">
  <h1>dwm installation in arch</h1>
  <b>Installation process of <a href="https://dwm.suckless.org/">dwm</a> in <a href="https://archlinux.org/">arch</a> / <a href="https://garudalinux.org/">garuda linux</a>.</b>
</div>

## Table of contents
1. [Requirements](https://github.com/r4v10l1/custom_arch#Requirements)
2. [Process](https://github.com/r4v10l1/custom_arch#Process)
	1. [dwm](https://github.com/r4v10l1/custom_arch#dwm)
	2. [st](https://github.com/r4v10l1/custom_arch#st)
	3. [xmenu](https://github.com/r4v10l1/custom_arch#xmenu)
	4. [bashrc](https://github.com/r4v10l1/custom_arch#bashrc)
	5. [Scripts](https://github.com/r4v10l1/custom_arch#Scripts)
	6. [nvim](https://github.com/r4v10l1/custom_arch#nvim)

#

## Requirements:
### Files:
1. Create folders.
	```bash
	mkdir -p ~/000/GITHUB
	``` 
2. Clone the repo to `~/000/GITHUB`.
	```bash
	cd ~/000/GITHUB
	git clone https://github.com/r4v10l1/custom_arch
	```
### Packages:
Install the requires packages for `ras`:
```bash
sudo pacman -S feh
sudo pacman -S compton
```
And the required font from the aur:
```bash
yay -S ttf-font-awesome  # Required font for st
```

#

## Process:
### dwm
We will install dwm 6.2.
```bash
cd ~/000/GITHUB/custom_arch/DWM-6.2
# rm config.h
sudo make clean install  # Prepare for the errors?
```

#

### st
Make the `.font` folder and copy the powerline font in there.
```bash
cd ~/000/GITHUB/custom_arch/fonts
mkdir ~/.fonts
cp -r powerline-fonts ~/.fonts
c-list | grep power  # Check that all is fine
```
We will install 0.8.2 because of the extensions.
```bash
cd ~/000/GITHUB/custom_arch/ST-0.8.2
# rm config.h
sudo make clean install  # Prepare for the errors?
```
**You can scroll the terminal with shift+mwheel**

#

### xmenu
Enter the `XMENU` folder.
```bash
cd ~/000/GITHUB/custom_arch/XMENU/
sudo make clean install
```

#

### .bashrc
Make a backup and copy the `.bashrc` to `~/.bashrc`
```bash
cp ~/.bashrc ~/.bashrc.bak  # Make a backup
cd ~/000/GITHUB/custom_arch/dotfiles/bashrc  # Yes it is a folder
cp bashrc ~/.bashrc  # Copy the actual file
```
Need to download `.git-prompt.sh`
```bash
curl -o ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
```
Add it to the `.bashrc` if you use your own:
```bash
echo "source ~/.git-prompt.sh" >> ~/.bashrc
```

#

### Scripts
- Group 1.
	```bash
	cat ~/000/GITHUB/custom_arch/Scripts/Group1/README.txt  # Copy to /usr/local/bin
	# Just do what the file says
	```
- Group 2.
	```bash
	cat ~/000/GITHUB/custom_arch/Scripts/Group2/README.txt
	# Change the file name from 'dwmbar' to '.dwmbar' and copy it to ~
	# Just do what the file says
	```

#

### nvim
[Go to the vim-dotfiles repository.](https://github.com/r4v10l1/vim-dotfiles)
