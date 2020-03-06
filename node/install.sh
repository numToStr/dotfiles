#!/bin/sh

if command -v n >/dev/null 2>&1; then
    echo "::[ Already Installed ] 'n'"
    echo "::[ Updating ] 'n'"
    sh -c "n-update -y"
else
    echo "::[ Installing ] 'n'"
    rm -rf $HOME/n
    curl -L https://git.io/n-install | bash -s -- -y -n
fi

