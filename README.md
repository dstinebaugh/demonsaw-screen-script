# demonsaw-screen-script
Provides an easy way to run a demonsaw router in a linux screen session so you can re-connect to it at will.
Simply download this script, update the "Settings" Section at the top to match your servers locations, make it executable (chmod +x) and add it to your startup routine, typically /etc/rc.local

Once running it will be in a new screen session named demonsaw, to connect just execute "screen -RD demonsaw"
