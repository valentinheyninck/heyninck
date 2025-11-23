#!/bin/sh

echo "Installing Heyninck..."

# Télécharger le binaire depuis GitHub Releases
curl -L https://github.com/valentinheyninck/heyninck/releases/latest/download/heyninck -o /tmp/heyninck

# Donner les droits
chmod +x /tmp/heyninck

# Déplacer dans un dossier du PATH
sudo mv /tmp/heyninck /usr/local/bin/heyninck

echo "Installation terminée !"
echo "Tu peux maintenant lancer : heyninck"
