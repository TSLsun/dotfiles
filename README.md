# dotfiles

## New Machine Setup

1. Install Homebrew
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Set up SSH for GitHub ([guide](https://docs.github.com/en/authentication/connecting-to-github-with-ssh))

```sh
ssh-keygen -t ed25519 -C YOUR_EMAIL
eval "$(ssh-agent -s)"
```

```
# ~/.ssh/config
Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
```

```sh
pbcopy < ~/.ssh/id_ed25519.pub
# Paste at: GitHub → Settings → SSH and GPG keys
```

3. Clone and bootstrap

```sh
mkdir -p ~/Repos && cd ~/Repos
git clone git@github.com:TSLsun/dotfiles.git
cd dotfiles && ./bootstrap
```

The `bootstrap` script will:
- Copy template files to machine-local overrides (gitignored)
- Prompt for your git name and email
- Optionally clone a private dotfiles repo (for work configs)
- Run `./install` to apply all symlinks

4. Install tmux plugins — inside a tmux session, press `Prefix + I`

---

## Config Architecture

Three layers, each extending the one above without modifying it:

```
Layer 1  dotfiles (this repo, public)        shared tools, editor config, shell practices
           ↓ sources if present
Layer 2  dotfiles-private (private repo)     work email, work aliases, internal tools
           ↓ sources if present
Layer 3  machine-local (gitignored)          JAVA_HOME, conda, NVM, gcloud paths
```

Layers 2 and 3 are optional — safe to skip on personal machines.

### Files you manage per machine

| File | Purpose | Where |
|------|---------|-------|
| `shell/zshrc_local` | Machine paths (Java, conda, NVM, gcloud) | Gitignored; copy from `shell/zshrc_local.template` |
| `git/gitconfig_local` | Your name + email | Gitignored; copy from `git/gitconfig_local.template` |
| `Brewfile.local` | Machine-specific apps | Gitignored; copy from `Brewfile.local.template` |
| `~/.zshrc_work` | Work aliases, internal tools | From private repo — never in this repo |
| `~/.gitconfig_work` | Work git identity | From private repo — never in this repo |
| `~/.secrets` | API keys, tokens | Never in any repo; store values in a password manager |

### Syncing an improvement

```sh
# On the machine where you made the change:
git add <files> && git commit -m "..." && git push

# On other machines:
git pull && ./install
```

To bring a work practice into your personal config: copy the generic pattern into a tracked file here; leave the work-specific values in `~/.zshrc_work`.

---

## Maintenance Quick Reference

| Command | Purpose |
|---------|---------|
| `./install` | Re-apply all symlinks (safe to re-run anytime) |
| `./bootstrap` | First-time setup on a new machine |
| `brew bundle dump --describe --force --file ~/.config/Brewfile` | Update Brewfile after installing new tools |
| `zimfw update` | Update zsh modules |
| `Prefix + I` | Install new tmux plugins |
| `Prefix + U` | Update tmux plugins |

---

## Tool Notes

### Homebrew

- Update the Brewfile after installing new tools:
  ```sh
  brew bundle dump --describe --force --file ~/.config/Brewfile
  ```
- Machine-specific packages go in `Brewfile.local` (gitignored, copied from `Brewfile.local.template`)

### dotbot

- Adopted from [anishathalye/dotbot](https://github.com/anishathalye/dotbot) (git submodule)
- Edit `install.conf.yaml` to add new symlinks or setup steps
- Run `./install` whenever a new dotfile is added

### zsh

- Framework: [zimfw/zimfw](https://github.com/zimfw/zimfw)
  - `~/.zimrc` declares modules
  - `zimfw install` — install new modules
  - `zimfw uninstall` — remove modules
  - `zimfw update` — update all modules
  - `zimfw upgrade` — upgrade zimfw itself
- Theme: [romkatv/powerlevel10k](https://github.com/romkatv/powerlevel10k) — run `p10k configure` to reconfigure
- Notable modules: [zimfw/git](https://github.com/zimfw/git) git aliases (prefix `g`)

### vim

- Neovim (primary): config in `nvim/`, managed with packer
- Vim fallback: `vim/vimrc`
- IdeaVim (JetBrains): `vim/ideavimrc`

### tmux

Plugin manager: [tmux-plugins/tpm](https://github.com/tmux-plugins/tpm)

| Binding | Action |
|---------|--------|
| `Prefix + I` | Install plugins |
| `Prefix + U` | Update plugins |
| `Prefix + Alt+u` | Remove unused plugins |

### window management (macOS)

Install [yabai](https://github.com/koekeishiya/yabai) and [skhd](https://github.com/koekeishiya/skhd):

```sh
brew install koekeishiya/formulae/yabai koekeishiya/formulae/skhd
brew services start yabai
brew services start skhd
```

Key bindings: `config/skhd/skhdrc` | Window layout: `config/yabai/yabairc`

### Private dotfiles repo structure

When you create `dotfiles-private`, mirror this repo's structure:

```
dotfiles-private/
  install                  ← same dotbot script as this repo
  install.conf.yaml        ← symlinks zshrc_work, gitconfig_work into ~
  shell/zshrc_work         ← work aliases, internal tool configs
  git/gitconfig_work       ← work git identity and signing key
  Brewfile.private         ← work-only tools
```
