#!/bin/bash
set -euo pipefail

# Use Omarchy's installer, not bare package installation: this also sets
# Ghostty as the preferred terminal and connects it to dynamic themes.
omarchy install terminal ghostty
omarchy install browser chrome
