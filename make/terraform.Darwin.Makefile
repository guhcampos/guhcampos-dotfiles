/opt/homebrew/bin/tfswitch: $(BREW_PATH)
	$(BREW_PATH) install warrensbox/tap/tfswitch

/opt/homebrew/bin/tfenv: $(BREW_PATH)
	$(BREW_PATH) install tfenv

/opt/homebrew/bin/tflint: $(BREW_PATH)
	$(BREW_PATH) install tflint
