#!/bin/bash
# Export Brew package list
brew list --formula > brew-formulas.txt
brew list --cask > brew-casks.txt
brew tap > brew-taps.txt

# Optional: Export installed services
brew services list | awk '{print $1}' > brew-services.txt

echo "Homebrew setup exported to brew-formulas.txt, brew-casks.txt, brew-taps.txt, and brew-services.txt."

