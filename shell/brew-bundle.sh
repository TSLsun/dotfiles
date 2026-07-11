#!/bin/sh
# Run `brew bundle` only when the Brewfile changed since the last successful run.
# dotbot invokes this from the shell phase; --no-upgrade is idempotent but slow,
# so we skip it entirely on an unchanged Brewfile. The hash is recorded only on
# success, so a failed bundle retries next time.
set -e

brewfile="$HOME/.config/Brewfile"
cache="${XDG_CACHE_HOME:-$HOME/.cache}/dotfiles/Brewfile.sha256"

hash=$(shasum -a 256 "$brewfile" | cut -d' ' -f1)
if [ "$(cat "$cache" 2>/dev/null)" = "$hash" ]; then
  echo "Brewfile unchanged — skipping brew bundle"
  exit 0
fi

brew bundle --no-upgrade --file "$brewfile"

mkdir -p "$(dirname "$cache")"
printf '%s' "$hash" > "$cache"
