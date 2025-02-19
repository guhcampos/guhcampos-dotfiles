ANSIBLE_PATH    := $(HOME)/.local/bin/ansible
ANSIBLE_VERSION := 9.8.0 # maximum version supported by mitogen
MITOGEN_PATH    := $(HOME)/.ansible/plugins/mitogen
MITOGEN_REPO    := git@github.com:mitogen-hq/mitogen.git

guhcampos-ansible-workstation: | ansible
guhcampos-ansible-workstation: | ansible-mitogen

ansible:         | $(ANSIBLE_PATH)
ansible-mitogen: | $(MITOGEN_PATH)/mitogen/__init__.py

$(ANSIBLE_PATH): | $(PIPX_PATH)
	$(PIPX_PATH) install --include-deps ansible==$(ANSIBLE_VERSION)

$(MITOGEN_PATH)/mitogen/__init__.py:
	git clone $(MITOGEN_REPO) $(HOME)/.ansible/plugins/mitogen/
git@github.com:mitogen-hq/mitogen.git
