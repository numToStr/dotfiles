#!/bin/zsh

alias vim=$EDITOR

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias sysinfo="inxi -Fxxxz"
alias cat=bat
alias myip=ipInternal
alias h=http

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

if command -v exa >/dev/null 2>&1; then
    unalias l
    alias l="exa -abghHlS --git --group-directories-first"
fi

# If the github cli is installed then these alias will be handy
if command -v gh >/dev/null 2>&1; then
    prcreate() gh pr create -B "$1" -f
    prmerge() gh pr merge --merge --delete-branch=false "$1"
    prlist() gh pr list --state open
    prcheck() { gh pr checkout "$1" && gh pr diff }
fi

ip-internal() echo "Wireless :: IP => $( ip -4 -o a show wlo1 | awk '{ print $4 }' )"
ip-external() echo "External :: IP => $( curl --silent https://ifconfig.me )"
ipinfo() { ip-internal && ip-external }

# open_with_fzf() {
#     fd -t f -H -I | fzf -m --preview="xdg-mime query default {}" | xargs -ro -d "\n" xdg-open 2>&-
# }
# cd_with_fzf() {
#     cd $HOME && cd "$(fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)"
# }
# pacs() {
#     sudo pacman -Syy $(pacman -Ssq | fzf -m --preview="pacman -Si {}" --preview-window=:hidden --bind=space:toggle-preview)
# }
