# Iteration Workflows

> **From "it works" to "it's great": How to iterate with AI to improve solutions**

You've got code that works. Now you're going to iterate on it until it's something you're proud of. This is where good solutions become great ones.

---

## 🎯 The Iteration Philosophy

**Not every problem has one right answer.** Often you have:
- A solution that works
- A solution that's elegant
- A solution that's maintainable
- A solution that's performant
- A solution that's robust

**Through iteration, you move from "works" toward "great."**

---

## 🔄 The Iteration Cycle

### Phase 1: Get It Working (First Pass)

```
Your Prompt: "Build me a download organizer"
↓
AI: [Generates working code]
↓
You: Test it - does it do the job?
↓
Result: Basic, working solution
```

**Goal:** The code solves your original problem.

**Your Review:** Does it work? Yes/no?

---

### Phase 2: Make It Robust (Handle Edge Cases)

Once working, start asking: **What could go wrong?**

```
You Ask AI: 
  "What edge cases might break this? 
   - Files with no extension?
   - Very long filenames?
   - Symlinks in the downloads folder?
   - Files the script can't read?"

AI: [Identifies issues and fixes them]
```

**Goal:** Code handles unusual scenarios.

**Your Review:** Does it handle edge cases gracefully?

---

### Phase 3: Make It Maintainable (Clean It Up)

Code that's easy to understand and modify:

```
You Ask AI:
  "This function is hard to follow. Can you:
   - Break it into smaller functions
   - Add clear variable names
   - Add comments explaining the logic
   - Follow PEP 8 style"

AI: [Refactors the code]
```

**Goal:** You (or someone else) can understand every line.

**Your Review:** Can you explain what's happening?

---

### Phase 4: Make It Performant (Speed It Up)

If processing lots of data:

```
You Ask AI:
  "This processes 10,000 files slowly. 
   Can you:
   - Identify performance bottlenecks
   - Use more efficient algorithms
   - Add progress reporting
   - Benchmark the improvement"

AI: [Optimizes the code]
```

**Goal:** It runs fast enough for real-world use.

**Your Review:** Does it complete in reasonable time?

---

### Phase 5: Make It Professional (Polish)

Final touches for production-ready code:

```
You Ask AI:
  "This is close to complete. Can you add:
   - Better error messages
   - Logging for debugging
   - A --dry-run option (preview changes)
   - Configuration file support
   - Help documentation"

AI: [Adds professional features]
```

**Goal:** Code feels complete and reliable.

**Your Review:** Would you feel confident using this regularly?

---

## 📋 The Iteration Checklist

Track your iterations with this:

```markdown
# [Project Name] Iteration Log

## Iteration 1: Basic Functionality ✅
- Prompt: "Build me..."
- Result: Working but basic
- Issues found: None yet

## Iteration 2: Edge Cases ✅
- Prompt: "Handle these edge cases..."
- Result: More robust
- Issues found: Crashes with Unicode filenames

## Iteration 3: Code Quality ⏳
- Prompt: "Refactor for readability..."
- Result: Cleaner code
- Issues found: Could use more comments

## Iteration 4: Performance ⏳
- Prompt: "Optimize for large datasets..."

## Iteration 5: Polish ⏳
- Prompt: "Add professional features..."
```

---

## 🎨 Example Iteration Session

### Start: Working Downloads Organizer

```python
import os
import shutil
from pathlib import Path

def organize():
    d = Path.home() / "Downloads"
    for f in d.iterdir():
        if f.is_file():
            ext = f.suffix[1:]  # Remove the dot
            if ext:
                sd = d / ext
                sd.mkdir(exist_ok=True)
                shutil.move(str(f), sd)
```

**Status:** Works for basic case, but rough around the edges.

---

### Iteration 1: Edge Cases

**You ask:** "What breaks this? Handle edge cases."

```python
import os
import shutil
from pathlib import Path
import logging

logging.basicConfig(level=logging.INFO)

def organize():
    downloads = Path.home() / "Downloads"
    
    if not downloads.exists():
        logging.error("Downloads folder not found")
        return
    
    for file in downloads.iterdir():
        try:
            if not file.is_file():
                continue
            
            # Handle files with no extension
            if not file.suffix:
                folder_name = "no_extension"
            else:
                folder_name = file.suffix[1:]  # Remove dot
            
            # Create folder
            target_dir = downloads / folder_name
            target_dir.mkdir(exist_ok=True)
            
            # Move file
            target_file = target_dir / file.name
            if target_file.exists():
                logging.warning(f"Skipping {file.name} - already exists")
                continue
            
            shutil.move(str(file), str(target_file))
            logging.info(f"Organized: {file.name} → {folder_name}/")
            
        except Exception as e:
            logging.error(f"Error processing {file.name}: {e}")
```

