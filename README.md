# dotfiles
my dotfiles settings

## vim

**1. plain.vimrc:** when git not allowed to use

```
mkdir .vim
mkdir .vim/colors
wget -O .vim/colors/Tomorrow-Night-Bright.vim https://raw.githubusercontent.com/chriskempson/tomorrow-theme/master/vim/colors/Tomorrow-Night-Bright.vim
wget -O .vimrc https://raw.githubusercontent.com/TSLsun/dotfiles/master/vim/plain.vimrc
```

**2. vimrc** 

Install `Vundle` by `git`: [vundle](https://github.com/VundleVim/Vundle.vim)
	
```	
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Install Plugins:

Launch `vim` and run `:PluginInstall`

[YouCompleteMe](http://valloric.github.io/YouCompleteMe/#mac-os-x)

## tmux

**tmux.conf**

## zsh

**zshrc**

**aliases**
