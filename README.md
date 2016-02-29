# My Arch and i3 window manager config 

## Arch packages

The file **arch-packages** includes a list of programs which I find useful. To install all packages in that file just run this command: 
```cat arch-packages | gawk '{printf " "$1}' | sudo pacman -S ```

**Do it at your own risk!**
