# dotfiles

my dotfiles

## Install

```sh
git clone https://github.com/TSLsun/dotfiles.git
cd dotfiles && ./install
```

## Quick Notes

### dotbot

- adopt [anishathalye/dotbot](https://github.com/anishathalye/dotbot)
  - `git submodule add https://github.com/anishathalye/dotbot`
- maintain `install.conf.yaml` for the links of dotfiles and shell commands etc.
- run `./install` whenever a new dotfile is added

### zsh

- adopt [zimfw/zimfw](https://github.com/zimfw/zimfw) to manage zsh 
  - maintain `.zimrc` for zsh modules
  - usages:
    - Add new modules to `~/.zimrc`: run `zimfw install`
    - Remove modules from `~/.zimrc`: run `zimfw uninstall`
    - Update modules to latest: run `zimfw update`
    - Upgrade zimfw to latest: run `zimfw upgrade`
- theme
  - [romkatv/powerlevel10k](https://github.com/romkatv/powerlevel10k)
- modules
  - [zimfw/git](https://github.com/zimfw/git) - handy git aliases and functions

### vim

- vim-plug

### tmux

- tpm
