---
date-created: 2025-02-03 23:38:19
date-modified: 2026-11-05 21:08:09
tags: []
---

# GUHCAMPOS-DOTFILES

My dotfiles for Linux and MacOS.

## MANAGING CONFIGURATION

### DOTFILES IN `${HOME}`

Dotfiles that live directly in `${HOME}` go into `./dotfiles/home`, with dot prefixes replaced by and underscore (`_`). The main `Makefile` contains a wildcard target that places symbolic links in the correct paths pointing back to this repository, so changes made to the files in their default paths are reflected into git. This includes shell customization files such as `.bashrc`, `.bash_profile`, `.zshrc` and `.profile`.

If you add new dotfiles to the setup, make sure to include them as a dependency for the `guhcampos-dotfiles` target in the `Makefile`.

### SHELL CUSTOMIZATION

I prefer the `bash` shell over `zsh`, so all configuration here is specific to `bash`.

All non-trivial shell customization goes into `dotfiles/home/_config/bash.d` which gets mapped to `${HOME}/.config/bash.d` - this directory contains ordered shell scripts which must be sourced by the shell. Loading these scripts is handled by `.bashrc`.

Code in `.bash_profile` and `.profile` should be kept to a minimum.

### TOOL INSTALATION

A rudimentary feature management

## INSTALLING

> [!warning]
> This will replace configuration files in `${HOME}` without warning, make sure you know what you are doing before proceeding.

1. Make sure `git` and `make` are installed in the system.
2. Clone this repository preferrably into `${HOME}/workspace/guhcampos/guhcampos-dotfiles`.
3. Run `make`.

All managed files in `${HOME}` will be replaced by symbolic links pointing back to this repository.
