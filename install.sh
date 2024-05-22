#!/usr/local/env bash
set -Eeuo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

dotfiles() {
	args=("init" "--apply" "--source=${script_dir}")
	echo "Running 'chezmoi ${args[*]}'" >&2
	chezmoi "${args[@]}"
}

configure_brew() {
	echo "::: Homebrew"
  if ! command -v brew &> /dev/null
	then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > /dev/null
    brew install mas
    echo "✅ Installed Homebrew"
  else
    echo "::: Skipping Homebrew installation"
  fi
	echo "::: Create Brewfile"
	echo -e 'brew "zsh"\nbrew "bash"\nbrew "bat"\nbrew "chezmoi"\nbrew "cloudflared"\nbrew "ctop"\nbrew "devcontainer"\nbrew "direnv"\nbrew "fzf"\nbrew "git-crypt"\nbrew "git-lfs"\nbrew "git"\nbrew "jq"\nbrew "k9s"\nbrew "kubectx"\nbrew "kubernetes-cli"\nbrew "lsd"\nbrew "mkcert"\nbrew "ncdu"\nbrew "nmap"\nbrew "ripgrep"\nbrew "sqlite"\nbrew "tea"\nbrew "tmux"\nbrew "tree"\nbrew "watch"\nbrew "wget"\nbrew "yq"\ncask "1password"\ncask "1password-cli"\ncask "alfred"\ncask "balenaetcher"\ncask "docker"\ncask "iterm2"\ncask "obsidian"\ncask "rectangle"\ncask "the-unarchiver"\ncask "visual-studio-code"\nmas "Display Menu", id: 549_083_868\nmas "Draw Things: AI Generation", id: 6_444_050_820\nmas "PopClip", id: 445_189_367\nmas "SnippetsLab", id: 1_006_087_419\nmas "SSH Config Editor", id: 1_109_319_285\nmas "Tailscale", id: 1_475_387_142' > $HOME/Brewfile

}

did_install_dotfiles=false
main() {
	configure_brew
	check_chezmoi
}
main
