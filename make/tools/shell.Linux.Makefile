STARSHIP_PATH = /usr/local/bin/starship

guhcampos-shell: $(STARSHIP_PATH)

$(STARSHIP_PATH):
	curl -sS https://starship.rs/install.sh | sh -s -- -y
