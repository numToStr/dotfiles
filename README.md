<h1 align="center">~/.dotfiles</h1>

<p align='center'><sub>~~ Little things that you can't live without ~~</sub></p>

### ⚠️ Requirements

#### Commands

- sudo (maybe)
- git
- bash
- make
- unzip
- GNU tar
- [GNU stow](https://github.com/aspiers/stow)
- gcc or clang (for compiling neovim treesitter parsers)

#### Fonts

These dotfiles doesn't contains any font installation so you have install them beforehand.

- [powerline-fonts](https://github.com/powerline/fonts)
- [ttf-nerds-fonts-symbol](https://www.archlinux.org/packages/community/x86_64/ttf-nerd-fonts-symbols/)
- [fira-code](https://github.com/tonsky/firacode)

### 🚀 Installation

- Clone the repository into `$HOME/.dotfiles` and `cd` into it.

```
git clone https://github.com/numtostr/dotfiles ~/.dotfiles
cd ~/.dotfiles
```

- Now run `make setup`

> NOTE: After the installation, when you'll open your terminal, or a different tab then `zinit` will start downloading some command line tools that are used inside the dotfiles.

### ✨ Commands

For convenience, I've added some `make` commands to do some regular stuff which are following:

- `setup` - For setting up the dotfiles on a new machine

- `install` - To reinstall the dotfiles, it doesn't include the setup part

- `update` - For updating the dotfiles, which will pull the latest commits and install them

- `purge` - Removes everything

### 🖥️ Software

- OS: Linux
- Distro: Manjaro
- Desktop: KDE Plasma
- Terminal: kitty

### 🙏 Credits

- @caarlos0's [dotfiles](https://github.com/caarlos0/dotfiles)
- ThePrimeagen for this [masterpiece](https://youtu.be/tkUllCAGs3c)
