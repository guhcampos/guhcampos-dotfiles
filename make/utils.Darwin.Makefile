AG_PATH := /opt/homebrew/bin/ag

ag: | $(AG_PATH)

$(AG_PATH):
	brew install the_silver_searcher
