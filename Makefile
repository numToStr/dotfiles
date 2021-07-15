.PHONY := setup install update purge

.DEFAULT_GOAL := setup

DOT_SCRIPTS = ./scripts/.dotscripts
STOW = $(shell command -v stow 2> /dev/null)

check_stow:
ifndef STOW
	$(error No 'stow' in $$PATH, consider installing GNU stow from https://github.com/aspiers/stow)
endif

setup: check_stow
	@echo "~>> [[ DOTFILES ]] <<~"
	@echo
	@bash -c $(DOT_SCRIPTS)/setup
	@bash -c $(DOT_SCRIPTS)/install
	@bash -c $(DOT_SCRIPTS)/post_setup

install: check_stow
	@echo "~>> [[ Installing ]] <<~"
	@echo
	@bash -c $(DOT_SCRIPTS)/install

update: check_stow
	@echo "~>> [[ Updating ]] <<~"
	@echo
	@bash -c $(DOT_SCRIPTS)/update
	@bash -c $(DOT_SCRIPTS)/install

purge: check_stow
	@echo "~>> [[ Purging ]] <<~"
	@echo
	@bash -c $(DOT_SCRIPTS)/purge
