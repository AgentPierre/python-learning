# Problem-Solving Frameworks

> **The skill that matters: Breaking down problems into solvable pieces**

## Why This Comes First

**Traditional approach:** Learn syntax → Learn concepts → Finally solve problems

**AI-native approach:** Start with problems → Use AI to solve → Learn concepts as needed

**Your job isn't to write code. It's to solve problems. AI helps with the code part.**

---

## Framework 1: The Problem Definition Canvas

Before writing ANY code (or asking AI to), fill this out:

### 1. Current State (What Sucks Now)
```
What's the problem?
- My downloads folder has 500+ files
- I can't find anything
- Takes 10 minutes to locate one file
- Files are randomly named
```

### 2. Desired State (What Success Looks Like)
```
What do I want instead?
- Files automatically organized by type
- Easy to find things in seconds
- Consistent folder structure
- Takes zero manual effort
```

### 3. Success Criteria (How I Know It Works)
```
I'll know this works when:
- All files are in the right folders
- I can find any file in under 30 seconds
- It runs without my intervention
- No files are lost or corrupted
```

### 4. Constraints (What I Can't Do)
```
Limitations:
- Can't delete any files
- Can't modify file contents
- Must work on both Mac and Windows
- Can't require admin privileges
```

### 5. Edge Cases (What Could Go Wrong)
```
Potential issues:
- Duplicate filenames
- Files currently in use
- Unknown file types
- Very large files (GB+)
- Permission errors
```

---

## Framework 2: The Five Whys

When you're unclear about what you actually need:

**Problem:** "My downloads folder is messy"

**Why?** → Because files aren't organized  
**Why?** → Because I download things from different sources  
**Why?** → Because I work on multiple projects  
**Why?** → Because I need to reference files later  
**Why?** → Because I often can't find what I need quickly  

**Real problem:** Not messy folders, but **inefficient file retrieval**

**Solution shifts from:**
- ❌ "Organize files once" 
- ✅ "Create a system for quick file retrieval"

---

## Framework 3: Break It Down (Decomposition)

Take any large problem and break it into small, AI-friendly pieces.

### Example: "Build an expense tracker"

#### Step 1: List Everything It Needs to Do
```
- Add an expense
- View all expenses
- See spending by category
- See monthly totals
- Export to CSV
- Edit/delete expenses
```

#### Step 2: Order by Dependency
```
1. Store expense data (everything else needs this)
2. Add expenses (need to add before viewing)
3. View expenses (need data to view)
4. Calculate totals (need data)
5. Export data (build on viewing)
6. Edit/delete (advanced features)
```

#### Step 3: Start with Minimum Viable Product (MVP)
```
Week 1 MVP:
✅ Store expenses in JSON
✅ Add expense via terminal
✅ View all expenses
❌ Categories (add later)
❌ Export (add later)
❌ Edit (add later)
```

#### Step 4: Build Iteratively
```
Sprint 1: Basic add/view (Week 1)
Sprint 2: Add categories (Week 2)
Sprint 3: Add totals/export (Week 3)
Sprint 4: Add edit/delete (Week 4)
```

**With AI, you can build each sprint in a day!**

---

## Framework 4: The AI Collaboration Workflow

### Phase 1: Human Defines Problem (Your Job)
```
I need: [Clear description]
It should: [Specific requirements]
It must handle: [Edge cases]
Success looks like: [Criteria]
```

### Phase 2: AI Builds Solution (AI's Job)
```
[AI generates code based on your requirements]
```

### Phase 3: Human Reviews (Your Job)
```
Questions to ask:
- Does this solve the problem?
- Are there edge cases missing?
- Is this code understandable?
- What would break this?
```

### Phase 4: Iterate Together (Collaborative)
```
You: "This doesn't handle duplicate files"
AI: [Adds duplicate handling]
You: "What if the file is in use?"
AI: [Adds error handling]
You: "Can you add logging?"
AI: [Adds logging]
```

### Phase 5: Understand and Document (Your Job)
```
Document:
- What problem this solves
- How the solution works
- What you learned
- What could be improved
```

---

## Framework 5: The Debugging Mindset

When things go wrong (and they will):

### Step 1: Observe
```
What's happening?
- Expected: Files should move to folders
- Actual: Script crashes with "Permission Denied"
```

### Step 2: Isolate
```
Where exactly does it fail?
- Works for .txt files
- Fails for .pdf files
- Only fails on files downloaded today
```

### Step 3: Hypothesis
```
Why might this be happening?
- Maybe PDFs are still open in preview?
- Maybe they don't have read permissions?
- Maybe filename has special characters?
```

### Step 4: Test
```
How can I verify?
- Close all PDF viewers → Test again
- Check file permissions → ls -l file.pdf
- Try renaming file → Test again
```

### Step 5: Fix and Learn
```
Solution:
- Add try/except for permission errors
- Skip files that are in use
- Log which files couldn't be moved

Learning:
- Always handle permission errors
- Check if file is open before moving
- Provide feedback on failures
```

---

## Real-World Example: Downloads Organizer

Let's apply all frameworks:

### 1. Problem Definition Canvas

