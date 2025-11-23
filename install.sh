#!/bin/sh

echo ""
echo "============================="
echo " Installing Heyninck System "
echo "============================="
echo ""

# -----------------------------------
# 1. Téléchargement du binaire Heyninck
# -----------------------------------

echo "➡️  Téléchargement du binaire Heyninck..."
curl -L "https://github.com/valentinheyninck/heyninck/releases/latest/download/heyninck" -o /tmp/heyninck

if [ ! -f /tmp/heyninck ]; then
    echo "❌ ERREUR : Le binaire Heyninck n'a pas été téléchargé."
    exit 1
fi

chmod +x /tmp/heyninck

# -----------------------------------
# 2. Choix du répertoire d'installation
# -----------------------------------

echo "➡️  Détection du répertoire d'installation..."

if [ -d "/opt/homebrew/bin" ]; then
    INSTALL_DIR="/opt/homebrew/bin"
elif [ -d "/usr/local/bin" ]; then
    INSTALL_DIR="/usr/local/bin"
else
    INSTALL_DIR="/usr/local/bin"
    sudo mkdir -p "$INSTALL_DIR"
fi

echo "➡️  Installation dans : $INSTALL_DIR"

sudo mv /tmp/heyninck "$INSTALL_DIR/heyninck"

# -----------------------------------
# 3. Vérification du PATH
# -----------------------------------

if command -v heyninck >/dev/null 2>&1; then
    echo ""
    echo "✅ Installation terminée !"
    echo "➡️  Vous pouvez maintenant lancer : heyninck"
    echo ""
else
    echo ""
    echo "⚠️  Le binaire est installé mais votre PATH ne le voit pas."
    echo "Ajoutez ceci à votre ~/.zshrc :"
    echo "    export PATH=\"$INSTALL_DIR:\$PATH\""
    echo ""
    echo "Puis rechargez : source ~/.zshrc"
fi

exit 0
