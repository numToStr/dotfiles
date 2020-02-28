#!/bin/sh

if [ command -v n >/dev/null 2>&1 ]
then
    echo "::[ Already Installed ] 'n'"
else
    echo "::[ Installing ] 'n'"
    curl -L https://git.io/n-install | bash
    # curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o n
    # bash n lts
fi

