# Prompting Mastery: Getting AI to Build What You Need

> **The most valuable skill in AI-native development: directing AI effectively**

## Why This Matters

**2026 Reality:** AI can write code faster than you. But:
- ❌ Bad prompts = bad code (garbage in, garbage out)
- ❌ Vague requests = generic solutions
- ✅ **Good prompts = exactly what you need**

**Your value isn't writing code. It's knowing WHAT to build and HOW to ask for it.**

---

## The Prompting Framework

### Level 1: The Vague Ask (❌ Don't Do This)

**Bad Prompt:**
```
"Write a Python script"
```

**What AI Gives You:**
- Generic hello world
- Not what you need
- No context, no quality

---

### Level 2: The Basic Request (😐 Better, Still Weak)

**Mediocre Prompt:**
```
"Write a script to organize my downloads folder"
```

**What AI Gives You:**
- Something that might work
- Missing edge cases
- No error handling
- Unclear structure

---

### Level 3: The Detailed Request (✅ This Is What You Want)

**Good Prompt:**
```
Write a Python script that organizes my Downloads folder with these requirements:

FUNCTIONALITY:
- Scan all files in ~/Downloads
- Group files by extension (.jpg, .pdf, .mp3, etc.)
- Move files into subfolders named by category:
  - Images/ for .jpg, .png, .gif
  - Documents/ for .pdf, .docx, .txt
  - Music/ for .mp3, .wav
  - Videos/ for .mp4, .avi
  - Other/ for everything else

EDGE CASES:
- Handle duplicate filenames (add number suffix: file_1.jpg, file_2.jpg)
- Skip hidden files (starting with .)
- Handle permission errors gracefully
- Don't move files that are currently open

CODE QUALITY:
- Use pathlib (not os.path)
- Add type hints
- Include docstrings for functions
- Add error handling (try/except)
- Make it readable with clear variable names

EXECUTION:
- Provide a --dry-run flag to preview changes
- Show progress (which files are being moved)
- Create folders only when needed

OUTPUT:
Provide:
1. The main script (organize_downloads.py)
2. A README with usage examples
3. A requirements.txt (if needed)
```

**What AI Gives You:**
- Exactly what you need
- Handles edge cases
- Production-quality code
- Well-documented

---

## The Anatomy of a Great Prompt

### 1. Context (What & Why)
```
I need a script to automate organizing my messy downloads folder.
I download lots of files for work and lose track of them.
```

### 2. Requirements (What It Must Do)
```
Must:
- Organize by file type
- Handle 500+ files efficiently
- Not break if a file is in use
```

### 3. Constraints (What It Can't Do)
```
Must not:
- Delete any files
- Modify file contents
- Require admin permissions
```

### 4. Quality Standards (How It Should Be Built)
```
Code should:
- Use Python 3.8+ features
- Be readable (clear variable names)
- Include error handling
- Have type hints and docstrings
```

### 5. Output Format (What You Want Back)
```
Provide:
- Main script file
- Configuration file (for custom categories)
- Usage examples
```

---

## Prompt Templates by Task Type

### Template 1: Building a New Tool

```
Build a Python tool that [PURPOSE].

CONTEXT:
[Why you need this, what problem it solves]

FUNCTIONALITY:
- [Core feature 1]
- [Core feature 2]
- [Core feature 3]

INPUT/OUTPUT:
- Input: [What data/files it takes]
- Output: [What it produces]

EDGE CASES TO HANDLE:
- [What could go wrong]
- [Unusual scenarios]

CODE STANDARDS:
- Python 3.8+
- Type hints
- Docstrings
- Error handling
- Use [specific library if needed]

DELIVERABLE:
- Main script: [filename].py
- README with examples
- Requirements.txt (if needed)
```

