# Dotfiles for Omarchy, managed by chezmoi

This repository targets **Omarchy** and is a **chezmoi source state**, not a
GNU Stow directory.
Chezmoi translates names such as `dot_zshrc` and `dot_config/ghostty/config`
to `~/.zshrc` and `~/.config/ghostty/config`.

The configuration keeps Omarchy's environment and dynamic Ghostty theme while
user overrides remain version-controlled here. Packages are installed through
`omarchy pkg add`; Zsh uses packaged completions, autosuggestions, history
substring search, and syntax highlighting.

## Bootstrap a fresh Omarchy installation

Run this after completing the initial Omarchy setup:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/hellwigio/dotfiles/master/install.sh)
```

The bootstrap:

1. verifies that it is running on Omarchy;
2. installs Git and chezmoi with `omarchy pkg add`;
3. initializes this repository as the chezmoi source state;
4. installs Ghostty and Google Chrome through their dedicated Omarchy installers;
5. installs the Zsh additions from `packages.arch` through Omarchy;
6. applies the managed configuration files;
7. changes the login shell to Zsh.

Reviewing a remote script before running it is safer:

```bash
curl -fsSL https://raw.githubusercontent.com/hellwigio/dotfiles/master/install.sh -o /tmp/dotfiles-install.sh
less /tmp/dotfiles-install.sh
bash /tmp/dotfiles-install.sh
```

Log out and back in after completion so the new login shell is used.

## Manual installation

```bash
omarchy pkg add chezmoi git
chezmoi init hellwigio
chezmoi diff
chezmoi apply
chsh -s /usr/bin/zsh
```

`chezmoi diff` is intentionally included before the first apply so existing
Omarchy configuration is never replaced without review. During `chezmoi apply`,
the `.chezmoiscripts/run_onchange_before_10-install-packages.sh.tmpl` hook installs missing entries
from `packages.arch` through Omarchy before applying the configuration files.

To install the package list manually:

```bash
xargs -r omarchy pkg add < ~/.local/share/chezmoi/packages.arch
```

## Choosing installed programs

Edit `packages.arch` to define only personal package additions to stock
Omarchy. Do not duplicate packages from
`/usr/share/omarchy/install/omarchy-base.packages`; the current list contains
only Zsh and its plugins. Ghostty and Google Chrome are installed separately
through `omarchy install terminal ghostty` and `omarchy install browser chrome`
so their Omarchy integration is configured too. Changing the package file causes the chezmoi hook to run again
on the next apply; installed packages are skipped.

## Daily use

```bash
chezmoi cd                    # open the source repository
chezmoi edit ~/.zshrc         # edit a managed file
chezmoi diff                  # preview changes
chezmoi apply                 # apply changes
chezmoi update                # pull and apply repository updates
```

Preview every change before applying it:

```bash
chezmoi diff
```

After changing a managed file directly in `$HOME`, import it back into the
source state and inspect the resulting commit:

```bash
chezmoi add ~/.zshrc
chezmoi cd
git diff
```

To adopt another changed local file back into the repository:

```bash
chezmoi add ~/.config/ghostty/config
```

## Managed files

- Zsh with Omarchy's environment, completion, autosuggestions, history search, syntax highlighting, zoxide, and Starship
- Ghostty based on Omarchy's current default config, with personal font-size and transparency overrides
- Herdr with a terminal-derived transparent panel background
- Google Chrome with Omarchy's Chromium flags, policies, Copy URL integration, and theme support
- Supermaven AI code completion for Neovim through LazyVim
- Language tooling for Go, PHP (PHPantom), Python, Rust, Zig, and Lua through LazyVim

The base Neovim configuration remains managed by Omarchy. This repository
adds personal Neovim overrides and manages `~/.config/nvim/lazyvim.json`
to enable the required LazyVim extras without duplicating the Omarchy defaults.
