#!/bin/bash
# Must be run as root

USERALIAS=minecraft
USERGROUP=minecraft

sudo chown -R -v $USERALIAS:$USERGROUP /home/$USERALIAS/