**Current State:**
- 500+ files in downloads
- Mix of work, personal, random stuff
- Waste time searching
- Duplicate files everywhere

**Desired State:**
- Auto-organized by type
- Easy to find anything
- Run daily without thinking
- Visual confirmation it worked

**Success Criteria:**
- Organizes 500 files in under 30 seconds
- Zero files lost
- Creates logical folder structure
- Shows me what it did

**Constraints:**
- No deletion
- No modification
- Must work on Mac
- No admin needed

**Edge Cases:**
- Duplicates
- Files in use
- Unknown types
- Hidden files

---

### 2. Break It Down

**MVP (Day 1):**
```python
# Just get it working
for file in downloads:
    move to folder by extension
```

**Sprint 2 (Day 2):**
```python
# Handle duplicates
if file exists:
    add _1, _2, etc.
```

**Sprint 3 (Day 3):**
```python
# Add categories
group .jpg/.png into Images/
group .pdf/.doc into Documents/
```

**Sprint 4 (Day 4):**
```python
# Production ready
add error handling
add --dry-run flag
add logging
```

---

### 3. AI Collaboration

**Round 1: Initial Ask**
```
Build a Python script that organizes downloads by extension.
Move .jpg files to Images/, .pdf to Documents/, etc.
Handle duplicate filenames.
```

**Round 2: Refinement**
```
Add error handling for:
- Files in use
- Permission errors
- Unknown file types (move to Other/)
```

**Round 3: Polish**
```
Add:
- --dry-run flag to preview
- Logging of all operations
- Progress indicator
```

**Result:** Production-quality tool built collaboratively

---

## Practice Template

Use this for any problem:

```markdown
# Problem: [Name]

## 1. Problem Definition
**Current pain:** [What sucks]
**Desired outcome:** [What you want]
**Success criteria:** [How you measure it]

## 2. Decomposition
**Core features:**
1. [Must have]
2. [Must have]
3. [Must have]

**Nice to have:**
- [Future feature]
- [Future feature]

## 3. MVP Scope
**Week 1:**
- [ ] [Minimal feature 1]
- [ ] [Minimal feature 2]
- [ ] [Minimal feature 3]

## 4. Edge Cases
- [What could go wrong]
- [Unusual scenario]
- [Error condition]

## 5. Implementation Plan
**Step 1:** [First thing to build]
**Step 2:** [Second thing]
**Step 3:** [Third thing]

## 6. AI Prompt Draft
[Write detailed prompt using templates from prompting_mastery/]

## 7. Review Checklist
- [ ] Solves the core problem?
- [ ] Handles edge cases?
- [ ] Understandable code?
- [ ] Can explain how it works?
```

---

## Common Patterns You'll Recognize

### Pattern 1: File Operations
```
Problem type: "Work with files/folders"
Solution approach:
- Use pathlib
- Loop through files
- Filter by criteria
- Apply transformation
```

### Pattern 2: Data Tracking
```
Problem type: "Track/log information"
Solution approach:
- Store in JSON/CSV
- Add new entries
- Query/filter data
- Export reports
```

### Pattern 3: Automation
```
Problem type: "Repetitive task"
Solution approach:
- Identify steps
- Script each step
- Handle errors
- Schedule to run
```

### Pattern 4: Web Data
```
Problem type: "Get data from websites"
Solution approach:
- Fetch page (requests)
- Parse HTML (BeautifulSoup)
- Extract data
- Store results
```

---

## The Meta-Skill: Knowing What to Build

**Good problem solvers don't just solve problems. They solve the RIGHT problems.**

### Bad: "Build a file organizer"
**Why bad:** Too vague, might not solve real need

### Better: "Build a file organizer that groups by type"
**Why better:** More specific, clear outcome

### Best: "Build a system that lets me find any file in under 30 seconds"
**Why best:** Focuses on the actual need, not the assumed solution

**Sometimes the right solution isn't code at all!**
- "I need to organize files" → Maybe you need better naming conventions
- "I need to track expenses" → Maybe you need to simplify your spending
- "I need to automate X" → Maybe X doesn't need to be done

**Ask: "What am I actually trying to achieve?"**

---

## Practice Challenges

Apply these frameworks to:

1. **Real problem from your life**
   - Use Problem Definition Canvas
   - Break it down
   - Create implementation plan

2. **Challenge from `real_world_challenges/`**
   - Apply all 5 frameworks
   - Write AI prompts
   - Build solution

3. **Debug a broken script**
   - Use Debugging Mindset
   - Document the process
   - Extract learnings

---

## Key Takeaways

1. **Define before building** - Most failures happen here
2. **Break it down** - Small pieces are easier to solve
3. **Start with MVP** - Working imperfect > Perfect unfinished
4. **Iterate with AI** - Collaboration beats solo work
5. **Learn from problems** - Each problem teaches patterns

**Master problem decomposition, and AI becomes your superpower.**

---

## Next Steps

1. Pick a real problem you have
2. Fill out the Problem Definition Canvas
3. Break it into small pieces
4. Write a detailed AI prompt
5. Build it iteratively
6. Document learnings

**Go to `real_world_challenges/` and start solving! 🚀**
