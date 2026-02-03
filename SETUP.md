# Setup Guide

> **Get your Python environment ready in 15 minutes**

This guide will help you set up everything you need to start learning Python, regardless of which learning path you choose.

---

## ✅ What You'll Install

1. **Python 3.11+** - The programming language
2. **VS Code** - Code editor (recommended) or any editor you prefer
3. **Git** - Version control (for saving your progress)
4. **GitHub account** - To backup your work
5. **Python packages** - Tools for specific projects

---

## 🪟 Setup for Windows

### Step 1: Install Python

1. Visit [python.org/downloads](https://www.python.org/downloads/)
2. Download Python 3.11 or newer
3. **IMPORTANT:** Check "Add Python to PATH" during installation
4. Complete the installation

**Verify installation:**
```powershell
python --version
# Should show: Python 3.11.x or higher
```

---

### Step 2: Install VS Code (Recommended)

1. Visit [code.visualstudio.com](https://code.visualstudio.com/)
2. Download and install VS Code
3. Open VS Code
4. Install the Python extension:
   - Click Extensions icon (or press `Ctrl+Shift+X`)
   - Search for "Python"
   - Install the one by Microsoft

---

### Step 3: Install Git

1. Visit [git-scm.com](https://git-scm.com/)
2. Download Git for Windows
3. Install with default settings
4. Open PowerShell and verify:

```powershell
git --version
# Should show: git version 2.x.x
```

---

### Step 4: Configure Git

```powershell
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

---

### Step 5: Clone This Repository

**Option A: Use GitHub Desktop (Easier)**
1. Install [GitHub Desktop](https://desktop.github.com/)
2. Sign in with your GitHub account
3. Clone this repository using the URL

**Option B: Use Command Line**
```powershell
# Navigate to where you want the project
cd Documents

# Clone the repository
git clone https://github.com/AgentPierre/python-learning.git

# Enter the directory
cd python-learning
```

---

### Step 6: Create Virtual Environment (For Projects)

Each project should have its own virtual environment:

```powershell
# Navigate to a project folder
cd projects/01_downloads_organizer

# Create virtual environment
python -m venv venv

# Activate it
.\venv\Scripts\activate

# You should see (venv) in your prompt
# Install project dependencies
pip install -r requirements.txt
```

**To deactivate:**
```powershell
deactivate
```

---

## 🍎 Setup for macOS

### Step 1: Install Homebrew (Package Manager)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

---

### Step 2: Install Python

```bash
brew install python@3.11
```

**Verify:**
```bash
python3 --version
# Should show: Python 3.11.x or higher
```

---

### Step 3: Install VS Code

```bash
brew install --cask visual-studio-code
```

Or download from [code.visualstudio.com](https://code.visualstudio.com/)

**Install Python extension:**
- Open VS Code
- Press `Cmd+Shift+X`
- Search "Python" → Install (by Microsoft)

---

### Step 4: Install Git

```bash
brew install git
```

**Configure:**
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

---

### Step 5: Clone Repository

```bash
# Navigate to desired location
cd ~/Documents

# Clone
git clone https://github.com/AgentPierre/python-learning.git

# Enter directory
cd python-learning
```

---

### Step 6: Virtual Environments

```bash
# Navigate to a project
cd projects/01_downloads_organizer

# Create virtual environment
python3 -m venv venv

# Activate
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt
```

---

## 🐧 Setup for Linux

### Step 1: Install Python

**Ubuntu/Debian:**
```bash
sudo apt update
sudo apt install python3.11 python3.11-venv python3-pip
```

**Fedora:**
```bash
sudo dnf install python3.11
```

**Verify:**
```bash
python3 --version
```

---

### Step 2: Install VS Code

**Ubuntu/Debian:**
```bash
sudo snap install code --classic
```

Or download from [code.visualstudio.com](https://code.visualstudio.com/)

---

### Step 3: Install Git

```bash
sudo apt install git  # Ubuntu/Debian
sudo dnf install git  # Fedora
```

**Configure:**
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

---

### Step 4: Clone & Setup

```bash
cd ~/Documents
git clone https://github.com/AgentPierre/python-learning.git
cd python-learning

# Create virtual environment for projects
cd projects/01_downloads_organizer
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

---

## 🔧 VS Code Configuration (All Platforms)

### Recommended Extensions

1. **Python** (Microsoft) - Already installed
2. **Pylance** - Better Python language support
3. **Python Indent** - Auto-indent fixes
4. **GitLens** - Enhanced Git features
5. **Error Lens** - Inline error highlighting

**To install:**
- Press `Ctrl+Shift+X` (Windows/Linux) or `Cmd+Shift+X` (Mac)
- Search for extension name
- Click Install

---

### Recommended Settings

Open Settings (`Ctrl+,` or `Cmd+,`), search for these:

```json
{
    "python.formatting.provider": "black",
    "python.linting.enabled": true,
    "python.linting.pylintEnabled": true,
    "editor.formatOnSave": true,
    "files.autoSave": "afterDelay"
}
```

---

## 📦 Installing Project Dependencies

Each project has a `requirements.txt` file listing needed packages.

### General Process:

```bash
# Navigate to project folder
cd projects/01_downloads_organizer

# Activate virtual environment (if not already active)
# Windows:
.\venv\Scripts\activate
# Mac/Linux:
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt
```

### Common Packages You'll Use:

- **requests** - HTTP requests for web scraping
- **beautifulsoup4** - HTML parsing
- **pandas** - Data analysis and CSV handling
- **openpyxl** - Excel file manipulation
- **reportlab** - PDF generation

---

## 🧪 Verify Everything Works

### Test Python:

```python
# Run Python interactive mode
python  # or python3 on Mac/Linux

# Try these commands:
>>> print("Hello, Python!")
>>> 2 + 2
>>> exit()
```

---

### Test Your First Script:

Create a file `test.py`:

```python
print("Setup successful!")
print(f"Python is working correctly")

# Test imports
try:
    import pathlib
    import sys
    print(f"Python version: {sys.version}")
    print("✅ All systems ready!")
except ImportError as e:
    print(f"❌ Error: {e}")
```

Run it:
```bash
python test.py
```

If you see "✅ All systems ready!", you're good to go!

---

## 🚨 Troubleshooting

### "python is not recognized" (Windows)

**Solution:** Add Python to PATH manually
1. Search "Environment Variables" in Windows
2. Edit "Path" in System Variables
3. Add: `C:\Users\YourName\AppData\Local\Programs\Python\Python311`
4. Restart terminal

---

### "Permission denied" (Mac/Linux)

**Solution:** Use `python3` instead of `python`
```bash
python3 --version
python3 -m venv venv
```

---

### Virtual Environment Not Activating

**Windows:**
```powershell
# If you get execution policy error:
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Then try activating again:
.\venv\Scripts\activate
```

**Mac/Linux:**
```bash
# Make sure you're in the right directory
pwd  # Should show project folder path

# Try:
source venv/bin/activate
```

---

### Package Installation Fails

```bash
# Upgrade pip first:
python -m pip install --upgrade pip

# Then try installing again:
pip install -r requirements.txt

# If still failing, install packages one by one:
pip install requests
pip install beautifulsoup4
# etc.
```

---

## ✅ Setup Checklist

Before you start learning, verify:

- [ ] Python 3.11+ installed (`python --version`)
- [ ] VS Code installed and Python extension added
- [ ] Git installed and configured
- [ ] Repository cloned to your computer
- [ ] Can create and activate virtual environments
- [ ] Test script runs successfully
- [ ] GitHub account created (for backing up work)

**All checked?** You're ready! 

---

## 🎯 Next Steps

### For Traditional Learners:
→ Go to [01_learning-paths/traditional/README.md](01_learning-paths/traditional/README.md)

### For AI-Native Learners:
→ Go to [01_learning-paths/ai-native/problem_solving/README.md](01_learning-paths/ai-native/problem_solving/README.md)

### Not Sure Which Path?
→ Read [HOW_TO_USE.md](HOW_TO_USE.md)

---

## 🆘 Still Having Issues?

1. Check the error message carefully
2. Search for the error on Google/Stack Overflow
3. Ask in Python communities (r/learnpython, Python Discord)
4. Review the [official Python documentation](https://docs.python.org/3/)

**Most setup issues are solved within 10 minutes with a quick search!**

---

**Setup Complete!** Time to start learning Python 🚀
