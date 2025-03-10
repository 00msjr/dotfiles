# Dotfiles Setup

This repository contains my personal dotfiles and macOS configuration scripts for setting up a development environment.

## Features

- Automates installation of essential CLI tools, utilities, and developer software.
- Configures shell environment (`zsh`), aliases, and UI preferences.
- Applies macOS system settings for UI and usability improvements.
- Installs and configures `neovim`, `lazygit`, `sketchybar`, and other essential tools.

## Installation

To set up your system, run the following command:

```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/soup-ms/dotfiles/main/install.sh)"
```

This will:

1. Install required dependencies via Homebrew.
2. Set up system configurations.
3. Clone this repository and symlink dotfiles.
4. Apply macOS UI tweaks.

## Notes

- Ensure you have **Git** and **Homebrew** installed before running the script.
- Restart your terminal after installation to apply changes.
