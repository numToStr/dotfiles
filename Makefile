.PHONY = install refresh update purge

.DEFAULT_GOAL = install

setup:
	@echo "~>> [[ DOTFILES ]] <<~"
	@echo ""
	@bash -c ./scripts/setup
	@bash -c ./scripts/install
	@bash -c ./scripts/post_setup

install:
	@echo "~>> [[ Installing ]] <<~"
	@echo ""
	@bash -c ./scripts/install

update:
	@echo "~>> [[ Updating ]] <<~"
	@echo ""
	@bash -c ./scripts/update
	@bash -c ./scripts/install

purge:
	@echo "~>> [[ Purging ]] <<~"
	@echo ""
	@bash -c ./scripts/purge
