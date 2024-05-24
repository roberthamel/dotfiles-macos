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
curl -fsSL https://raw.githubusercontent.com/roberthamel/dotfiles-macos/main/install.sh | bash
```

The script is idempotent, meaning it can be run multiple times without causing problems.

## Aliases and Functions
The following aliases and functions are installed for managing your dotfiles with chezmoi:

- `cm`: Shortcut for `chezmoi`.
- `cmd`: Shows the difference between the current state and the target state.
- `cma`: Applies the changes and reloads the Zsh configuration.
- `cmu`: Updates chezmoi to the latest version.
- `cmc`: Changes the current directory to the chezmoi source directory.
- `cmpush`: A function that adds all changes to the chezmoi source directory, commits them with a message, and pushes them to the remote repository. Usage: `cmpush "Your commit message"`

## Install Script

The install.sh script is a bash script that automates the setup of a macOS development environment. It installs and configures various tools and applies system settings. Here's a breakdown of its functions:

- **brewsetup()**: This function checks if Homebrew is installed. If not, it installs Homebrew. If Homebrew is already installed, it skips this step.

- **brewinstall()**: This function checks if a Brewfile.lock.json file exists. If not, it installs packages from a Brewfile using brew bundle install. If the Brewfile.lock.json file exists, it skips this step.

- **devbox()**: This function checks if devbox is installed. If not, it installs devbox. If devbox is already installed, it skips this step.

- **omz()**: This function checks if oh-my-zsh is installed. If not, it installs oh-my-zsh. If oh-my-zsh is already installed, it skips this step.

- **dotfiles()**: This function checks if chezmoi is installed. If not, it installs and applies the dotfiles from the specified repository. If chezmoi is already installed, it skips this step.

- **system()**: This function applies various system settings, such as disabling boot sound, increasing window resize speed, and configuring the Dock. It checks for the existence of a file marker to determine if the system settings have been applied before. If the file marker exists, it skips this step.

- **main()**: This function calls all the other functions in the order they should be executed.

The script also measures and prints the elapsed time for the entire setup process.

### Customization
You can customize the dotfiles and system settings by editing the files in this repository. After making changes, run the `install.sh` script again to apply them.

# Dot Aliases

This file contains a list of useful shell aliases for various commands. Here's a brief explanation of each:

- `wkgp`: Watch the status of Kubernetes pods.
- `wkgps`: Watch the status of Kubernetes pods and services.
- `wkga`: Watch the status of all Kubernetes resources.
- `wkgpaa`: Watch the status of Kubernetes pods across all namespaces.
- `wkgaa`: Watch the status of all Kubernetes resources across all namespaces.
- `npmlist`: List all globally installed npm packages.
- `dsstore`: Find and delete all .DS_Store files in the current directory and its subdirectories.
- `hidefiles`: Hide hidden files in Finder.
- `showfiles`: Show hidden files in Finder.
- `chmox`: Adds the execute permission from a file.
- `emptytrash`: Empty the Trash on all volumes and the main HDD, and clear the system's sleep image.
- `reloaddns`: Flush the DNS cache (MacOS).
- `szsh`: Reload the Zsh configuration file.
- `rc`: Open the Zsh configuration file in Visual Studio Code.
- `flushcache`: Flush the DNS cache and restart the mDNSResponder.
- `cm`: Shortcut for `chezmoi`.
- `cmd`: Show the difference between the current state and the target state in chezmoi.
- `cma`: Apply the changes in chezmoi and reload the Zsh configuration.
- `cmu`: Update chezmoi to the latest version.
- `cmc`: Change the current directory to the chezmoi source directory.
- `dc`: Shortcut for `docker compose`.

# Dot Functions

This file contains a list of useful shell functions. Here's a brief explanation of each:

- `info`: Prints the provided message in yellow color.
- `addalias`: Adds a new alias to the `.aliases` file and reloads the Zsh configuration. If no arguments are provided, it prints usage information.
- `camerausedby`: Checks which processes are currently using the iSight camera.
- `pull`: Stashes any uncommitted changes, pulls the latest changes from the remote repository, and then applies the stashed changes.
- `bandcamp`: Downloads a full album from Bandcamp using `bandcamp-dl`. If no arguments are provided, it prints usage information.
- `gac`: Adds all changes to the staging area and commits them with the provided message. If no arguments are provided, it prints usage information.
- `gact`: Adds all changes to the staging area and commits them with a timestamp as the commit message.
- `mkd`: Creates a new directory and navigates into it.
- `youtube`: Downloads a YouTube video as an MP3 file using `youtube-dl`. If no arguments are provided, it prints usage information.
- `update`: Updates Homebrew and upgrades all installed brews.
- `nah`: Resets the Git repository to the last commit and removes all untracked files.
- `newbranch`: Creates a new Git branch and pushes it to the remote repository.
- `cmpush`: Adds all changes in the chezmoi source directory to the staging area, commits them with a timestamp as the commit message, and pushes them to the remote repository.

## Dot Brewfile

This file is used by Homebrew to manage packages on macOS. It contains a list of packages (brews), casks, and Visual Studio Code extensions to be installed. Here's a brief explanation of each section:

- `Taps`: Third-party repositories for Homebrew formulas.
- `Brews`: Packages installed by Homebrew.
- `Casks`: Applications, fonts, plugins, and other non-open source software.
- `Mac App Store`: Applications from the Mac App Store.
