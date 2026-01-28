# Projects

Fully functional automation tools and mini-applications. These are polished scripts you'd actually use.

## Current Projects

### 1. Downloads Organizer
Automatically sorts files in your Downloads folder by file type (images, documents, videos, etc.).

**Status**: 🚧 In Progress  
**Technologies**: Python 3, pathlib, shutil

---

### 2. Expense Tracker
Track monthly expenses, categorize spending, and generate visual reports.

**Status**: 📝 Planned  
**Technologies**: Python 3, pandas, matplotlib

---

### 3. Web Scraper
Extract data from websites and export to CSV for analysis.

**Status**: 📝 Planned  
**Technologies**: Python 3, requests, BeautifulSoup, csv

---

### 4. PDF Invoice Generator
Generate professional PDF invoices from template and data.

**Status**: 📝 Planned  
**Technologies**: Python 3, reportlab or weasyprint

---

## Project Structure

Each project follows this structure:

```
project_name/
├── README.md           # Project overview, setup, usage
├── main.py             # Main script
├── requirements.txt    # Dependencies
├── config.py           # Configuration (optional)
├── data/               # Sample/test data
└── tests/              # Unit tests (optional)
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
