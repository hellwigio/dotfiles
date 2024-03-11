#!/bin/bash
set -euo pipefail

readonly repo="hellwigio/dotfiles"

if ! command -v omarchy >/dev/null 2>&1; then
  echo "This bootstrap supports Omarchy only." >&2
  exit 1
fi

echo "Installing chezmoi and Git through Omarchy..."
omarchy pkg add chezmoi git

echo "Initializing dotfiles from GitHub..."
chezmoi init "$repo"

echo "Changes that will be applied:"
chezmoi diff || true

echo "Applying dotfiles and installing packages through Omarchy..."
chezmoi apply

if [[ $(getent passwd "$USER" | cut -d: -f7) != /usr/bin/zsh ]]; then
  echo "Changing the login shell to Zsh (your password may be requested)..."
  chsh -s /usr/bin/zsh
fi

echo
echo "Bootstrap complete. Log out and back in to start a fresh Zsh session."
