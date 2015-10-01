#!/bin/bash
#Startup script for services on my cloud

# Settings
USERNAME='daniel'
DEMONLOC='/home/daniel/demonsaw/'
INVOCATION="./demonsaw_router"
HISTORY=1024
# End Settings

ME=`whoami`
 as_user() {
   if [ $ME == $USERNAME ] ; then
     bash -c "$1"
   else
     su - $USERNAME -c "$1"
   fi
 }

if pgrep -u $USERNAME -f demonsaw_router > /dev/null
then
        echo "DemonSaw is already running!"
else
        echo "Starting demonsaw..."
        cd $DEMONLOC
        as_user "cd $DEMONLOC && screen -h $HISTORY -dmS demonsaw $INVOCATION"
        sleep 9
        if pgrep -u $USERNAME -f demonsaw_router > /dev/null
        then
                echo "DemonSaw Router is now running."
        else
                echo "Error! Couldn't Validate Demonsaw!"
        fi
fi

echo "Startup Script complete."

exit 0
