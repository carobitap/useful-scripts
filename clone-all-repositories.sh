#!/bin/bash

ORG_NAME="your-organization"
DEST_PATH="/path/to/save/repos"

# Set your GitHub personal access token with 'repo' scope
GITHUB_TOKEN="some-token"

# GitHub API endpoint to list repositories in the organization
API_ENDPOINT="https://api.github.com/orgs/$ORG_NAME/repos"

# Create the destination directory if it doesn't exist
mkdir -p "$DEST_PATH"

# Function to clone a repository
clone_repo() {
    REPO_NAME="$1"
    REPO_URL="https://github.com/$ORG_NAME/$REPO_NAME.git"
    git clone "$REPO_URL" "$DEST_PATH/$REPO_NAME"
}

# Clone repositories based on the 'per_page' parameter
clone_repositories_with_pagination() {
    per_page="$1"
    page=1

    while true; do
        response=$(curl -s -H "Authorization: token $GITHUB_TOKEN" "$API_ENDPOINT?page=$page&per_page=$per_page")

        # Check if there are more repositories
        if [ "$(echo "$response" | jq -r 'length')" -eq 0 ]; then
            break
        fi

        clone_repositories_on_page "$response"
        page=$((page + 1))
    done
}

# Clone repositories on the specified page
clone_repositories_on_page() {
    repos=$(echo "$1" | jq -r '.[].name')
    for repo in $repos; do
        echo "Cloning $repo..."
        clone_repo "$repo"
    done
}

# Specify the number of repositories to fetch per page
per_page=100

# Clone repositories with pagination
clone_repositories_with_pagination "$per_page"

echo "Cloning complete!"
