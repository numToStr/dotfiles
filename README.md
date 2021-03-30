# Dotfiles

My Dotfiles includes configs for vim, tmux, zsh, fzf and more. Made with blood, tears and shell.

# Installation

#### Required Dependencies

-   sudo
-   git
-   zsh
-   curl
-   [neovim-nightly](https://github.com/neovim/neovim)
-   [tmux](https://github.com/tmux/tmux)
-   node (Required for coc.nvim to work)

#### Some awesome and required stuff

> All these will be installed next time you open your terminal

-   [fzf](https://github.com/junegunn/fzf) (For fuzzing finding inside your terminal and vim)
-   [fd](https://github.com/sharkdp/fd) (Better than GNU find)
-   [ripgrep](https://github.com/BurntSushi/ripgrep) (Better than GNU grep)
-   [bat](https://github.com/sharkdp/bat) (A cat(1) clone with wings.)
-   [delta](https://github.com/dandavison/delta) (A better viewer for git and diff output)
-   [exa](https://github.com/ogham/exa) (A modern replacement for ‘ls’)
-   [zoxide](https://github.com/ajeetdsouza/zoxide) (A faster way to navigate your filesystem)
-   [yarn](https://github.com/yarnpkg/yarn) (Yarn package manager for Nodejs)
-   [snm](https://github.com/numToStr/snm) (Version Manager for Nodejs)

#### Fonts

-   [powerline-fonts](https://github.com/powerline/fonts)
-   [ttf-nerds-fonts-symbol](https://www.archlinux.org/packages/community/x86_64/ttf-nerd-fonts-symbols/)
-   [fira-code](https://github.com/tonsky/firacode)

#### Terminal

-   [Alacritty](https://github.com/alacritty/alacritty) (Recommeded for a better performance)

#### Install

```
$ git clone https://github.com/numtostr/dotfiles ~/.dotfiles
$ cd ~/.dotfiles
$ ./scripts/bootstrap
```

> After dotfiles' installation, open your terminal again. Which will start binary installation.

#### Software

Personally I use Manjaro Linux w/ KDE Plasma. So, this should work on linux.

# Inspired By

@caarlos0's [dotfiles](https://github.com/caarlos0/dotfiles)
