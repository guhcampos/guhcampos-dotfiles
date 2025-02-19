guhcampos-javascript-workstation: \
	/opt/homebrew/bin/fzf \
	/opt/homebrew/bin/npm \
	/opt/homebrew/bin/npx \
	/opt/homebrew/opt/nvm/nvm.sh

/opt/homebrew/bin/npm: $(BREW_PATH)
	$(BREW_PATH) install npm

/opt/homebrew/bin/npx: $(BREW_PATH)
	$(BREW_PATH) install npx

/opt/homebrew/opt/nvm/nvm.sh: $(BREW_PATH)
	$(BREW_PATH) install nvm
