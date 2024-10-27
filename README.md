# .files

A collection of my dotfiles.
With these files I ensure the same experience for multiple workstations.

[What are Dotfiles?](https://se-education.org/learningresources/contents/dotfiles/Dotfiles.html)

## Setup

The setup is pretty easy.
I use gnu stow to setup everything in this directory.

If you do not have gnu stow installed yet you can use apt to do so:

    sudo apt install stow

When you are all set you can clone this repository into the user home dir:

    cd ~
    git clone https://github.com/lukas412/.files.git

Go into the directory and run stow:

    cd ~/.files
    stow .

Everything should be symlinked.
When there are errors:

1. read the error message of stow
2. note down all files that could not be linked
3. backup and remove the original file and try again `stow .`

## Requirements

> **Php Composer**
> 
> [Website >>](https://getcomposer.org/download/)

> **Zsh Vi Mode**
> ```bash
> git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH_CUSTOM/plugins/zsh-vi-mode
> ```
> [Github >>](https://github.com/jeffreytse/zsh-vi-mode)

> **Bat**
> ```bash
> cargo install bat --locked
> ```
> [Github >>](https://github.com/sharkdp/bat?tab=readme-ov-file#installation)

> **Starship**
> ```bash
> cargo install --locked starship
> ```
> [Github >>](https://github.com/starship/starship)
