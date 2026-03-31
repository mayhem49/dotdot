# --- ~/mayhem/dotdot/systemd/Makefile ---
include ../common.mk

.PHONY: help theme-on theme-off theme-check theme-logs theme-test

help: ## Display Systemd Theme commands
	@echo "$(BOLD)$(CYAN)--- Systemd Automation (Theme) ---$(RESET)"
	@grep -hE '^[a-zA-Z_-_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  $(CYAN)%-20s$(RESET) %s\n", $$1, $$2}'

theme-on: ## Enable and start the theme timer
	@chmod +x dot-config/systemd/user/scripts/*.sh
	@systemctl --user daemon-reload
	@systemctl --user enable --now theme.timer
	@echo "$(GREEN)☀️ Theme timer active.$(RESET)"

theme-off: ## Disable and stop the theme timer
	@systemctl --user disable --now theme.timer
	@echo "$(RED)🌑 Theme timer disabled.$(RESET)"

theme-check: ## Check timer schedule and service status
	@echo "$(BOLD)$(CYAN)--- Timer Schedule ---$(RESET)"
	@systemctl --user list-timers theme.timer
	@echo "\n$(BOLD)$(CYAN)--- Last Run Result ---$(RESET)"
	-@systemctl --user status theme.service --no-pager

theme-logs: ## View recent service history
	@journalctl --user -u theme.service -n 50 --no-pager

theme-test: ## Manually trigger theme evaluation
	@systemctl --user start theme.service
	@echo "$(GREEN)Done. Run 'make theme-logs' if nothing changed.$(RESET)"
