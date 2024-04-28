#!/bin/bash

if test -n "$BASH" ; then script=$BASH_SOURCE
elif test -n "$TMOUT"; then script=${.sh.file}
elif test -n "$ZSH_NAME" ; then script=${(%):-%x}
elif test ${0##*/} = dash; then x=$(lsof -p $$ -Fn0 | tail -1); script=${x#n}
else script=$0
fi
SCRIPTPATH=$(dirname "$script")

while read variable; read value; do
    if [ "$variable" == "PATH" ]; then
        export "$variable=$value:$PATH"
    else
        export "$variable=$value"
    fi
done <<< "$($SCRIPTPATH/senv-get.sh $1)"
