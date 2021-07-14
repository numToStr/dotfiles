.PHONY = setup install update purge

.DEFAULT_GOAL = setup

SCRIPT_PATH = ./scripts/.dotscripts

setup:
	@echo "~>> [[ DOTFILES ]] <<~"
	@echo ""
	@bash -c $(SCRIPT_PATH)/setup
	@bash -c $(SCRIPT_PATH)/install
	@bash -c $(SCRIPT_PATH)/post_setup

install:
	@echo "~>> [[ Installing ]] <<~"
	@echo ""
	@bash -c $(SCRIPT_PATH)/install

update:
	@echo "~>> [[ Updating ]] <<~"
	@echo ""
	@bash -c $(SCRIPT_PATH)/update
	@bash -c $(SCRIPT_PATH)/install

purge:
	@echo "~>> [[ Purging ]] <<~"
	@echo ""
	@bash -c $(SCRIPT_PATH)/purge
