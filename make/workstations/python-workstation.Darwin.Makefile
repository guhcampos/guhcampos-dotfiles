PIPX_PATH  := /opt/homebrew/bin/pipx
PYENV_PATH := /opt/homebrew/bin/pyenv

guhcampos-python-workstation: \
	$(PYENV_PATH) \
	$(PIPX_PATH) \
	${HOME}/.local/bin/poetry

pipx: | $(PIPX_PATH)
pyenv: | $(PYENV_PATH)

$(PYENV_PATH): $(BREW_PATH)
	$(BREW_PATH) install pyenv

$(PIPX_PATH): $(BREW_PATH)
	$(BREW_PATH) install pipx

${HOME}/.local/bin/poetry: \
	$(PIPX_PATH)
	$(PIPX_PATH) install poetry
