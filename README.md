# Useful Scripts

This repository contains useful Bash scripts designed to streamline various repetitive tasks that arise periodically.

## 1. `clone-all-repositories.sh`

Organizations often manage numerous repositories for different projects. Instead of manually cloning each repository, use this script to fetch them all at once.

### Usage Instructions:

1. **Clone the Repo:**
   - Clone this repository to your local machine.

2. **Get a Personal Access Token (PAT):**
   - Obtain a Personal Access Token with 'repo' scope permissions from your GitHub account.

3. **Set Up the Script:**
   - Either substitute the relevant variables directly in the code (only if running locally) or set them as environment variables.
   - Modify the organization name within the script or set it as an environment variable.
   - Edit the path where you want all the repositories to be downloaded.

4. **Provide Execution Permissions:**
   - Grant execution permissions to the script.
     ```bash
     chmod +x clone-all-repositories.sh
     ```

5. **Run the Script:**
   - Execute the script.
     ```bash
     ./clone-all-repositories.sh
     ```

By following these steps, you can efficiently clone all repositories associated with a specific organization. This script is particularly useful for managing large sets of projects and simplifying the cloning process.
