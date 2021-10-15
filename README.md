<div align="center">
  <h1>dwm installation in arch</h1>
  <b>Installation process of <a href="https://dwm.suckless.org/">dwm</a> in <a href="https://archlinux.org/">arch</a> / <a href="https://garudalinux.org/">garuda linux</a>.</b>
</div>

## Table of contents
1. [Requirements](https://github.com/r4v10l1/arch-files#Requirements)
2. [Process](https://github.com/r4v10l1/arch-files#Process)
	- [dwm](https://github.com/r4v10l1/arch-files#dwm)
	- [st](https://github.com/r4v10l1/arch-files#st)
	- [xmenu](https://github.com/r4v10l1/arch-files#xmenu)
	- [bashrc](https://github.com/r4v10l1/arch-files#bashrc)
	- [Scripts](https://github.com/r4v10l1/arch-files#Scripts)
	- [nvim](https://github.com/r4v10l1/arch-files#nvim)
3. [Extra](https://github.com/r4v10l1/arch-files#Extra)

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
	git clone https://github.com/r4v10l1/arch-files
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

---

## Process:
### dwm
We will install dwm 6.2.
```bash
cd ~/000/GITHUB/arch-files/DWM-6.2
# rm config.h
sudo make clean install  # Prepare for the errors?
```

#

### st
Make the `.font` folder and copy the powerline font in there.
```bash
cd ~/000/GITHUB/arch-files/fonts
mkdir ~/.fonts
cp -r powerline-fonts ~/.fonts
c-list | grep power  # Check that all is fine
```
We will install 0.8.2 because of the extensions.
```bash
cd ~/000/GITHUB/arch-files/ST-0.8.2
# rm config.h
sudo make clean install  # Prepare for the errors?
```
**You can scroll the terminal with shift+mwheel**

#

### xmenu
Enter the `XMENU` folder.
```bash
cd ~/000/GITHUB/arch-files/XMENU/
sudo make clean install
```

#

### .bashrc
Make a backup and copy the `.bashrc` to `~/.bashrc`
```bash
cp ~/.bashrc ~/.bashrc.bak  # Make a backup
cd ~/000/GITHUB/arch-files/dotfiles/bashrc  # Yes it is a folder
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

### .xinitrc
Make a backup and copy the `.xinitrc` to `~/.xinitrc`
```bash
cp ~/.xinitrc ~/.xinitrc.bak  # Make a backup (The file might not exist!)
cd ~/000/GITHUB/custom_arch/dotfiles/xinitrc  # Yes it is a folder
cp xinitrc ~/.xinitrc  # Copy the actual file
```
Add `startx` to the `~/.bash_profile`
```bash
echo "startx" >> ~/.bash_profile  # Append to the file
```

#

### Scripts
- Group 1.
	```bash
	cat ~/000/GITHUB/arch-files/Scripts/Group1/README.txt  # Copy to /usr/local/bin
	# Just do what the file says
	```
- Group 2.
	```bash
	cat ~/000/GITHUB/arch-files/Scripts/Group2/README.txt
	# Change the file name from 'dwmbar' to '.dwmbar' and copy it to ~
	# Just do what the file says
	```

#

### nvim
[Go to the vim-dotfiles repository.](https://github.com/r4v10l1/vim-dotfiles)

---

## Extra
- You might need to edit the grub config to launch garuda linux in terminal mode. [Help here.](https://forum.garudalinux.org/t/how-to-open-garuda-linux-in-text-console/7613)