**Better:** Handles edge cases, has logging, doesn't crash.

---

### Iteration 2: Maintainability

**You ask:** "Break this into functions. Add documentation."

```python
"""Download Organizer - Automatically organize downloads by type."""

import os
import shutil
from pathlib import Path
import logging

logging.basicConfig(
    level=logging.INFO,
    format='%(levelname)s: %(message)s'
)

def get_folder_name(file: Path) -> str:
    """Determine the organization folder for a file."""
    if not file.suffix:
        return "no_extension"
    return file.suffix[1:].lower()  # Remove dot, lowercase

def safe_move_file(source: Path, target_dir: Path) -> bool:
    """Move a file, handling collisions safely."""
    target_file = target_dir / source.name
    
    if target_file.exists():
        logging.warning(f"Skipping {source.name} - already exists")
        return False
    
    try:
        shutil.move(str(source), str(target_file))
        logging.info(f"Organized: {source.name} → {target_dir.name}/")
        return True
    except Exception as e:
        logging.error(f"Error moving {source.name}: {e}")
        return False

def organize_downloads() -> None:
    """Main function - organize files in Downloads folder."""
    downloads = Path.home() / "Downloads"
    
    if not downloads.exists():
        logging.error("Downloads folder not found")
        return
    
    for file in downloads.iterdir():
        if not file.is_file():
            continue
        
        folder_name = get_folder_name(file)
        target_dir = downloads / folder_name
        target_dir.mkdir(exist_ok=True)
        
        safe_move_file(file, target_dir)

if __name__ == "__main__":
    organize_downloads()
```

**Much better:** Clear functions, docstrings, easier to modify.

---

### Iteration 3: Performance & Polish

**You ask:** "Add dry-run mode so users preview changes first."

```python
def organize_downloads(dry_run: bool = False) -> None:
    """Organize files in Downloads folder.
    
    Args:
        dry_run: If True, show what would happen without making changes.
    """
    downloads = Path.home() / "Downloads"
    
    if not downloads.exists():
        logging.error("Downloads folder not found")
        return
    
    if dry_run:
        logging.info("DRY RUN: No files will be moved")
    
    for file in downloads.iterdir():
        if not file.is_file():
            continue
        
        folder_name = get_folder_name(file)
        target_dir = downloads / folder_name
        
        if dry_run:
            logging.info(f"  Would move: {file.name} → {folder_name}/")
        else:
            target_dir.mkdir(exist_ok=True)
            safe_move_file(file, target_dir)

if __name__ == "__main__":
    import sys
    dry_run = "--dry-run" in sys.argv
    organize_downloads(dry_run=dry_run)
```

**Professional:** Users can preview changes before executing.

---

## 💡 Iteration Prompting Patterns

### Pattern 1: "What's Missing?"
```
"This solution works, but when would it fail?
What edge cases haven't I considered?"
```

### Pattern 2: "Make It Better"
```
"This code works but feels clunky. 
Refactor it to be cleaner and easier to understand."
```

### Pattern 3: "Professional Polish"
```
"It works. Now make it production-ready:
- Better error handling
- Logging
- Clear messages to the user
- Graceful failure modes"
```

### Pattern 4: "Add a Feature"
```
"The basic version is working. 
Now add [specific feature] while maintaining what works."
```

### Pattern 5: "Explain the Trade-offs"
```
"I have two approaches. What are the trade-offs?
When would you use each?"
```

---

## 🎯 When to Stop Iterating

You're done when:

✅ **It solves the original problem**  
✅ **It handles edge cases gracefully**  
✅ **You understand every line of code**  
✅ **It's maintainable for future changes**  
✅ **It performs adequately for your use case**  
✅ **It feels professional and complete**  

**Don't aim for perfection.** Aim for "good enough that I'm proud of it."

---

## 📊 Typical Iteration Counts

**Simple scripts:** 2-3 iterations  
- First: Get it working
- Second: Handle edge cases
- Third: Clean it up

**Medium projects:** 4-5 iterations  
- Add robustness
- Improve performance
- Polish for users

**Complex projects:** 5-10 iterations  
- Each feature gets refined
- Integration takes time
- User experience polishing

---

## 🚀 Next Steps

- ✅ Learn iteration workflows (you are here)
- ⏭️ [Apply to real projects](../../../02_projects/) - Use all techniques together
- ⏭️ [Code review](../reviewing_ai_code/README.md) - Review AI's improvements

Remember: **Great solutions come through iteration, not in one shot.**
