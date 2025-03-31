#!/bin/bash

# Tested on Navicat 15.x, 16.x, 17.x on Debian, Ubuntu, Arch.

ENDCOLOR="\e[0m"

echo -e "                                            "
echo -e "  ┌──────────────────────────────────────┐  "
echo -e "  │            !!! WARNING !!!           │  "
echo -e "  ├──────────────────────────────────────┤  "
echo -e "  │      ALL DATA can be destroyed.      │  "
echo -e "  │   Always BACKUP before continuing.   │  "
echo -e "  └──────────────────────────────────────┘  "
echo -e "                                            "

echo -e "Reset trial \e[1mNavicat Premium\e[0m:"

if [[ ! $1 =~ ^--?[Yy]([eE][sS])?$ ]]; then
  read -p "Are you sure? (y/N) " -r
  echo
  if [[ ! $REPLY =~ ^[Yy]([eE][sS])?$ ]]; then
    echo "Aborted."
    exit 0
  fi
fi

echo "Starting reset..."
DATE=$(date '+%Y%m%d_%H%M%S')

# Backup
echo "=> Creating a backup..."
cp ~/.config/dconf/user ~/.config/dconf/user.$DATE.bk
echo "The user dconf backup was created at $HOME/.config/dconf/user.$DATE.bk"
cp ~/.config/navicat/Premium/preferences.json ~/.config/navicat/Premium/preferences.json.$DATE.bk
echo "The Navicat preferences backup was created at $HOME/.config/navicat/Premium/preferences.json.$DATE.bk"

# Clear data in dconf
echo "=> Resetting..."
dconf reset -f /com/premiumsoft/navicat-premium/
echo "The user dconf data was reset"

# Remove data fields in config file
sed -i -E 's/,?"([A-F0-9]+)":\{([^\}]+)},?//g' ~/.config/navicat/Premium/preferences.json
echo "The Navicat preferences was reset"

# Done
echo "Done."

exit 0
