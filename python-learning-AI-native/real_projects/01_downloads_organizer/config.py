"""
Configuration for Downloads Organizer

Customize file categories and paths here. Changes take effect immediately.
"""

from pathlib import Path

# Default downloads folder (change to your preferred location)
DOWNLOADS_PATH = Path.home() / "Downloads"

# File categories and their extensions
# Add or modify categories and extensions as needed
FILE_CATEGORIES = {
    "Images": [
        ".jpg", ".jpeg", ".png", ".gif", ".bmp",
        ".svg", ".webp", ".ico", ".tiff", ".psd",
        ".heic", ".raw"
    ],
    "Documents": [
        ".pdf", ".doc", ".docx", ".txt", ".rtf",
        ".odt", ".xls", ".xlsx", ".ppt", ".pptx",
        ".csv", ".md", ".pages", ".numbers", ".key"
    ],
    "Videos": [
        ".mp4", ".avi", ".mkv", ".mov", ".wmv",
        ".flv", ".webm", ".m4v", ".mpg", ".mpeg",
        ".3gp", ".ogv"
    ],
    "Music": [
        ".mp3", ".wav", ".flac", ".aac", ".ogg",
        ".wma", ".m4a", ".opus", ".alac"
    ],
    "Archives": [
        ".zip", ".rar", ".7z", ".tar", ".gz",
        ".bz2", ".xz", ".iso", ".dmg"
    ],
    "Code": [
        ".py", ".js", ".html", ".css", ".java",
        ".cpp", ".c", ".h", ".sh", ".json",
        ".xml", ".yaml", ".yml", ".sql", ".go",
        ".rs", ".ts", ".jsx", ".tsx", ".php"
    ],
    "Executables": [
        ".exe", ".msi", ".dmg", ".pkg", ".deb",
        ".rpm", ".apk", ".app"
    ],
    "Fonts": [
        ".ttf", ".otf", ".woff", ".woff2", ".eot"
    ],
    "Books": [
        ".epub", ".mobi", ".azw", ".azw3"
    ]
}

# Advanced Configuration (Optional)

# Folders to ignore (won't be moved)
IGNORE_FOLDERS = [
    "Images", "Documents", "Videos", "Music",
    "Archives", "Code", "Executables", "Fonts",
    "Books", "Other"
]

# Specific files to always ignore
IGNORE_FILES = [
    ".DS_Store", "desktop.ini", "Thumbs.db",
    ".localized"
]

# Maximum file size to process (in MB, 0 = no limit)
MAX_FILE_SIZE_MB = 0

# Minimum file age (in days, 0 = process all)
# Useful if you want to only organize older files
MIN_FILE_AGE_DAYS = 0
