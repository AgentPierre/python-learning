# Downloads Organizer

Automatically organize files in your Downloads folder by file type.

## Description

This script monitors your Downloads folder and automatically moves files into organized subfolders based on their file extensions (images, documents, videos, music, archives, etc.).

## Features

- Automatic file categorization
- Customizable folder structure
- Handles duplicate filenames
- Dry-run mode for testing
- Logging of all operations

## Installation

```bash
# Navigate to the project directory
cd projects/01_downloads_organizer

# Install dependencies
pip install -r requirements.txt
```

## Usage

### Basic Usage

```bash
python main.py
```

### Options

```bash
# Dry run (preview changes without moving files)
python main.py --dry-run

# Specify custom Downloads folder
python main.py --path /path/to/folder

# Enable verbose logging
python main.py --verbose
```

## Configuration

Edit `config.py` to customize:
- File type categories
- Destination folder names
- Excluded files or folders

## File Categories

- **Images**: .jpg, .jpeg, .png, .gif, .bmp, .svg, .webp
- **Documents**: .pdf, .doc, .docx, .txt, .xlsx, .pptx
- **Videos**: .mp4, .avi, .mkv, .mov, .wmv
- **Music**: .mp3, .wav, .flac, .aac
- **Archives**: .zip, .rar, .7z, .tar, .gz
- **Code**: .py, .js, .html, .css, .java, .cpp
- **Others**: Everything else goes to "Miscellaneous"

## Example

**Before:**
```
Downloads/
├── vacation.jpg
├── report.pdf
├── song.mp3
└── archive.zip
```

**After:**
```
Downloads/
├── Images/
│   └── vacation.jpg
├── Documents/
│   └── report.pdf
├── Music/
│   └── song.mp3
└── Archives/
    └── archive.zip
```

## Requirements

- Python 3.8+
- See `requirements.txt` for package dependencies

## Future Enhancements

- [ ] Schedule automatic organization (cron job)
- [ ] GUI interface
- [ ] Undo last organization
- [ ] Smart categorization using file content
- [ ] Custom rules based on filename patterns

## License

MIT License
