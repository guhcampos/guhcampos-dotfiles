.PHONY: prometheus

prometheus: /opt/homebrew/bin/promtool
prometheus: /opt/homebrew/bin/prometheus

/opt/homebrew/bin/prometheus:
	brew install prometheus

/opt/homebrew/bin/promtool:
	brew install prometheus
