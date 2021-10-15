# Custom arch

Scripts, configurations and files I use for my Arch.

## Custom dwm

My riced dwm (6.2). I made this one for Arch, based on the one I made for Debian 10.

You can download dwm here: https://dwm.suckless.org/

### Requirements

You will need to install "Awesome font" in order to see the bar icons.

https://archlinux.org/packages/community/any/ttf-font-awesome/

### Install
```bash
git clone https://github.com/r4v10l1/custom_arch
```

#### dwm-6.2

```bash
cd custom_arch/DWM-6.2
make clean install  # As root
```

#### Scripts

Copy the scripts from the Group1 and Group2 to the paths in the `README.txt`

```bash
cd custom_arch/Scripts/Group1
cp * /usr/local/bin  # Except readme
cd custom_arch/Scripts/Group2
cp dwmbar /home/YOUR_USERNAME/.dwmbar  # Change the file name to make it hidden
``` 
