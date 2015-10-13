# redminePlasmoid

### Features:

* icon with spent hours (current day)
* shows associated tasks after click on icon

### Build instructions 

```sh
cd /where/your/applet/is/generated
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$KDEDIRS .. 
make 
make install
```

(your $KDEDIRS is where you install your KDE 4, set this variable in your .bashrc file)

Restart plasma to load the applet 
in a terminal type: 
```sh
kquitapp plasma-desktop 
```
and then
```sh
plasma-desktop
```

or view it with 
```sh
plasmoidviewer YourAppletName
```

You might need to run kbuildsycoca4
in order to get the .desktop file recognized.
