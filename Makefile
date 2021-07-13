.SHELL=/bin/bash

.PHONY = install

.DEFAULT_GOAL = install

install:
	@echo ">> Installation Begins <<"
	@bash -c ./scripts/install
