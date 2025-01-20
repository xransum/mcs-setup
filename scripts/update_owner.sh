#!/bin/bash
# Must be run as root

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit
fi

TARGET_USER=minecraft
TARGET_GROUP=minecraft

sudo chown -R -v "${TARGET_USER}:${TARGET_GROUP}" /home/${TARGET_USER}/
