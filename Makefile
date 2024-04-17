SHELL := /bin/bash
include $(abspath make/1password.$(shell uname -s).Makefile)
include $(abspath make/ansible.$(shell uname -s).Makefile)
include $(abspath make/aws.$(shell uname -s).Makefile)
include $(abspath make/azure.$(shell uname -s).Makefile)
include $(abspath make/git.Makefile)
include $(abspath make/k8s.$(shell uname -s).Makefile)
include $(abspath make/prometheus.$(shell uname -s).Makefile)
include $(abspath make/web.$(shell uname -s).Makefile)


.DEFAULT_GOAL := guhcampos-dotfiles

.PHONY: guhcampos-dotfiles
guhcampos-dotfiles: $(HOME)/.ansible.cfg
guhcampos-dotfiles: $(HOME)/.bash_profile
guhcampos-dotfiles: $(HOME)/.bashrc
guhcampos-dotfiles: $(HOME)/.config/user-dirs.dirs
guhcampos-dotfiles: $(HOME)/.dircolors
guhcampos-dotfiles: $(HOME)/.editorconfig
guhcampos-dotfiles: $(HOME)/.gitconfig
guhcampos-dotfiles: $(HOME)/.profile
guhcampos-dotfiles: $(HOME)/.starship.toml
guhcampos-dotfiles: $(HOME)/.tmux.conf
guhcampos-dotfiles: $(HOME)/.vim/colors/monokai.vim
guhcampos-dotfiles: $(HOME)/.vimrc
guhcampos-dotfiles: $(HOME)/.config/bash.d
# web development stuff
guhcampos-dotfiles: /opt/homebrew/bin/hugo
guhcampos-dotfiles: /opt/homebrew/bin/npx
# this ensures all files in ~/config/bash.d/*.sh exist:
guhcampos-dotfiles: $(addprefix $(HOME)/.config/bash.d/,$(notdir $(wildcard dotfiles/home/_config/bash.d/*.sh)))

$(HOME)/.config/bash.d:
	mkdir -p $@

$(HOME)/.config/bash.d/%.sh: dotfiles/home/_config/bash.d/%.sh
	@mkdir -p $(HOME)/.config/bash.d
	@echo "GUHCAMPOS: linking $@"
	@ln -sf $(realpath -s dotfiles/home/_config/bash.d/$*.sh) $@

$(HOME)/.%: dotfiles/home/_%
	@echo "GUHCAMPOS: linking dotfiles in $(HOME)"
	@ln -sf $(realpath -s $<) $@

.PHONY: clean
clean:
	rm -rf ~/.config/bash.d/*.sh
