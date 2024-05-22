#!/usr/bin/env bash
set -Eeuo pipefail

dofiles_repo=https://github.com/roberthamel/dotfiles-macos.git
file_marker="$HOME/.local/macos-configured"
did_install_dotfiles=false

dotfiles() {
  if [ ! -d "$HOME/.local/share/chezmoi" ]; then
  	echo "::: dotfiles"
    sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $dotfiles_repo
    did_install_dotfiles=true
    echo "✅ Configured dotfiles"
  else
    echo "Skipping dotfiles configuration"
  fi
}

brewsetup() {
  if ! command -v brew &> /dev/null
	then
		echo "::: Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > /dev/null
    brew install mas
    echo "✅ Installed Homebrew"
  else
    echo "::: Skipping Homebrew installation"
  fi
}

devbox() {
  if ! command -v devbox &> /dev/null; then
		echo "::: devbox"
    curl -fsSL https://get.jetify.com/devbox | bash
    echo "✅ Installed devbox"
  else
    echo "Skipping devbox installation"
  fi
}

omz() {
  if [ ! -d "$HOME/.oh-my-zsh" ]; then
	echo "::: oh-my-zsh"
    export SHELL=/opt/homebrew/bin/zsh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" > /dev/null
    echo "✅ Installed oh-my-zsh"
  else
    echo "Skipping oh-my-zsh installation"
  fi
}

brewinstall() {
  echo "::: Install from Brewfile"
	brew bundle install --global --no-lock --force
}

system() {
  echo "::: MacOS"
  if [ ! -d "$file_marker" ]; then
    # Disable the sound effects on boot
    sudo nvram SystemAudioVolume=" "
    # Increase window resize speed for Cocoa applications
    defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
    # Finder: disable window animations and Get Info animations
    defaults write com.apple.finder DisableAllAnimations -bool true
    # Finder: show path bar
    defaults write com.apple.finder ShowPathbar -bool true
    # When performing a search, search the current folder by default
    defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
    # Show the ~/Library folder
    chflags nohidden $HOME/Library
    # Wipe all (default) app icons from the Dock
    # This is only really useful when setting up a new Mac, or if you don’t use
    # the Dock to launch apps.
    defaults write com.apple.dock persistent-apps -array
    # Show only open applications in the Dock
    defaults write com.apple.dock static-only -bool true
    # Remove the auto-hiding Dock delay
    defaults write com.apple.dock autohide-delay -float 0
    # Remove the animation when hiding/showing the Dock
    defaults write com.apple.dock autohide-time-modifier -float 0
    # Automatically hide and show the Dock
    defaults write com.apple.dock autohide -bool true
    # Only use UTF-8 in Terminal.app
    defaults write com.apple.terminal StringEncodings -array 4
    # Don’t display the annoying prompt when quitting iterm
    defaults write com.googlecode.iterm2 PromptOnQuit -bool false

    # Save a file to mark that this process has been completed successfully at least once
    touch $file_marker
  fi
}

main() {
	brewsetup
	devbox
	omz
	dotfiles
	brewinstall
	system
}
start_time=$(date +%s)
main
end_time=$(date +%s)
elapsed_time=$(($end_time - $start_time))
minutes=$(($elapsed_time / 60))
seconds=$(($elapsed_time % 60))
echo "Elapsed time: $minutes minute(s) $seconds second(s)"
echo "exit $?"
