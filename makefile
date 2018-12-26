.PHONY: help
.DEFAULT_GOAL := help

help: # https://stackoverflow.com/questions/4219255/how-do-you-get-the-list-of-targets-in-a-makefile
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$' | xargs

# Initialization ===============================================================

setup:
	@npm install -g firebase-tools@4.1.0
	@npm install && cd firebase/functions && npm install

# Build ===================================================================

build:
	@hugo -d firebase/www

# Run ===================================================================

serve:
	@hugo serve -DF -p 8080

# Deployment ===================================================================

push:
	@git push && git checkout prod && git merge master && git push && git checkout master

deploy: build
	@echo "Deploying to Firebase"
	@cd firebase && firebase deploy
