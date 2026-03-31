This repository uses GNU Stow for symlink orchestration to handle configuration management.

---

## Architecture

Separates the Filesystem Layer from the Logic Layer.

```text
.
├── Makefile                # Root: Orchestrates Stow & delegates commands
├── common.mk               # Shared variables and help logic
├── .stow-global-ignore      # Global patterns for Stow to skip
├── <package>/              # Individual config folders (nvim, bashrc, etc.)
│   └── README.md           # Package-specific documentation
```

---

## Getting Started

### 1. Prerequisites

Ensure stow and make are installed on your system.

### 2. The Bootstrap

Run this first to initialize the global ignore file:

```bash
make init
```

---

## Usage

### Commands

The repository is self-documenting. For a full list of available actions:

```bash
make help
```

For systemd-specific logic and automation, refer to the documentation inside the systemd directory.

### Basic Stow Operations

- Install All: \`make install-all\`
- Specific Package: \`make <package>-install\`
- Uninstall: \`make <package>-uninstall\`

---

## Adding New Packages

1. Create a new directory (e.g., \`tmux/\`).
2. Mirror the folder structure relative to $HOME inside that folder.
3. For package-specific details or dependencies, refer to the README.md inside that package.

---

> Note: This repo manages the symlink locations. For actual application settings, see individual package READMEs.
> `;
