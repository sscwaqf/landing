.PHONY: build test help
.DEFAULT_GOAL := help

help: # https://stackoverflow.com/questions/4219255/how-do-you-get-the-list-of-targets-in-a-makefile
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$' | xargs

# Initialization ===============================================================

setup:
	@npm install -g firebase-tools@4.0.2
	@npm install && cd firebase/functions && npm install
	@npm run post-install

# Build ===================================================================

build-functions:
	@npm run --prefix ./firebase/functions build

# Run ===================================================================

serve:
	@hugo serve -DF -p 8080

# Deployment ===================================================================

push:
	@git push && git checkout prod && git merge master && git push && git checkout master

deploy:
	@hugo -d /scratch/waqf/landing
	@echo "Deploying to Firebase"
	@cd firebase && firebase deploy
