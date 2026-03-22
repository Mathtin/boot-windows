`boot-windows`

## About

Convinient CLI (bash) script to quickly switch from Linux (any OS with `bash` and `efibootmgr` really) to Windows once (in UEFI dual-boot setup). Does not affect usual boot setup (next reboot will get you back).

## Download

```
git clone https://github.com/Mathtin/boot-windows
```

## Portable run

```
sudo bash boot-windows/boot-windows.sh
```

## KDE Shortcut

You can add this script as an app "Boot Windows" in "System" category using

```
echo -e "[Desktop Entry]\nName=Boot Windows\nExec=pkexec env DISPLAY=\$DISPLAY XAUTHORITY=\$XAUTHORITY konsole -e bash $(pwd)/boot-windows/boot-windows.sh\nIcon=system-run\nType=Application\nCategories=System;" > ~/.local/share/applications/boot-windows.desktop
```

## Bash alias `boot-windows`

Run this to add alias to your bash-rc file (`.bashrc` in home directory)

```
echo "alias boot-windows='sudo bash $(pwd)/boot-windows/boot-windows.sh'" >> ~/.bashrc
```

Reload profile

```
source ~/.bashrc
```

Now you should be able to run it with:

```
boot-windows
```

## Licence

MIT licence


## Author

* Daniil `Mathtin` Shigapov me@matht.in
