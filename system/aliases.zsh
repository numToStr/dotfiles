#!/bin/sh

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias py="python"
alias sysinfo="inxi -Fxxxz"

if command -v pamac >/dev/null 2>&1; then
    alias checkup="sudo pamac checkupdates -a"
    alias up="pamac upgrade -a --no-confirm"
    alias buildup="pamac build --no-confirm"
fi

if command -v pacman >/dev/null 2>&1; then
    alias upnup="sudo pacman -Syyuu"
    alias cleanup="sudo pacman -Rsn $(pacman -Qdtq)"
fi

if command -v microk8s >/dev/null 2>&1; then
    alias k="microk8s.kubectl"
    alias kube="microk8s.kubectl"
    alias kubectl="microk8s.kubectl"
fi

