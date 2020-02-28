#!/bin/sh

if [ command -v yarn >/dev/null 2>&1 ]
then
    echo "::[ Already Installed ] 'yarn'"
else
    echo "::[ Installing ] 'yarn'"
    curl -o- -L https://yarnpkg.com/install.sh | bash
fi

