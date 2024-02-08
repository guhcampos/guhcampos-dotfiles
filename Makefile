SHELL := /bin/bash

.DEFAULT_GOAL := guhcampos-home

.PHONY: guhcampos-home
guhcampos-home: $(HOME)/.ansible.cfg
guhcampos-home: $(HOME)/.bash_profile
guhcampos-home: $(HOME)/.bashrc
guhcampos-home: $(HOME)/.config/user-dirs.dirs
guhcampos-home: $(HOME)/.dircolors
guhcampos-home: $(HOME)/.editorconfig
guhcampos-home: $(HOME)/.gitconfig
guhcampos-home: $(HOME)/.profile
guhcampos-home: $(HOME)/.starship.toml
guhcampos-home: $(HOME)/.tmux.conf
guhcampos-home: $(HOME)/.vim/colors/monokai.vim
guhcampos-home: $(HOME)/.vimrc
guhcampos-home: $(HOME)/.config/bash.d
# this ensures all files in ~/config/bash.d/*.sh exist:
guhcampos-home: $(addprefix $(HOME)/.config/bash.d/,$(notdir $(wildcard dotfiles/home/_config/bash.d/*.sh)))

$(HOME)/.config/bash.d:
	mkdir -p $@

$(HOME)/.config/bash.d/%.sh: dotfiles/home/_config/bash.d/%.sh
$(HOME)/.config/bash.d/%.sh: $(HOME)/.config/bash.d
	ln -sf $(realpath -s dotfiles/home/_config/bash.d/$*.sh) $@

$(HOME)/.%: dotfiles/home/_%
	ln -sf $(realpath -s $<) $@

.PHONY: clean
clean:
	rm -rf ~/.config/bash.d/*.sh
