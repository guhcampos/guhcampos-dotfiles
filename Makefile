SHELL := /bin/bash
include $(abspath make/tools/1password.$(shell uname -s).Makefile)
include $(abspath make/tools/aws.$(shell uname -s).Makefile)
include $(abspath make/tools/azure.$(shell uname -s).Makefile)
include $(abspath make/tools/git.Makefile)
include $(abspath make/tools/k8s.$(shell uname -s).Makefile)
include $(abspath make/tools/prometheus.$(shell uname -s).Makefile)
include $(abspath make/tools/util.$(shell uname -s).Makefile)
include $(abspath make/tools/web.$(shell uname -s).Makefile)
include $(abspath make/workstations/python-workstation.$(shell uname -s).Makefile)
include $(abspath make/workstations/javascript-workstation.$(shell uname -s).Makefile)
include $(abspath make/workstations/ansible-workstation.$(shell uname -s).Makefile)

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
guhcampos-dotfiles: $(HOME)/.tfswitch.toml
guhcampos-dotfiles: $(HOME)/.tmux.conf
guhcampos-dotfiles: $(HOME)/.vim/colors/monokai.vim
guhcampos-dotfiles: $(HOME)/.vimrc
guhcampos-dotfiles: $(HOME)/.config/bash.d
guhcampos-dotfiles: $(HOME)/.config/cookiecutter.yaml
guhcampos-dotfiles: $(HOME)/.config/direnv
guhcampos-dotfiles: $(HOME)/.config/direnv/direnvrc
################################################################################
# web development
################################################################################
guhcampos-dotfiles: | guhcampos-python-workstation
guhcampos-dotfiles: | guhcampos-javascript-workstation
guhcampos-dotfiles: | guhcampos-ansible-workstation
# this ensures all files in ~/config/bash.d/*.sh exist:
guhcampos-dotfiles: $(addprefix $(HOME)/.config/bash.d/,$(notdir $(wildcard dotfiles/home/_config/bash.d/*.sh)))

$(HOME)/.config/bash.d/%.sh: dotfiles/home/_config/bash.d/%.sh
	@mkdir -p $(HOME)/.config/bash.d
	@echo "GUHCAMPOS: linking $@"
	@ln -sf $(realpath -s dotfiles/home/_config/bash.d/$*.sh) $@

$(HOME)/.config/bash.d:
	mkdir -p $@

$(HOME)/.config/direnv:
	mkdir -p $@

$(HOME)/.%: dotfiles/home/_%
	@echo "GUHCAMPOS: linking dotfiles in $(HOME)"
	@ln -sf $(realpath -s $<) $@

.PHONY: clean
clean:
	rm -rf ~/.config/bash.d/*.sh

.PHONY: docker
docker:
	clear
	@echo "HAS_PODMAN: $(HAS_PODMAN)"
	@echo "HAS_DOCKER: $(HAS_DOCKER)"
	@echo "CMD_DOCKER: $(CMD_DOCKER)"
