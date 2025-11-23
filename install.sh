#!/bin/sh

echo "Installing Heyninck..."

# Télécharger le binaire depuis GitHub Releases
curl -L https://github.com/valentinheyninck/heyninck/releases/latest/download/heyninck -o /tmp/heyninck

# Donner les droits
chmod +x /tmp/heyninck

# Détecter le bon dossier du PATH
if [ -d "/opt/homebrew/bin" ]; then
    TARGET="/opt/homebrew/bin/heyninck"
else
    TARGET="/usr/local/bin/heyninck"
fi

sudo mv /tmp/heyninck "$TARGET"

echo "Installation terminée !"
echo "Tu peux maintenant lancer : heyninck"
