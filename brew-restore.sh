#!/bin/bash

# Install Homebrew if it’s not already installed
if ! command -v brew &>/dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Reinstall taps
echo "Restoring Homebrew taps..."
while read tap; do
    brew tap "$tap"
done < brew-taps.txt

# Reinstall formulas
echo "Restoring Homebrew formulas..."
while read formula; do
    brew install "$formula"
done < brew-formulas.txt

# Reinstall casks
echo "Restoring Homebrew casks..."
while read cask; do
    brew install --cask "$cask"
done < brew-casks.txt

# Optional: Start services
echo "Starting Homebrew services..."
while read service; do
    brew services start "$service"
done < brew-services.txt

echo "Homebrew setup restored."

