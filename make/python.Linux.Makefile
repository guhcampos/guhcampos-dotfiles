PIPX_PATH  := /usr/bin/pipx
PYENV_PATH := /home/gustavo/.pyenv/bin/pyenv

pipx: | $(PIPX_PATH)
pyenv: | $(PYENV_PATH)

$(PYENV_PATH):
	curl https://pyenv.run | bash



