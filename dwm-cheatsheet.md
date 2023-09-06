<div align="center">
  <h1>dwm shortcuts</h1>
  <b><a href="https://dwm.suckless.org/">dwm</a> shortcuts for the <a href="https://github.com/8dcc/linux-dotfiles">linux-dotfiles</a> repository.</b>
</div>

## Table of contents
1. [Key meanings](#key-meanings)
2. [Hotkeys](#hotkeys)
	- [Change current window](#change-current-window)
	- [Change window layout](#change-window-layout)
	- [Change workspaces](#change-workspaces)
	- [Spawn](#spawn)
	- [Misc](#misc)
3. [Extra](#extra)
4. [Screenshots](#screenshots)

## Key meanings
Just to clarify the contents of the [`config.def.h`](https://github.com/8dcc/linux-dotfiles/blob/main/DWM-6.2/config.def.h) file.

Config name         | Key 
--------------------|-------------
`MODKEY`            | <kbd>alt</kbd>
`MODKEY\|ShiftMask` | <kbd>alt</kbd>+<kbd>shift</kbd>
`XK_x`              | <kbd>x</kbd>
`XK_F1`..`XK_F12`   | <kbd>F1</kbd>..<kbd>F12</kbd>

## Hotkeys
#### Change current window
Keys                                            | Action
------------------------------------------------|--------
<kbd>alt</kbd>+<kbd>shift</kbd>+<kbd>c</kbd>    | Kill current window.
<kbd>alt</kbd>+<kbd>tab</kbd>                   | Switch to next window.
<kbd>alt</kbd>+<kbd>shift</kbd>+<kbd>tab</kbd>  | Switch to previous window.
<kbd>alt</kbd>+<kbd>j</kbd>                     | Switch to next window.
<kbd>alt</kbd>+<kbd>k</kbd>                     | Switch to previous window.
<kbd>alt</kbd>+<kbd>.</kbd>                     | Switch to next monitor.
<kbd>alt</kbd>+<kbd>,</kbd>                     | Switch to previous monitor.
<kbd>alt</kbd>+<kbd>shift</kbd>+<kbd>0</kbd>    | Make your current window appear in all workspaces.
<kbd>alt</kbd>+<kbd>shift</kbd>+<kbd>1..9</kbd> | Move current window to workspace N.
<kbd>alt</kbd>+<kbd>shift</kbd>+<kbd>.</kbd>    | Move current window to next monitor.
<kbd>alt</kbd>+<kbd>shift</kbd>+<kbd>,</kbd>    | Move current window to previous monitor.

#### Change window layout
Keys                                                | Action
----------------------------------------------------|--------
<kbd>alt</kbd>+<kbd>t</kbd>                         | Change layout mode to tile (Default).
<kbd>alt</kbd>+<kbd>f</kbd>                         | Change layout mode to floating (`NULL`).
<kbd>alt</kbd>+<kbd>m</kbd>                         | Change layout mode to monocle (Fulscreen).
<kbd>alt</kbd>+<kbd>space</kbd>                     | Change to the last layout mode.
<kbd>alt</kbd>+<kbd>shift</kbd>+<kbd>space</kbd>    | Set the current window's layout to floating.
<kbd>alt</kbd>+<kbd>h</kbd>                         | Decrease the main region (←)
<kbd>alt</kbd>+<kbd>l</kbd>                         | Increase the main region (→)
<kbd>alt</kbd>+<kbd>enter</kbd>                     | Move current window to the main side.
<kbd>alt</kbd>+<kbd>i</kbd>                         | Change window from right side to left side.
<kbd>alt</kbd>+<kbd>d</kbd>                         | Change window from left side to right side.

#### Change workspaces
Keys                                            | Action
------------------------------------------------|--------
<kbd>alt</kbd>+<kbd>0</kbd>                     | Go to the *all* workspace. Shows all your active windows.
<kbd>alt</kbd>+<kbd>1..9</kbd>                  | Change to workspace N.

#### Spawn
Keys                                                | Action
----------------------------------------------------|--------
<kbd>alt</kbd>+<kbd>p</kbd>                         | Execute menu.
<kbd>alt</kbd>+<kbd>shift</kbd>+<kbd>enter</kbd>    | Open a terminal. In my config is [`st`](https://github.com/8dcc/linux-dotfiles/blob/main/DWM-6.2/config.def.h#L69).
<kbd>alt</kbd>+<kbd>shift</kbd>+<kbd>q</kbd>        | Open the [`pmenu`](https://github.com/8dcc/linux-dotfiles/blob/main/Scripts/Group1/pmenu). To log-out, etc.

#### Misc.
Keys                                            | Action
------------------------------------------------|--------
<kbd>alt</kbd>+<kbd>b</kbd>                     | Toggle hide/show bar.
<kbd>alt</kbd>+<kbd>F12</kbd>                   | Run `maim ~/screenshot.png -s` (Save a screenshot of the selected region).
<kbd>alt</kbd>+<kbd>shift</kbd>+<kbd>F12</kbd>  | Run `maim ~/screenshot.png` (Save a screenshot of the full screen).
<kbd>alt</kbd>+<kbd>shift</kbd>+<kbd>l</kbd>    | Lock screen (run [`slock`](https://github.com/8dcc/linux-dotfiles#slock)).

## Extra
All this is based on my `config.def.h`. Which can be found in [here](https://github.com/8dcc/linux-dotfiles).
- By default, dwm will start the window in your main side (left) and will transfer your previous main window to your right side, at the top. If you transfer all your windows to the right or left side using `alt + i` or `alt + d`, it will create a *stack* layout.
- You can scroll the terminal with <kbd>Shift</kbd>+<kbd>Mouse Wheel</kbd>

