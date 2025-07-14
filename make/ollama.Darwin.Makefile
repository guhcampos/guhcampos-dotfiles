.PHONY: ollama
ollama: /opt/homebrew/bin/ollama

/opt/homebrew/bin/ollama: $(BREW_PATH)
	$(BREW_PATH) install ollama
	ollama pull deepseek-r1
