#!/bin/bash
# Rebuild the current checkout and install it to /Applications, replacing the running copy.
# You decide what to build — `git pull` (or check out a branch) first, then run this.
# Usage: ./Scripts/install-local.sh [version]
set -euo pipefail

cd "$(dirname "$0")/.." || exit 1

echo "▸ Building signed Tinycast.app (Release)…"
./Scripts/build-dmg.sh "$@"

APP="build/DerivedData/Build/Products/Release/Tinycast.app"
echo "▸ Installing to /Applications (replaces the running copy)…"
osascript -e 'quit app "Tinycast"' 2>/dev/null || true
ditto "$APP" /Applications/Tinycast.app
open /Applications/Tinycast.app

echo "✓ /Applications/Tinycast.app installed and launched"
