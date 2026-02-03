# Quick Reference - Repository Structure

Use this as a quick guide for where to put things!

## 🤔 Where Should This Go?

### "I'm following along with a course lesson"
→ **`courses/[course_name]/[chapter_or_section]/`**

Example: `courses/freecodecamp/02_variables_datatypes/numbers.py`

---

### "I'm practicing a concept I learned"
→ **`exercises/[topic]/`**

Example: `exercises/02_data_structures/lists.py`

---

### "I'm building a functional tool or project"
→ **`projects/[project_number]_[project_name]/`**

Example: `projects/01_downloads_organizer/main.py`

---

### "I want to write down what I learned today"
→ **`notes/`**

Example: `notes/week01_basics.md`

---

### "I found a helpful link/article"
→ **`notes/resources.md`**

---

## 📁 Folder Quick Guide

| Folder | Purpose | Example File |
|--------|---------|--------------|
| `notes/` | Learning notes & summaries | `week02_data_structures.md` |
| `exercises/` | Practice scripts by topic | `exercises/03_functions/lambda.py` |
| `courses/` | Course-specific code | `courses/automate_the_boring_stuff/ch08_files/` |
| `projects/` | Functional tools & apps | `projects/01_downloads_organizer/main.py` |

## 🎯 File Naming Best Practices

### Good Names ✅
- `password_validator.py`
- `file_renamer.py`
- `week03_functions.md`
- `lists_practice.py`

### Bad Names ❌
- `test.py`
- `script2.py`
- `untitled.py`
- `asdf.py`

## 🔄 Git Workflow Cheat Sheet

```bash
# Start your coding session
cd python-learning
git status                    # See what changed

# After adding/editing files
git add .                     # Stage all changes
git commit -m "Descriptive message"  # Commit
git push                      # Upload to GitHub

# Pull latest changes (if working from multiple computers)
git pull
```

## 📝 Commit Message Examples

### Good Commit Messages ✅
- `"Add week 2 exercises on data structures"`
- `"Complete freeCodeCamp section on functions"`
- `"Build downloads organizer project"`
- `"Fix bug in expense tracker calculation"`

### Bad Commit Messages ❌
- `"update"`
- `"stuff"`
- `"changes"`
- `"asdf"`

## 🚀 Project Checklist

When creating a new project, make sure it has:

- [ ] Numbered folder (e.g., `05_project_name/`)
- [ ] `README.md` with description and usage
- [ ] Main script with descriptive name
- [ ] `requirements.txt` (if using external packages)
- [ ] Comments explaining the code
- [ ] Example usage or sample data

## 📊 Progress Tracking

Update your main `README.md` weekly:
1. Check off completed topics
2. Update "Current Focus"
3. Add new projects to Featured Projects
4. Update "Last Updated" date

## 🎓 Learning Tips

1. **Code every day** - Even 30 minutes helps
2. **Type, don't copy** - Muscle memory matters
3. **Break things** - That's how you learn
4. **Comment your code** - Future you will thank you
5. **Push to GitHub daily** - Build that green commit graph!

## 📞 Need Help?

- Stuck on a concept? → Check `notes/resources.md`
- Git issues? → See `SETUP_GUIDE.md`
- Not sure where to put a file? → This guide!

---

**Pro Tip**: Bookmark this file! You'll reference it often in your first few weeks.
