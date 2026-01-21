---
id: auto-commit-push
name: Auto Commit & Push on Save
description: Automatically commit and push changes when files are saved
trigger: onFileSave
inclusion: always
---

# Auto Commit & Push Hook

This hook automatically commits and pushes changes whenever you save a file in the project.

## Configuration

- **Trigger**: File Save
- **Action**: Execute shell command
- **Command**: Git add, commit, and push

## How it works

1. When you save any file in the project
2. Git stages all changes
3. Creates a commit with timestamp
4. Pushes to remote repository

## Notes

- Requires git to be configured
- Make sure you have push access to the repository
- Commits will be created with auto-generated messages
