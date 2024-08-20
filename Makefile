SHELL := /bin/bash
include $(abspath make/tools/shell.$(shell uname -s).Makefile)
include $(abspath make/tools/git.Makefile)
include $(abspath make/workstations/python-workstation.$(shell uname -s).Makefile)
include $(abspath make/workstations/ansible-workstation.Makefile)

# these workstations are only supported on Mac so far because I don't generally
# need them on Linux or didn't prioritize it otherwise
ifeq (Darwin, $(shell uname -s))
include $(abspath make/tools/1password.$(shell uname -s).Makefile)
include $(abspath make/tools/aws.$(shell uname -s).Makefile)
include $(abspath make/tools/azure.$(shell uname -s).Makefile)
include $(abspath make/tools/k8s.$(shell uname -s).Makefile)
include $(abspath make/tools/prometheus.$(shell uname -s).Makefile)
include $(abspath make/workstations/javascript-workstation.$(shell uname -s).Makefile)
include $(abspath make/tools/util.$(shell uname -s).Makefile)
include $(abspath make/tools/web.$(shell uname -s).Makefile)
endif

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
# workstations are similar to bundles of related tools I've logically put together
# to make it easier on myself
guhcampos-dotfiles: | guhcampos-shell
guhcampos-dotfiles: | guhcampos-python-workstation
guhcampos-dotfiles: | guhcampos-ansible-workstation

ifeq (Darwin, $(shell uname -s))
guhcampos-dotfiles: | guhcampos-javascript-workstation
endif

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
	@mkdir -p $(HOME)/.vim/colors
	@ln -sf $(realpath -s $<) $@

.PHONY: clean
clean:
	rm -rf ~/.config/bash.d/*.sh

# a small hack to favor `podman` over `docker` if it's present on the machine
.PHONY: docker
docker:
	clear
	@echo "HAS_PODMAN: $(HAS_PODMAN)"
	@echo "HAS_DOCKER: $(HAS_DOCKER)"
	@echo "CMD_DOCKER: $(CMD_DOCKER)"
