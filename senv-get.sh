#!/bin/bash

if [ -z "$1" ]
  then
    echo "No argument supplied"
    exit
fi

SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
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

# echo "$FILE"

while IFS= read -r line || [ "$line" ]; do
    # echo "$line"
    while IFS='|' read -ra PIECES; do
        # echo $PIECES
        if [ "$PIECES" = "$1" ]; then
            for i in "${PIECES[@]:1}"; do
                # process "$i"
                if ! [ -x "$(command -v cygpath)" ];
                then
                    echo "$i"
                    
                else
                    cygpath -u "$i"
                fi
            done
        fi
    done <<< "$line"

done < "$FILE"