**Example:**
```
Build a Python tool that tracks my monthly expenses.

CONTEXT:
I want to manually log expenses throughout the month and see
where my money goes. Need something simple I can run from terminal.

FUNCTIONALITY:
- Add expense (amount, category, description, date)
- View all expenses for current month
- See total by category
- Export to CSV

INPUT/OUTPUT:
- Input: Terminal commands (interactive)
- Output: Console display + CSV file

EDGE CASES TO HANDLE:
- Invalid amounts (negative, non-numeric)
- Missing categories (prompt for correction)
- Empty expense list (show friendly message)

CODE STANDARDS:
- Python 3.8+
- Type hints
- Use pathlib for file operations
- Store data in JSON file
- Clear error messages

DELIVERABLE:
- Main script: expense_tracker.py
- Sample data file structure
- README with all commands
```

---

### Template 2: Modifying Existing Code

```
I have this code:
[PASTE CODE]

CURRENT PROBLEM:
[What's wrong or missing]

DESIRED CHANGES:
1. [Change 1]
2. [Change 2]
3. [Change 3]

CONSTRAINTS:
- Must maintain compatibility with [X]
- Don't change [specific part]
- Keep the same file structure

EXPLAIN:
- What you changed and why
- Any potential issues to watch for
```

**Example:**
```
I have this code:
```python
def organize_files(folder):
    for file in folder.glob("*"):
        ext = file.suffix
        target = folder / ext[1:]  # Remove the dot
        target.mkdir(exist_ok=True)
        file.rename(target / file.name)
```

CURRENT PROBLEM:
- Doesn't handle duplicate filenames
- No error handling if file is in use
- Creates folders even if no files match

DESIRED CHANGES:
1. Add duplicate filename handling (append _1, _2, etc.)
2. Add try/except for permission errors
3. Only create folder if files actually exist
4. Add logging of what was moved

CONSTRAINTS:
- Must keep using pathlib
- Function signature stays the same
- Should still work on Windows and Mac

EXPLAIN:
- What you changed and why
- Any gotchas I should know about
```

---

### Template 3: Explaining Code

```
Explain this code like I'm learning Python:
[PASTE CODE]

Focus on:
- What it does (overall purpose)
- How it works (step by step)
- Why certain choices were made
- Common patterns I should recognize
- What I could modify easily

Keep explanations:
- Beginner-friendly
- Using analogies when helpful
- Highlighting the mental models
```

---

### Template 4: Debugging Help

```
This code isn't working as expected:
[PASTE CODE]

EXPECTED BEHAVIOR:
[What should happen]

ACTUAL BEHAVIOR:
[What actually happens]

ERROR MESSAGE (if any):
[Paste error]

WHAT I'VE TRIED:
- [Thing 1]
- [Thing 2]

Help me:
1. Identify the bug
2. Explain why it's happening
3. Provide the fix
4. Explain how to avoid this in the future
```

---

## Iterative Refinement: The Power Move

**Don't expect perfection on the first try.** Refine iteratively:

### Round 1: Get Something Working
```
Build a basic expense tracker that logs expenses to a CSV file.
```

### Round 2: Add Features
```
Add these features to the expense tracker:
- Category selection from predefined list
- Monthly summary view
- Data validation (no negative amounts)
```

### Round 3: Improve Quality
```
Improve this expense tracker:
- Add type hints
- Better error messages
- Add unit tests for the core functions
```

### Round 4: Polish
```
Final touches:
- Add a --help flag
- Create a professional README
- Add examples of all commands
```

**Result:** Production-quality tool built through collaboration

---

## Common Prompt Mistakes (And Fixes)

### Mistake 1: Being Too Vague
❌ "Make it better"
✅ "Add error handling for file not found, and use more descriptive variable names"

### Mistake 2: Assuming AI Knows Your Context
❌ "Fix the issue"
✅ "The issue is duplicate files aren't handled. When file.txt already exists in the destination, the script crashes. Handle this by appending _1, _2, etc."

