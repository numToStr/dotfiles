#!/bin/sh

# IP Address Utilities
function ipInternal() {
    # echo "Ethernet :: IP => $( ip -4 -o a show wlan1 | awk '{ print $4 }' )"
    echo "Wireless :: IP => $( ip -4 -o a show wlo1 | awk '{ print $4 }' )"
}

function ipExternal() {
    echo "External :: IP => $( curl --silent https://ifconfig.me )"
}

function ipinfo() {
    ipInternal
    ipExternal
}

alias myip=ipInternal

