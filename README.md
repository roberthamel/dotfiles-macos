# macOS Dotfiles

This repository contains my personal dotfiles for macOS. It uses [chezmoi](https://www.chezmoi.io/) for managing the dotfiles, and a shell script for setting up the development environment.

## Features

- Installs and configures [Homebrew](https://brew.sh/), a package manager for macOS.
- Installs and configures [devbox](https://get.jetify.com/devbox), a development environment setup tool.
- Installs and configures [oh-my-zsh](https://ohmyz.sh/), a framework for managing Zsh configuration.
- Installs packages from a Brewfile using `brew bundle install`.
- Applies various system settings, such as disabling boot sound, increasing window resize speed, and configuring the Dock.

## Installation

To install the dotfiles and set up the development environment without cloning the repository, you can download and run the `install.sh` script directly using `curl`:

```bash
curl -o- https://raw.githubusercontent.com/roberthamel/dotfiles-macos/main/install.sh | bash
```

The script is idempotent, meaning it can be run multiple times without causing problems.

## Customization
You can customize the dotfiles and system settings by editing the files in this repository. After making changes, run the `install.sh` script again to apply them.
