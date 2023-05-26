### `run-media-username-Disk.mount`

Used to mount a partition at startup with user permissions. Note that **if you
change the mount path inside the file, you will also need to change the file
name**. So for example, for path `/mnt/test/diskname`, it needs to be called
`mnt-test-diskname.mount`.

Move this file to `/etc/systemd/system/run-media-username-Disk.mount`.
