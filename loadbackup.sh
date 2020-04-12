#!/bin/bash

# fail if any command fails
set -e

if [ "$#" -ne 1 ]; then
    echo "Usage: loadbackup <name>"
    exit 1
fi

BACKUP="backups/world/$1"
if [ ! -f "$BACKUP" ]; then
    echo "$BACKUP does not exist"
    exit 1
fi

mv world archive/world-$(date +"%Y-%m-%d_%H-%M-%S")
mkdir world
cp $BACKUP world
cd world
unzip $1
rm $1
echo "finished"
