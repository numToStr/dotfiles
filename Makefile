.PHONY = setup install update purge

.DEFAULT_GOAL = setup

DOT_SCRIPTS = ./scripts/.dotscripts

setup:
	@echo "~>> [[ DOTFILES ]] <<~"
	@echo
	@bash -c $(DOT_SCRIPTS)/setup
	@bash -c $(DOT_SCRIPTS)/install
	@bash -c $(DOT_SCRIPTS)/post_setup

install:
	@echo "~>> [[ Installing ]] <<~"
	@echo
	@bash -c $(DOT_SCRIPTS)/install

update:
	@echo "~>> [[ Updating ]] <<~"
	@echo
	@bash -c $(DOT_SCRIPTS)/update
	@bash -c $(DOT_SCRIPTS)/install

purge:
	@echo "~>> [[ Purging ]] <<~"
	@echo
	@bash -c $(DOT_SCRIPTS)/purge
