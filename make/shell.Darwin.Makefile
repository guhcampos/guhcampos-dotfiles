STARSHIP_PATH = /usr/local/bin/starship
BREW_PATH = /opt/homebrew/bin/brew

guhcampos-shell: $(STARSHIP_PATH)

$(STARSHIP_PATH):
	sudo mkdir /usr/local/bin
	curl -sS https://starship.rs/install.sh | sh -s -- -y
