#!/bin/bash
# run-obsidian.sh

VAULT=$HOME/Documents/Obsidian\ Vault  # set your vault path

obsidian &
PID=$!
wait $PID

# After exit: Git commit + push
cd "$VAULT"
git add .
git commit -m "Auto-sync before exit: $(date '+%F %T')" || true
git push
