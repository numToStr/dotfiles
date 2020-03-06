#!/bin/sh

if command -v yarn >/dev/n; then
    echo "::[ Already Installed ] 'yarn'"
else
    echo "::[ Installing ] 'yarn'"
    curl -o- -L https://yarnpkg.com/install.sh | bash 
fi

