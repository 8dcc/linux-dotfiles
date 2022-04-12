<div align="center">
  <h1>dwm shortcuts</h1>
  <b><a href="https://dwm.suckless.org/">dwm</a> shortcuts for <a href="https://github.com/r4v10l1/arch-dotfiles">arch-dotfiles</a>.</b>
</div>

## Table of contents
1. [Keys](#Keys)
2. [Hotkeys](#Hotkeys)
	- [Change current window](#Change-current-window)
	- [Change window layout](#Change-window-layout)
	- [Change workspaces](#Change-workspaces)
	- [Spawn](#Spawn)
	- [Misc](#Misc)
3. [Extra](#Extra)

---

## Keys
Just to clarify the `config.def.h` file.
- `MODKEY` -> `alt`
- `MODKEY|ShiftMask` -> `alt+shift`
- `XK_x` -> `x`
- `XK_F1` .. `XK_F12`-> `F1` .. `F12`

## Hotkeys
#### Change current window
Keys                 | Action
-------------------  | ------
`alt`+`shift`+`c`      | Kill current window.
`alt`+`tab`           | Switch to next window.
`alt`+`shift`+`tab`    | Switch to previous window.
`alt`+`j`             | Switch to next window.
`alt`+`k`             | Switch to previous window.

#### Change window layout
Keys                 | Action
-------------------  | ------
`alt`+`t`             | Change layout mode to tile (Default).
`alt`+`f`             | Change layout mode to floating (`NULL`).
`alt`+`m`             | Change layout mode to monocle (Fulscreen).
`alt`+`space`         | Set the current window's layout to monocle (Fulscreen).
`alt`+`shift`+`space`  | Set the current window's layout to floating.
`alt`+`h`             | Decrease the main region (<-)
`alt`+`l`             | Increase the main region (->)
`alt`+`enter`         | Move current window to the main side.
`alt`+`i`             | Change window from right side to left side.
`alt`+`d`             | Change window from left side to right side.

#### Change workspaces
Keys                 | Action
-------------------  | ------
`alt`+`0`             | Go to the *temp* workspace. Shows all your active windows.
`alt`+`shift`+`0`      | Make your current window appear in all workspaces.
`alt`+`0..9`           | Change to workspace N.

#### Spawn
Keys                 | Action
-------------------  | ------
`alt`+`p`             | Execute menu.
`alt`+`shift`+`enter`  | Open a terminal. In my config is `st`.
`alt`+`shift`+`q`      | Open the [`pmenu`](https://github.com/r4v10l1/arch-dotfiles/blob/main/Scripts/Group1/pmenu). To log-out, etc.

#### Misc.
Keys                 | Action
-------------------  | ------
`alt`+`b`             | Toggle hide/show bar.
`alt`+`F12`           | Run `maim ~/screenshot.png -d 1` (Save screenshot with 1s delay).
`alt`+`shift`+`l`      | Lock screen (run [`slock`](https://github.com/r4v10l1/arch-dotfiles#slock)).

## Extra
All this is based on my `config.def.h`. Which can be found in [here](https://github.com/r4v10l1/arch-dotfiles).
- By default, dwm will start the window in your main side (left) and will transfer your previous main window to your right side, at the top. If you transfer all your windows to the right or left side using `alt + i` or `alt + d`, it will create a *stack* layout.
	
![Stack layout](https://raw.githubusercontent.com/r4v10l1/arch-dotfiles/main/images/dwm-3.png)
