PIPX_PATH  := /usr/bin/pipx
PYENV_PATH := /home/gustavo/.pyenv/bin/pyenv

guhcampos-python-workstation: \
	$(PYENV_PATH) \
	$(PIPX_PATH) \
	${HOME}/.local/bin/poetry

pipx: | $(PIPX_PATH)
pyenv: | $(PYENV_PATH)

$(PYENV_PATH):
	curl https://pyenv.run | bash

$(PIPX_PATH):
	sudo apt install pipx

${HOME}/.local/bin/poetry:
	pipx install poetry



