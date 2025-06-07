ifeq (Linux, $(shell uname -s))
include $(abspath make/python.Linux.Makefile)
endif

ifeq (Darwin, $(shell uname -s))
include $(abspath make/python.Darwin.Makefile)
endif

UV_PATH := $(HOME)/.local/pipx/venvs/uv/bin/uv
POETRY_PATH := $(HOME)/.local/pipx/venvs/poetry/bin/poetry

guhcampos-python: | pipx poetry pyenv uv

pipx: | $(PIPX_PATH)
poetry: | $(POETRY_PATH)
pyenv: | $(PYENV_PATH)
uv: | $(UV_PATH)

$(POETRY_PATH):
	pipx install poetry

$(UV_PATH):
	pipx install uv

${HOME}/.local/bin/poetry:
	pipx install poetry
