# Setup Guide - Push to GitHub

Follow these steps to get your Python learning repository on GitHub!

## Prerequisites

- Git installed on your computer
- GitHub account created
- Basic terminal/command line knowledge

## Step 1: Download the Repository

You should have downloaded the `python-learning` folder. Place it wherever you want on your computer (e.g., `~/Documents/` or `C:\Users\YourName\Projects\`).

## Step 2: Navigate to the Folder

Open your terminal (Mac/Linux) or Command Prompt/PowerShell (Windows) and navigate to the folder:

```bash
cd /path/to/python-learning
```

For example:
- Mac/Linux: `cd ~/Documents/python-learning`
- Windows: `cd C:\Users\YourName\Documents\python-learning`

## Step 3: Initialize Git

Run this command to initialize Git in the folder:

```bash
git init
```

## Step 4: Add All Files

Add all the files to Git:

```bash
git add .
```

## Step 5: Make Your First Commit

Commit the files with a message:

```bash
git commit -m "Initial commit: Python learning repository structure"
```

## Step 6: Create a GitHub Repository

1. Go to [GitHub](https://github.com)
2. Click the **+** icon in the top right
3. Select **"New repository"**
4. Name it: `python-learning`
5. **DO NOT** initialize with README, .gitignore, or license (we already have these)
6. Click **"Create repository"**

## Step 7: Connect to GitHub

GitHub will show you commands. Copy the commands under **"…or push an existing repository from the command line"**.

They should look like this (replace `yourusername` with your actual GitHub username):

```bash
git remote add origin https://github.com/yourusername/python-learning.git
git branch -M main
git push -u origin main
```

## Step 8: Verify

Go to `https://github.com/yourusername/python-learning` in your browser. You should see all your files!

## Daily Workflow (After Initial Setup)

When you add new files or make changes:

```bash
# Check what changed
git status

# Add all changes
git add .

# Commit with a descriptive message
git commit -m "Add week 2 exercises"

# Push to GitHub
git push
```

## Useful Git Commands

```bash
# See your commit history
git log --oneline

# See what changed in files
git diff

# Undo changes to a file (before committing)
git checkout -- filename.py

# Create a new branch for experiments
git checkout -b experiment-branch
```

## Troubleshooting

### "git: command not found"
- Install Git from [git-scm.com](https://git-scm.com)

### "Permission denied (publickey)"
- Set up SSH keys or use HTTPS with personal access token
- Guide: [GitHub SSH Setup](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)

### "Repository not found"
- Check the remote URL: `git remote -v`
- Make sure you created the repository on GitHub
- Verify the repository name matches

## Customization

Don't forget to update:
- Main `README.md` - Replace `yourusername` with your GitHub username
- `LICENSE` - Add your name
- Project READMEs - Customize for your projects

## Next Steps

1. ⭐ Star your own repository (why not?)
2. 📝 Update the main README with your progress
3. 💻 Start coding in `exercises/01_basics/`
4. 📚 Add notes as you learn
5. 🚀 Build your first project!

---

**Need help?** 
- [GitHub Docs](https://docs.github.com)
- [Git Handbook](https://guides.github.com/introduction/git-handbook/)
- [Learn Git Branching (Interactive)](https://learngitbranching.js.org/)

Happy learning! 🐍
