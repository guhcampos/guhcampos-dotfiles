SHELL := /bin/bash

.PHONY: bfg
bfg: /usr/local/lib/java/bfg
	echo "bfg"

/usr/local/lib/java:
	mkdir -p $@

# bfg repo cleaner
/usr/local/lib/java/bfg:
	sudo curl -o $@ https://repo1.maven.org/maven2/com/madgag/bfg/1.14.0/bfg-1.14.0.jar
