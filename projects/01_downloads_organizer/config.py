"""
Configuration for Downloads Organizer
Customize file categories and download paths here.
"""

from pathlib import Path

# Default downloads folder (customize for your system)
DOWNLOADS_PATH = Path.home() / "Downloads"

# File categories and their extensions
FILE_CATEGORIES = {
    "Images": [
        ".jpg", ".jpeg", ".png", ".gif", ".bmp", 
        ".svg", ".webp", ".ico", ".tiff", ".psd"
    ],
    "Documents": [
        ".pdf", ".doc", ".docx", ".txt", ".rtf",
        ".odt", ".xls", ".xlsx", ".ppt", ".pptx",
        ".csv", ".md"
    ],
    "Videos": [
        ".mp4", ".avi", ".mkv", ".mov", ".wmv",
        ".flv", ".webm", ".m4v", ".mpg", ".mpeg"
    ],
    "Music": [
        ".mp3", ".wav", ".flac", ".aac", ".ogg",
        ".wma", ".m4a", ".opus"
    ],
    "Archives": [
        ".zip", ".rar", ".7z", ".tar", ".gz",
        ".bz2", ".xz", ".iso"
    ],
    "Code": [
        ".py", ".js", ".html", ".css", ".java",
        ".cpp", ".c", ".h", ".sh", ".json",
        ".xml", ".yaml", ".yml", ".sql"
    ],
    "Executables": [
        ".exe", ".msi", ".dmg", ".pkg", ".deb",
        ".rpm", ".apk"
    ],
    "Fonts": [
        ".ttf", ".otf", ".woff", ".woff2"
    ]
}

# Folders to ignore (won't be moved)
IGNORE_FOLDERS = [
    "Images", "Documents", "Videos", "Music",
    "Archives", "Code", "Executables", "Fonts",
    "Miscellaneous"
]

# Files to ignore (won't be moved)
IGNORE_FILES = [
    ".DS_Store", "desktop.ini", "Thumbs.db"
]
