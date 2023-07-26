#!/bin/bash

# Function to import a repository
import_repo() {
    local host="127.0.0.1"
    local port="23231"
    # local keyfile="$HOME/.ssh/id_ed25519"
    local keyfile="/root/.ssh/id_rsa"
    local repo_name="$1"
    local repo_url="$2"

    ssh -p "$port" -i "$keyfile" "$host" repo import -m "$repo_name" "$repo_url"
    echo "🗃️ Added $repo_name mirror..."
}

# List of repositories to import (add more as needed)
repos=(
    "data-platform https://github.com/ministryofjustice/data-platform"
    "cloud-platform-environments https://github.com/ministryofjustice/cloud-platform-environments"
)

# Loop through the list and import repositories
for repo in "${repos[@]}"; do
    import_repo $repo
done

echo "✅ All repository mirrors added."