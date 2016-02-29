# My Arch and i3 window manager config 

## Arch packages

The file **arch-packages** includes a list of programs which I find useful. To install all packages in that file just run this command: 
```cat arch-packages | gawk '{print "sudo pacman -S " $1}' | bash```

**Do it at your own risk!**