### Mistake 3: Accepting First Output
❌ [Takes whatever AI gives, doesn't refine]
✅ [Reviews output, identifies issues, asks for improvements]

### Mistake 4: Not Specifying Quality Standards
❌ "Write a file organizer"
✅ "Write a file organizer using pathlib, with type hints, docstrings, and error handling"

### Mistake 5: No Examples
❌ "Handle different file types"
✅ "Handle file types: .jpg/.png for Images/, .pdf/.docx for Documents/, .mp3 for Music/"

---

## Advanced Techniques

### Technique 1: Provide Examples
```
Build a file renaming tool that converts filenames to snake_case.

Examples:
- "My Photo 2024.jpg" → "my_photo_2024.jpg"
- "Final Report (1).docx" → "final_report_1.docx"
- "Meeting Notes - Jan 15.txt" → "meeting_notes_jan_15.txt"

Handle:
- Spaces → underscores
- Parentheses → remove
- Multiple spaces → single underscore
- Special characters → remove
```

### Technique 2: Specify Architecture
```
Build an expense tracker with this structure:

expense_tracker/
├── main.py           # Entry point, CLI interface
├── storage.py        # JSON file operations
├── models.py         # Expense data class
├── categories.py     # Category management
└── reporting.py      # Summary and export functions

Each module should:
- Have a single clear responsibility
- Be testable independently
- Use type hints throughout
```

### Technique 3: Request Explanation
```
Build [X] and explain your design decisions:
- Why did you choose this data structure?
- Why this error handling approach?
- What are the trade-offs?
- What would you do differently for a larger project?
```

### Technique 4: Ask for Alternatives
```
Show me 3 different ways to [solve this problem]:
1. The simple way (easy to understand, less efficient)
2. The Pythonic way (idiomatic Python)
3. The production way (handles all edge cases, most robust)

For each, explain when to use it.
```

---

## The Collaboration Loop

```
1. Define Problem Clearly
   ↓
2. Ask AI to Build Solution
   ↓
3. Review Output Critically
   ↓
4. Identify Issues/Missing Pieces
   ↓
5. Ask AI to Refine
   ↓
6. Repeat Until Satisfied
   ↓
7. Understand What Was Built
   ↓
8. Document Learnings
```

**Key insight:** You're not asking AI to do your job. You're collaborating to build something you both couldn't build alone.

---

## Practice Exercise

**Your turn!** Write a detailed prompt for:

**Task:** Build a web scraper that monitors product prices

**Your prompt should include:**
- Context (why you need this)
- Functionality (what it must do)
- Edge cases (what could go wrong)
- Code quality standards
- Output format

**Try it, then compare to this example:**

<details>
<summary>Click to see example prompt</summary>

```
Build a Python web scraper that monitors product prices on e-commerce sites.

CONTEXT:
I want to track prices for specific products over time and get notified
when prices drop below a threshold. Running this daily via cron job.

FUNCTIONALITY:
- Accept list of product URLs (from file or CLI)
- Scrape current price from each URL
- Store price history in JSON file (date, price, url)
- Compare to historical prices
- Alert if price dropped more than 10%

INPUT/OUTPUT:
- Input: products.txt (one URL per line)
- Output: prices.json (historical data)
- Alerts: Print to console (for now)

EDGE CASES TO HANDLE:
- Page structure changes (graceful failure)
- Network errors (retry 3 times)
- Product no longer available (mark as discontinued)
- Captcha encountered (notify user, skip)

CODE STANDARDS:
- Use requests + BeautifulSoup4
- Add rate limiting (1 request per 2 seconds)
- Respect robots.txt
- Use type hints and docstrings
- Log all actions (timestamp, URL, status)

DELIVERABLE:
- scraper.py (main script)
- config.py (URLs to monitor, thresholds)
- README (setup and usage)
- requirements.txt
```

</details>

---

## Key Takeaways

1. **Specific beats vague** - More detail = better results
2. **Iterate don't perfect** - Refine through conversation
3. **Examples help** - Show AI what you mean
4. **Quality standards matter** - Request type hints, error handling, docs
5. **Review critically** - AI makes mistakes, you catch them

**Your superpower is knowing what to build and how to ask for it.**

---

## Next Steps

1. Pick a real problem from `problem_solving/real_world_challenges/`
2. Write a detailed prompt using these templates
3. Ask AI to build it
4. Review and refine
5. Document what worked in `ai_collaboration/iteration_workflows/`

**Now go practice! 🚀**
