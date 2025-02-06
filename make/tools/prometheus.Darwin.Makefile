.PHONY: prometheus

prometheus: /opt/homebrew/bin/promtool
prometheus: /opt/homebrew/bin/prometheus

/opt/homebrew/bin/prometheus: $(BREW_PATH)
	$(BREW_PATH) install prometheus

/opt/homebrew/bin/promtool: $(BREW_PATH)
	$(BREW_PATH) install prometheus
