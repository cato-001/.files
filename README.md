# .files

A collection of my dotfiles.

## Setup

The setup is pretty easy.
I use gnu stow to setup everything in this directory.

Simply `cd` into this directory and run:

    stow .

Everything should be symlinked.
When there are errors:

1. read the error message of stow
2. note down all files that could not be linked
3. backup and remove the original file and try again `stow .`

## Requirements

> **NeoVim**
> fd, ripgrep, go, luarocks, rustup, php, composer
    
