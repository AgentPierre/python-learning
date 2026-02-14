# Reviewing AI-Generated Code

> **The critical skill: Evaluating code AI writes and ensuring it's correct**

AI writes code fast. **You make sure it's good.** This section teaches you to:
- Read AI-generated code critically
- Spot bugs and security issues
- Understand what the code actually does
- Suggest improvements
- Iterate to get better solutions

---

## 🎯 Why This Matters

**The Vibe Coding Problem:** Just accept whatever AI gives you and ship it.  
**The Professional Approach:** Review, understand, test, and iterate.

**You're not just checking that it works. You're ensuring you understand EVERY line.**

---

## 🔍 The Code Review Framework

### Step 1: Read for Understanding (Not Trust)

When AI gives you code, read it like you don't trust it:

```python
# Example: AI-generated file organizer

import os
import shutil
from pathlib import Path

def organize_downloads():
    downloads = Path.home() / "Downloads"
    for file in downloads.iterdir():
        if file.is_file():
            ext = file.suffix
            folder = downloads / ext  # ← Question: Is this safe?
            folder.mkdir(exist_ok=True)
            shutil.move(str(file), folder)
```

**Questions to ask:**
- ✅ Does this do what I asked for?
- ✅ Will it work on Windows, Mac, Linux?
- ✅ What happens with edge cases?
- ✅ Are there any bugs?
- ✅ Is this secure?
- ✅ Can I explain every line?

---

### Step 2: Run It In Your Head

Before running code, trace through it manually:

**Input:** Downloads folder with [photo.jpg, script.py, document.pdf]

**What happens?**
- Line 1: imports work ✓
- Line 5: gets Downloads path ✓
- Line 6: loop through each file ✓
- Line 7: check if it's a file ✓
- Line 8: get file extension (.jpg, .py, .pdf) ✓
- Line 9: create path ".jpg" folder ✓ (Wait, this creates ".jpg" folder, not "jpg" - is that what we want?)
- Line 10: create folder if needed ✓
- Line 11: move file there ✓

**Findings:** Code has a design issue - it creates folders named ".jpg" instead of "jpg". This isn't a bug, but ask yourself: is this what you wanted?

---

### Step 3: Look for Common Issues

**Security Issues:**
```python
# ❌ BAD: Could delete important files
import os
import glob
files = glob.glob('*')
for f in files:
    os.remove(f)  # This deletes EVERYTHING

# ✅ GOOD: More careful
for f in files:
    if f.endswith(('.jpg', '.png', '.gif')):  # Only images
        os.remove(f)
```

**Error Handling:**
```python
# ❌ BAD: Crashes if folder exists
folder.mkdir()

# ✅ GOOD: Handles existing folders
folder.mkdir(exist_ok=True)
```

**Performance Issues:**
```python
# ❌ BAD: Reads entire huge file into memory
data = open('massive.csv').read()

# ✅ GOOD: Process line by line
for line in open('massive.csv'):
    process(line)
```

**Edge Cases:**
```python
# ❌ BAD: Fails with unusual filenames
file.rename(new_name)  # What if file.name has weird characters?

# ✅ GOOD: Handles edge cases
try:
    file.rename(new_name)
except OSError as e:
    print(f"Couldn't rename: {e}")
```

---

### Step 4: Ask for Improvements

If you find issues:

```
"I noticed the code creates folders named '.jpg' but I wanted 
just 'jpg' without the dot. Also, what happens if a file 
has no extension? Can you improve this?"
```

**Good feedback includes:**
- ✅ Specific problem identified
- ✅ Why it matters (or ask a question)
- ✅ One or two issues at a time
- ✅ Willingness to discuss alternatives

---

## ✅ Code Review Checklist

For every piece of AI-generated code, verify:

### Functionality
- [ ] Does it solve the stated problem?
- [ ] Does it handle the examples I gave?
- [ ] What happens with edge cases?
- [ ] Are error messages helpful?

### Correctness
- [ ] Will it run on my OS (Windows/Mac/Linux)?
- [ ] Any obvious bugs?
- [ ] Off-by-one errors?
- [ ] Infinite loops?

### Security
- [ ] Could this delete/overwrite important files?
- [ ] Could it leak sensitive data?
- [ ] Are inputs validated?
- [ ] Could it be exploited?

### Readability
- [ ] Can you explain every line?
- [ ] Are variable names clear?
- [ ] Are there confusing sections?
- [ ] Does it need comments?

### Performance
- [ ] Will it be slow with large inputs?
- [ ] Unnecessary loops or redundant operations?
- [ ] Memory-efficient?
- [ ] Any N² algorithms that should be linear?

### Maintenance
- [ ] Would you understand this in 3 months?
- [ ] Could someone else modify it?
- [ ] Is it tested?
- [ ] Does it follow Python conventions?

---

## 🔄 The Iteration Loop

1. **AI generates code**
   ```python
   def organize_downloads():
       # AI's first attempt
   ```

2. **You review it**
   - Run it in your head
   - Check your list
   - Ask questions

3. **You give feedback**
   ```
   "This creates '.jpg' folders but I want just 'jpg'. 
    Also what if a file has no extension?"
   ```

4. **AI improves it**
   ```python
   def organize_downloads():
       # Better version addressing your feedback
   ```

5. **Repeat until satisfied**

---

## 💡 Questions to Ask AI

When reviewing code, effective questions include:

**"Walk me through this line by line"**
- AI explains the logic, helping you understand

**"What happens if [edge case]?"**
- Finds missing error handling
- Example: "What if the folder doesn't exist?"

**"How would you test this?"**
- Gets AI to think about quality
- Reveals untested scenarios

**"Is there a simpler way?"**
- Cut through over-engineered solutions
- Often improves readability

**"What are the risks?"**
- Gets AI thinking about safety
- Surfaces potential bugs

---

## 🚀 Advanced: Performance Review

For code that processes lots of data:

```python
# ❌ O(n²) - slow with large lists
for file in all_files:
    for other_file in all_files:
        if file.name == other_file.name:
            print("duplicate")

# ✅ O(n) - fast with large lists
seen = set()
for file in all_files:
    if file.name in seen:
        print("duplicate")
    seen.add(file.name)
```

Ask AI: **"For 10,000 files, which version would perform better? Why?"**

---

## 📋 Review Template

Use this for every piece of AI code:

```markdown
# Code Review: [Function Name]

## What It Does
(Summary of functionality)

## Strengths
- ✅ 
- ✅ 
- ✅ 

## Concerns
- ⚠️ 
- ⚠️ 
- ⚠️ 

## Edge Cases
What if [something unusual happens]?

## Questions for AI
- "..."
- "..."

## Iteration Needed?
Yes/No - if yes, what feedback should I give?
```

---

## 🎓 Learning Path

1. **Review 1-2 small functions** - Get the feel for it
2. **Use the checklist** - Don't skip steps
3. **Ask questions** - Engage with the AI
4. **Build confidence** - Start reviewing larger code
5. **Build your standards** - Know what "good" means to you

---

## 🔗 Next Steps

- ✅ Learn to review code (you are here)
- ⏭️ [Iteration Workflows](../iteration_workflows/README.md) - How to get from "it works" to "it's great"
- ⏭️ [Real Projects](../../../02_projects/) - Apply all these skills

Remember: **Your job isn't to write code. Your job is to direct AI to write good code. Reviewing is how you do that.**
