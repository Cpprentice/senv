#!/bin/bash

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

FILE=
if test -f "~/.senv.conf"; then
    FILE="~/.senv.conf"
elif test -f "$SCRIPTPATH/.senv.conf"; then
    FILE="$SCRIPTPATH/.senv.conf"
else
    echo "No config found"
    exit
fi

while IFS= read -r line || [ "$line" ]; do
    while IFS='|' read -ra PIECES; do
        echo $PIECES
    done <<< "$line"
done < "$FILE"
