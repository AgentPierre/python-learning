# Projects

> **Real automation tools you'll build and actually use**

Each project is designed to teach essential Python concepts while solving real problems. You can approach these projects using either learning path (traditional or AI-native) or a hybrid approach.

---

## 🎯 Available Projects

### 1. Downloads Organizer ⭐ START HERE
**Difficulty:** Beginner  
**Time:** 2-4 hours  
**Folder:** [01_downloads_organizer/](01_downloads_organizer/)

Automatically organize files in your Downloads folder by type (images, documents, videos, etc.)

**Concepts:** File operations, dictionaries, loops, command-line arguments  
**Technologies**: Python 3, pathlib, shutil

---

### 2. Expense Tracker
**Difficulty:** Beginner-Intermediate  
**Time:** 4-6 hours  
**Folder:** [02_expense_tracker/](02_expense_tracker/)

Track monthly expenses, categorize spending, and generate simple reports

**Concepts:** CSV files, data structures, calculations, persistence  
**Technologies**: Python 3, CSV handling, date/time

---

### 3. Web Scraper
**Difficulty:** Intermediate  
**Time:** 6-8 hours  
**Folder:** [03_web_scraper/](03_web_scraper/)

Extract data from websites and save to CSV

**Concepts:** HTTP requests, HTML parsing, external libraries, error handling  
**Technologies**: Python 3, requests, BeautifulSoup4

---

### 4. PDF Invoice Generator
**Difficulty:** Intermediate-Advanced  
**Time:** 8-10 hours  
**Folder:** [04_pdf_invoice_generator/](04_pdf_invoice_generator/)

Generate professional PDF invoices from templates

**Concepts:** PDF generation, templates, formatting, complex data  
**Technologies**: Python 3, reportlab

---

## 📖 How to Use These Projects

### Traditional Learning Path:
1. Learn concepts first from `../../01_learning-paths/traditional/`
2. Complete relevant exercises
3. Build the project step-by-step
4. Document your learning

### AI-Native Learning Path:
1. Read project README
2. Define the problem in `ai_iterations/`
3. Build with AI collaboration
4. Review and understand the code
5. Document concepts learned

### Hybrid Approach:
1. Start building
2. When you hit unclear concepts, learn them traditionally
3. Return and apply what you learned
4. Continue building

---

## 🛠️ Project Structure

Each project contains:

```
project_name/
├── README.md              # Instructions & overview
├── main.py               # Main code
├── config.py             # Settings
├── requirements.txt      # Dependencies
├── data/                 # Sample data
├── tests/                # Tests (optional)
│
├── ai_iterations/        # AI-native learners
│   ├── 01_problem_definition.md
│   ├── 02_initial_build.md
│   └── 03_refinements.md
│
└── understanding/        # Concept breakdowns
    ├── concepts_used.md
    └── patterns.md
```

## Adding a New Project

1. Create a numbered folder: `05_project_name/`
2. Write a descriptive `README.md`
3. Include installation and usage instructions
4. List dependencies in `requirements.txt`
5. Add the project to this list

## Promoting to Standalone Repo

When a project is ready for its own repository:

1. Create new GitHub repo
2. Copy project folder contents to repo root
3. Expand README with:
   - Detailed description
   - Screenshots or demo
   - Installation guide
   - Usage examples
   - Contributing guidelines
4. Add badges (Python version, license)
5. Tag first release (v1.0.0)

## Best Practices

- Write clear documentation
- Include example usage
- Handle errors gracefully
- Add type hints for clarity
- Test with sample data
- Keep it simple and focused
