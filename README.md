# dotfiles

my dotfiles

## Install

1. Install homebrew
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Setup SSH for github (ref: [Connecting to GitHub with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh))

- generate a new key

```sh
ssh-keygen -t ed25519 -C $MY_EMAIL

eval "$(ssh-agent -s)"
```

```sh
touch ~/.ssh/config
```

```
Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
```

- copy public key and paste to github Settings > SSH and GPG keys

```sh
pbcopy < ~/.ssh/id_ed25519.pub
```


3. Clone dotfiles and install

```sh
mkdir Repos
cd Repos
```

```sh
git clone git@github.com:TSLsun/dotfiles.git
cd dotfiles && ./install
```

4. Install tmux plugins

- Create a new tmux session:
```sh
tmux new -s 🔅
```

- While using tmux install tmux plugins by:
```
C-a + I
```

## Quick Notes

### Homebrew

- To update the Brewfile: `brew bundle dump --describe --force --file ~/.config/Brewfile`

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

- [tmux-plugins/tpm](https://github.com/tmux-plugins/tpm)

  - `prefix + I`:
    - Installs new plugins from GitHub or any other git repository
    - Refreshes TMUX environment
  - `prefix + U`:
    - updates plugin(s)
  - `prefix + alt + u` (custom: `prefix + C-c`):
    - remove/uninstall plugins not on the plugin list

### window management

- install [koekeishiya/yabai](https://github.com/koekeishiya/yabai) and [koekeishiya/skhd](https://github.com/koekeishiya/skhd)
  ```sh
  brew install koekeishiya/formulae/yabai
  brew install koekeishiya/formulae/skhd
  ```
- start service
  ```sh
  brew services start yabai
  brew services start skhd
  ```
