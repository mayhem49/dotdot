# --- ~/mayhem/dotdot/Makefile ---
include common.mk

.PHONY: help init list install-all uninstall-all %-install %-uninstall
.DEFAULT_GOAL := help

# Package Discovery
PACKAGES     := $(shell ls -d */ | cut -f1 -d'/')

help: ## Display all available commands
	@echo "$(BOLD)$(CYAN)--- Root Commands (Filesystem) ---$(RESET)"
	@grep -hE "$(HELP_RE)" $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  $(CYAN)%-25s$(RESET) %s\n", $$1, $$2}'
	@echo ""
	@echo "$(BOLD)$(CYAN)--- Systemd Commands (Auto-Discovered) ---$(RESET)"
	@grep -hE "$(HELP_RE)" systemd/Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  $(CYAN)%-25s$(RESET) %s\n", $$1, $$2}'

# --- Bootstrap ---
STOW_IGNORE  := $(HOME)/.stow-global-ignore

init: ## Setup global stow ignore (Run this before any install)
	@ln -sf $(CURDIR)/.stow-global-ignore $(STOW_IGNORE)
	@echo "$(GREEN)✅ Global ignore linked to $(STOW_IGNORE)$(RESET)"

# --- Global Operations ---
list: ## List all detected stow packages in this repo
	@echo "$(BOLD)$(BLUE)--- Detected Packages ---$(RESET)"
	@for pkg in $(PACKAGES); do echo "  $$pkg"; done

install-all: init ## Link all available packages to home directory
	@for pkg in $(PACKAGES); do stow -v $$pkg; done
	@echo "$(GREEN)✅ All packages linked.$(RESET)"

uninstall-all: ## Remove all symlinks for all packages
	@for pkg in $(PACKAGES); do stow -D $$pkg; done
	@echo "$(RED)❌ All packages unlinked.$(RESET)"

# --- Dynamic Patterns ---
%-install: init ## Link a specific package (e.g., make nvim-install)
	@stow -v $*
	@echo "$(GREEN)✅ $* linked.$(RESET)"

%-uninstall: ## Unlink a specific package (e.g., make nvim-uninstall)
	@stow -D $*
	@echo "$(RED)❌ $* unlinked.$(RESET)"

# --- Delegation ---
theme-%: ## Run theme commands (e.g., make theme-on, make theme-check)
	@$(MAKE) --no-print-directory -C systemd theme-$*
