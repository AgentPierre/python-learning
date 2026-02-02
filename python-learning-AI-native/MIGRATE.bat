@echo off
REM Automated Migration Script for Python Learning Repo (Windows)
REM This script safely adds the modernized structure to your existing repository

echo ==========================================
echo Python Learning Repo Modernization Script
echo ==========================================
echo.

REM Check if we're in a git repository
if not exist ".git" (
    echo [ERROR] Not in a git repository!
    echo Please run this script from your python-learning repository root.
    echo Navigate to your repo: cd path\to\python-learning
    pause
    exit /b 1
)

echo [SUCCESS] Found git repository
echo.

REM Ask for confirmation
echo This script will:
echo   1. Add new AI-native folders (problem_solving, ai_collaboration, python_concepts^)
echo   2. Add new resources (AI tools guide, coming back guide^)
echo   3. Keep ALL your existing work (notes, exercises, courses, projects^)
echo   4. Create a backup branch (just in case^)
echo.
set /p CONFIRM="Continue? (y/n): "

if /i not "%CONFIRM%"=="y" (
    echo [WARNING] Migration cancelled
    exit /b 0
)

echo.
echo [SUCCESS] Starting migration...
echo.

REM Step 1: Create backup branch
echo Step 1: Creating backup branch...
for /f "tokens=*" %%i in ('git rev-parse --abbrev-ref HEAD') do set CURRENT_BRANCH=%%i
git checkout -b backup-before-modernization 2>nul
if %errorlevel% equ 0 (
    echo [SUCCESS] Backup branch created: backup-before-modernization
    git checkout %CURRENT_BRANCH%
) else (
    echo [WARNING] Backup branch already exists (that's fine^)
    git checkout %CURRENT_BRANCH%
)
echo.

REM Step 2: Check for modernized folder
echo Step 2: Looking for modernized files...
if not exist "..\python-learning-AI-native" (
    echo [ERROR] Cannot find python-learning-AI-native folder
    echo.
    echo Please extract the downloaded zip file to the same parent folder as your repo.
    echo Structure should be:
    echo   parent-folder\
    echo     ^|-- python-learning\          (your existing repo^)
    echo     ^+-- python-learning-AI-native\ (extracted modernized version^)
    echo.
    pause
    exit /b 1
)
echo [SUCCESS] Found modernized files
echo.

REM Step 3: Copy new folders
echo Step 3: Adding new folders...

if not exist "problem_solving" (
    xcopy "..\python-learning-AI-native\problem_solving" "problem_solving\" /E /I /Q
    echo [SUCCESS] Added problem_solving\
) else (
    echo [WARNING] problem_solving\ already exists (skipping^)
)

if not exist "ai_collaboration" (
    xcopy "..\python-learning-AI-native\ai_collaboration" "ai_collaboration\" /E /I /Q
    echo [SUCCESS] Added ai_collaboration\
) else (
    echo [WARNING] ai_collaboration\ already exists (skipping^)
)

if not exist "python_concepts" (
    xcopy "..\python-learning-AI-native\python_concepts" "python_concepts\" /E /I /Q
    echo [SUCCESS] Added python_concepts\
) else (
    echo [WARNING] python_concepts\ already exists (skipping^)
)

echo.

REM Step 4: Update resources folder
echo Step 4: Updating resources folder...

if not exist "resources" (
    mkdir resources
    echo [SUCCESS] Created resources\
)

copy "..\python-learning-AI-native\resources\AI_NATIVE_RESOURCES.md" "resources\" >nul 2>&1
if %errorlevel% equ 0 echo [SUCCESS] Added AI_NATIVE_RESOURCES.md

copy "..\python-learning-AI-native\resources\coming_back_guide.md" "resources\" >nul 2>&1
if %errorlevel% equ 0 echo [SUCCESS] Added coming_back_guide.md

if exist "..\python-learning-AI-native\resources\best_practices" (
    if not exist "resources\best_practices" (
        xcopy "..\python-learning-AI-native\resources\best_practices" "resources\best_practices\" /E /I /Q
        echo [SUCCESS] Added best_practices\
    )
)

echo.

REM Step 5: Add helpful guides
echo Step 5: Adding setup guides...

copy "..\python-learning-AI-native\START_HERE.md" . >nul 2>&1
if %errorlevel% equ 0 echo [SUCCESS] Added START_HERE.md

copy "..\python-learning-AI-native\SETUP_GUIDE.md" . >nul 2>&1
if %errorlevel% equ 0 echo [SUCCESS] Added SETUP_GUIDE.md

copy "..\python-learning-AI-native\MIGRATION_GUIDE.md" . >nul 2>&1
if %errorlevel% equ 0 echo [SUCCESS] Added MIGRATION_GUIDE.md

echo.

REM Step 6: Update README (optional)
echo Step 6: README update...
set /p UPDATE_README="Would you like to append AI-native section to your README? (y/n): "

if /i "%UPDATE_README%"=="y" (
    copy README.md README.md.backup >nul
    
    (
        echo.
        echo ---
        echo.
        echo ## 🚀 Updated: AI-Native Learning Approach
        echo.
        echo This repository now includes an **AI-native learning structure** focused on solving real problems with AI collaboration.
        echo.
        echo ### New Additions:
        echo.
        echo **📋 problem_solving/**
        echo - Frameworks for breaking down real problems
        echo - Real-world challenges to solve  
        echo - AI collaboration workflows
        echo.
        echo **🤖 ai_collaboration/**
        echo - Prompting mastery guides
        echo - Code review techniques
        echo - Iterative refinement processes
        echo.
        echo **🧠 python_concepts/**
        echo - Mental models (concepts that stick^)
        echo - Pattern recognition (code you'll see again^)
        echo - Quick reference (for coming back after time away^)
        echo.
        echo ### Learning Philosophy:
        echo.
        echo **Traditional approach:** Learn syntax → Practice → Build projects  
        echo **AI-native approach:** Define problems → Build with AI → Understand concepts
        echo.
        echo **See START_HERE.md for complete guide.**
        echo.
        echo ### Resources:
        echo.
        echo - **AI Tools Guide:** `resources/AI_NATIVE_RESOURCES.md`
        echo - **Retention Guide:** `resources/coming_back_guide.md`
        echo - **Setup Help:** `SETUP_GUIDE.md`
        echo.
        echo ---
    ) >> README.md
    
    echo [SUCCESS] Updated README.md (backup saved as README.md.backup^)
) else (
    echo [WARNING] Skipped README update
)

echo.

REM Step 7: Git status
echo Step 7: Checking what was added...
echo.
git status --short
echo.

REM Step 8: Commit
set /p COMMIT_NOW="Would you like to commit these changes now? (y/n): "

if /i "%COMMIT_NOW%"=="y" (
    git add .
    git commit -m "Modernize: Add AI-native learning structure" -m "- Add problem_solving frameworks and real-world challenges" -m "- Add ai_collaboration guides (prompting, reviewing, iteration)" -m "- Add python_concepts (mental models, patterns, quick reference)" -m "- Add comprehensive AI tools and resources guide" -m "- Add retention-focused learning materials" -m "- Add setup and migration guides" -m "" -m "Existing notes, exercises, courses, and projects preserved." -m "New structure complements traditional learning approach."
    
    echo [SUCCESS] Changes committed!
    echo.
    echo Next step: Push to GitHub with:
    echo   git push
) else (
    echo [WARNING] Changes staged but not committed
    echo.
    echo Review changes with: git status
    echo Commit later with: git commit -m "your message"
)

echo.
echo ==========================================
echo [SUCCESS] Migration Complete!
echo ==========================================
echo.
echo What was added:
echo   ✓ problem_solving\ (frameworks ^& challenges^)
echo   ✓ ai_collaboration\ (prompting ^& workflows^)  
echo   ✓ python_concepts\ (mental models ^& reference^)
echo   ✓ resources\AI_NATIVE_RESOURCES.md (tool guide^)
echo   ✓ resources\coming_back_guide.md (retention^)
echo   ✓ START_HERE.md (quick start guide^)
echo.
echo Your existing work:
echo   ✓ notes\ (preserved^)
echo   ✓ exercises\ (preserved^)
echo   ✓ courses\ (preserved^)
echo   ✓ projects\ (preserved^)
echo.
echo Backup created:
echo   ✓ Branch: backup-before-modernization
echo   ✓ README: README.md.backup (if updated^)
echo.
echo Next steps:
echo   1. Review changes: git status
echo   2. Push to GitHub: git push
echo   3. Read START_HERE.md to get started!
echo.
echo [SUCCESS] Happy learning! 🚀
echo.
pause
