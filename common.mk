# --- ~/mayhem/dotdot/common.mk ---
BLUE         := $(shell tput -Txterm setaf 4)
CYAN         := $(shell tput -Txterm setaf 6)
GREEN        := $(shell tput -Txterm setaf 2)
RED          := $(shell tput -Txterm setaf 1)
BOLD         := $(shell tput -Txterm bold)
RESET        := $(shell tput -Txterm sgr0)

# Global ignore path
.DEFAULT_GOAL := help

# This Regex now captures:
# 1. Normal targets (install:)
# 2. Pattern targets (%-install:)
# 3. Targets with dashes (theme-check:)
HELP_RE := ^[a-zA-Z%_-]+:.*?## .*$$

