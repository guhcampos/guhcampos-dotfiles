PIPX_PATH  := /opt/homebrew/bin/pipx
PYENV_PATH := /opt/homebrew/bin/pyenv

pipx: | $(PIPX_PATH)
pyenv: | $(PYENV_PATH)

$(PYENV_PATH): $(BREW_PATH)
	$(BREW_PATH) install pyenv

