PIPX_PATH  := /opt/homebrew/bin/pipx
PYENV_PATH := /opt/homebrew/bin/pyenv

guhcampos-python-workstation: \
	$(PYENV_PATH) \
	$(PIPX_PATH) \
	${HOME}/.local/bin/poetry

pipx: | $(PIPX_PATH)
pyenv: | $(PYENV_PATH)

$(PYENV_PATH):
	brew install pyenv

$(PIPX_PATH):
	brew install pipx

${HOME}/.local/bin/poetry:
	pipx install poetry
