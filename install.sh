#!/bin/sh

echo ""
echo "============================="
echo " Installing Heyninck System "
echo "============================="
echo ""

# 1. Téléchargement du binaire depuis GitHub Releases
echo "➡️  Téléchargement du binaire..."
curl -L "https://github.com/valentinheyninck/heyninck/releases/latest/download/heyninck" -o /tmp/heyninck

# Vérifier si le téléchargement a fonctionné
if [ ! -f /tmp/heyninck ]; then
    echo "❌ ERREUR : Le binaire n'a pas été téléchargé."
    echo "URL invalide ou release incorrecte."
    exit 1
fi

# 2. Donner les droits d'exécution
echo "➡️  Application des permissions..."
chmod +x /tmp/heyninck

# 3. Trouver le bon dossier pour installer (M1/M2/M3 ou Intel)
echo "➡️  Détection du dossier d'installation..."

if [ -d "/opt/homebrew/bin" ]; then
    INSTALL_DIR="/opt/homebrew/bin"
elif [ -d "/usr/local/bin" ]; then
    INSTALL_DIR="/usr/local/bin"
else
    # fallback hardcore, crée le dossier
    INSTALL_DIR="/usr/local/bin"
    sudo mkdir -p "$INSTALL_DIR"
fi

echo "➡️  Installation dans : $INSTALL_DIR"

# 4. Déplacement du binaire
sudo mv /tmp/heyninck "$INSTALL_DIR/heyninck"

# 5. Vérifier si le binaire est accessible
if command -v heyninck >/dev/null 2>&1; then
    echo ""
    echo "✅ Installation terminée avec succès !"
    echo "➡️  Vous pouvez maintenant lancer : heyninck"
    echo ""
    exit 0
else
    echo ""
    echo "⚠️  Le binaire est installé mais ne semble pas dans le PATH."
    echo "   Ajoutez ceci à votre ~/.zshrc :"
    echo "   export PATH=\"$INSTALL_DIR:\$PATH\""
    echo ""
    echo "Puis rechargez : source ~/.zshrc"
fi
