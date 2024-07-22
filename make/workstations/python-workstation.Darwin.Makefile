guhcampos-python-workstation: \
	/opt/homebrew/bin/pyenv \
	/opt/homebrew/bin/pipx \
	${HOME}/.local/bin/ansible-playbook \
	${HOME}/.local/bin/poetry

/opt/homebrew/bin/pyenv:
	brew install pyenv

/opt/homebrew/bin/pipx:
	brew install pipx

${HOME}/.local/bin/poetry:
	pipx install poetry

${HOME}/.local/bin/ansible-playbook:
	pipx install --include-deps ansible
