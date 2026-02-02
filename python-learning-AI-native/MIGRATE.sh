#!/bin/bash

# Automated Migration Script for Python Learning Repo
# This script safely adds the modernized structure to your existing repository

echo "=========================================="
echo "Python Learning Repo Modernization Script"
echo "=========================================="
echo ""

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to print colored output
print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    print_error "Not in a git repository!"
    echo "Please run this script from your python-learning repository root."
    echo "Navigate to your repo: cd path/to/python-learning"
    exit 1
fi

print_success "Found git repository"
echo ""

# Ask for confirmation
echo "This script will:"
echo "  1. Add new AI-native folders (problem_solving, ai_collaboration, python_concepts)"
echo "  2. Add new resources (AI tools guide, coming back guide)"
echo "  3. Keep ALL your existing work (notes, exercises, courses, projects)"
echo "  4. Create a backup branch (just in case)"
echo ""
read -p "Continue? (y/n): " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    print_warning "Migration cancelled"
    exit 0
fi

echo ""
print_success "Starting migration..."
echo ""

# Step 1: Create backup branch
echo "Step 1: Creating backup branch..."
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
git checkout -b backup-before-modernization 2>/dev/null
if [ $? -eq 0 ]; then
    print_success "Backup branch created: backup-before-modernization"
    git checkout $CURRENT_BRANCH
else
    print_warning "Backup branch already exists (that's fine)"
    git checkout $CURRENT_BRANCH
fi
echo ""

# Step 2: Check for modernized folder
echo "Step 2: Looking for modernized files..."
if [ ! -d "../python-learning-AI-native" ]; then
    print_error "Cannot find python-learning-AI-native folder"
    echo ""
    echo "Please extract the downloaded zip file to the same parent folder as your repo."
    echo "Structure should be:"
    echo "  parent-folder/"
    echo "    ├── python-learning/          (your existing repo)"
    echo "    └── python-learning-AI-native/ (extracted modernized version)"
    echo ""
    exit 1
fi
print_success "Found modernized files"
echo ""

# Step 3: Copy new folders
echo "Step 3: Adding new folders..."

# Copy main folders
if [ ! -d "problem_solving" ]; then
    cp -r ../python-learning-AI-native/problem_solving .
    print_success "Added problem_solving/"
else
    print_warning "problem_solving/ already exists (skipping)"
fi

if [ ! -d "ai_collaboration" ]; then
    cp -r ../python-learning-AI-native/ai_collaboration .
    print_success "Added ai_collaboration/"
else
    print_warning "ai_collaboration/ already exists (skipping)"
fi

if [ ! -d "python_concepts" ]; then
    cp -r ../python-learning-AI-native/python_concepts .
    print_success "Added python_concepts/"
else
    print_warning "python_concepts/ already exists (skipping)"
fi

echo ""

# Step 4: Update resources folder
echo "Step 4: Updating resources folder..."

if [ ! -d "resources" ]; then
    mkdir -p resources
    print_success "Created resources/"
fi

# Copy new resource files
cp ../python-learning-AI-native/resources/AI_NATIVE_RESOURCES.md resources/ 2>/dev/null && \
    print_success "Added AI_NATIVE_RESOURCES.md"

cp ../python-learning-AI-native/resources/coming_back_guide.md resources/ 2>/dev/null && \
    print_success "Added coming_back_guide.md"

# Copy best_practices folder if it doesn't exist
if [ -d "../python-learning-AI-native/resources/best_practices" ] && [ ! -d "resources/best_practices" ]; then
    cp -r ../python-learning-AI-native/resources/best_practices resources/
    print_success "Added best_practices/"
fi

echo ""

# Step 5: Add helpful guides
echo "Step 5: Adding setup guides..."

cp ../python-learning-AI-native/START_HERE.md . 2>/dev/null && \
    print_success "Added START_HERE.md"

cp ../python-learning-AI-native/SETUP_GUIDE.md . 2>/dev/null && \
    print_success "Added SETUP_GUIDE.md"

cp ../python-learning-AI-native/MIGRATION_GUIDE.md . 2>/dev/null && \
    print_success "Added MIGRATION_GUIDE.md"

echo ""

# Step 6: Update README (optional)
echo "Step 6: README update..."
read -p "Would you like to append AI-native section to your README? (y/n): " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Backup existing README
    cp README.md README.md.backup
    
    # Append AI-native section
    cat >> README.md << 'EOF'

---

## 🚀 Updated: AI-Native Learning Approach

This repository now includes an **AI-native learning structure** focused on solving real problems with AI collaboration.

### New Additions:

**📋 problem_solving/**
- Frameworks for breaking down real problems
- Real-world challenges to solve  
- AI collaboration workflows

**🤖 ai_collaboration/**
- Prompting mastery guides
- Code review techniques
- Iterative refinement processes

**🧠 python_concepts/**
- Mental models (concepts that stick)
- Pattern recognition (code you'll see again)
- Quick reference (for coming back after time away)

### Learning Philosophy:

**Traditional approach:** Learn syntax → Practice → Build projects  
**AI-native approach:** Define problems → Build with AI → Understand concepts

**See START_HERE.md for complete guide.**

### Resources:

- **AI Tools Guide:** `resources/AI_NATIVE_RESOURCES.md`
- **Retention Guide:** `resources/coming_back_guide.md`
- **Setup Help:** `SETUP_GUIDE.md`

---
EOF
    
    print_success "Updated README.md (backup saved as README.md.backup)"
else
    print_warning "Skipped README update"
fi

echo ""

# Step 7: Git status
echo "Step 7: Checking what was added..."
echo ""
git status --short
echo ""

# Step 8: Commit
read -p "Would you like to commit these changes now? (y/n): " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    git add .
    git commit -m "Modernize: Add AI-native learning structure

- Add problem_solving frameworks and real-world challenges
- Add ai_collaboration guides (prompting, reviewing, iteration)
- Add python_concepts (mental models, patterns, quick reference)
- Add comprehensive AI tools and resources guide
- Add retention-focused learning materials
- Add setup and migration guides

Existing notes, exercises, courses, and projects preserved.
New structure complements traditional learning approach."
    
    print_success "Changes committed!"
    echo ""
    echo "Next step: Push to GitHub with:"
    echo "  git push"
else
    print_warning "Changes staged but not committed"
    echo ""
    echo "Review changes with: git status"
    echo "Commit later with: git commit -m 'your message'"
fi

echo ""
echo "=========================================="
print_success "Migration Complete!"
echo "=========================================="
echo ""
echo "What was added:"
echo "  ✓ problem_solving/ (frameworks & challenges)"
echo "  ✓ ai_collaboration/ (prompting & workflows)"  
echo "  ✓ python_concepts/ (mental models & reference)"
echo "  ✓ resources/AI_NATIVE_RESOURCES.md (tool guide)"
echo "  ✓ resources/coming_back_guide.md (retention)"
echo "  ✓ START_HERE.md (quick start guide)"
echo ""
echo "Your existing work:"
echo "  ✓ notes/ (preserved)"
echo "  ✓ exercises/ (preserved)"
echo "  ✓ courses/ (preserved)"
echo "  ✓ projects/ (preserved)"
echo ""
echo "Backup created:"
echo "  ✓ Branch: backup-before-modernization"
echo "  ✓ README: README.md.backup (if updated)"
echo ""
echo "Next steps:"
echo "  1. Review changes: git status"
echo "  2. Push to GitHub: git push"
echo "  3. Read START_HERE.md to get started!"
echo ""
print_success "Happy learning! 🚀"
