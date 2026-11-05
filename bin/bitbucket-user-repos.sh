#!/bin/bash
# Downloader.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
REPOS_DIR="$PROJECT_DIR/repositories"

mkdir -p "$REPOS_DIR"
cd "$REPOS_DIR"

"$SCRIPT_DIR/repositories.py" | while IFS= read -r user_repo; do
  repo_name=$(basename "$user_repo" .git)
  if [ -d "$repo_name" ]; then
    cd "$repo_name" && git pull || echo "WARNING: pull failed for $repo_name"
    cd - > /dev/null
  else
    git clone "$user_repo" || echo "WARNING: clone failed for $repo_name"
  fi
done
