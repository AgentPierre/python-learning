"""
Downloads Organizer - Automatically organize files by type

Built with AI collaboration - See README.md for full development process
"""

import argparse
from pathlib import Path
from typing import Dict, List
import shutil

# Import configuration
try:
    from config import FILE_CATEGORIES, DOWNLOADS_PATH
except ImportError:
    # Fallback if config.py doesn't exist
    DOWNLOADS_PATH = Path.home() / "Downloads"
    FILE_CATEGORIES = {
        "Images": [".jpg", ".jpeg", ".png", ".gif", ".bmp", ".svg", ".webp"],
        "Documents": [".pdf", ".doc", ".docx", ".txt", ".xlsx", ".pptx", ".csv"],
        "Videos": [".mp4", ".avi", ".mkv", ".mov", ".wmv"],
        "Music": [".mp3", ".wav", ".flac", ".aac", ".ogg"],
        "Archives": [".zip", ".rar", ".7z", ".tar", ".gz"],
        "Code": [".py", ".js", ".html", ".css", ".java", ".cpp"],
    }


def get_file_category(file_extension: str) -> str:
    """
    Determine the category of a file based on its extension.
    
    Args:
        file_extension: The file extension (e.g., '.jpg')
    
    Returns:
        The category name (e.g., 'Images') or 'Other' if unknown
    """
    file_extension = file_extension.lower()
    
    for category, extensions in FILE_CATEGORIES.items():
        if file_extension in extensions:
            return category
    
    return "Other"


def get_unique_filename(destination: Path) -> Path:
    """
    Generate a unique filename by appending _1, _2, etc. if file exists.
    
    Args:
        destination: The target file path
    
    Returns:
        A unique file path that doesn't exist yet
    """
    if not destination.exists():
        return destination
    
    stem = destination.stem
    suffix = destination.suffix
    parent = destination.parent
    counter = 1
    
    while destination.exists():
        destination = parent / f"{stem}_{counter}{suffix}"
        counter += 1
    
    return destination


def organize_files(
    downloads_path: Path,
    dry_run: bool = False,
    verbose: bool = False
) -> Dict[str, int]:
    """
    Organize files in the downloads folder by type.
    
    Args:
        downloads_path: Path to the downloads folder
        dry_run: If True, only preview changes without moving files
        verbose: If True, print detailed information
    
    Returns:
        Dictionary with statistics: moved, skipped, errors
    """
    downloads_path = Path(downloads_path).expanduser()
    
    if not downloads_path.exists():
        print(f"❌ Error: Directory {downloads_path} does not exist.")
        return {"moved": 0, "skipped": 0, "errors": 0}
    
    # Get all files (not directories)
    files = [f for f in downloads_path.iterdir() if f.is_file()]
    
    # Skip hidden files
    files = [f for f in files if not f.name.startswith('.')]
    
    if not files:
        print("📁 No files to organize.")
        return {"moved": 0, "skipped": 0, "errors": 0}
    
    print(f"📂 Found {len(files)} files to organize")
    if dry_run:
        print("🔍 DRY RUN MODE - No files will be moved\n")
    print()
    
    stats = {"moved": 0, "skipped": 0, "errors": 0}
    skipped_files = []
    error_files = []
    
    for index, file_path in enumerate(files, 1):
        try:
            # Get file extension and category
            file_extension = file_path.suffix
            category = get_file_category(file_extension)
            
            # Create category folder path
            category_folder = downloads_path / category
            
            # Check if category folder exists as a file (edge case)
            if category_folder.exists() and not category_folder.is_dir():
                if verbose or dry_run:
                    print(f"⚠️  [{index}/{len(files)}] Skipped {file_path.name} - "
                          f"{category} exists as a file, not a folder")
                stats["skipped"] += 1
                skipped_files.append(file_path.name)
                continue
            
            # Skip if already in a category folder
            if file_path.parent.name in FILE_CATEGORIES:
                if verbose:
                    print(f"⏭️  [{index}/{len(files)}] Skipped {file_path.name} - "
                          f"already organized")
                stats["skipped"] += 1
                skipped_files.append(file_path.name)
                continue
            
            # Generate destination path
            destination = category_folder / file_path.name
            destination = get_unique_filename(destination)
            
            if verbose or dry_run:
                print(f"{'[DRY RUN] ' if dry_run else '✅ '}"
                      f"[{index}/{len(files)}] Moving: {file_path.name} → {category}/")
            
            # Move the file (unless dry run)
            if not dry_run:
                category_folder.mkdir(exist_ok=True)
                shutil.move(str(file_path), str(destination))
                stats["moved"] += 1
        
        except PermissionError:
            print(f"⚠️  [{index}/{len(files)}] Skipped {file_path.name} - "
                  f"file is in use or permission denied")
            stats["skipped"] += 1
            skipped_files.append(file_path.name)
        
        except FileNotFoundError:
            print(f"⚠️  [{index}/{len(files)}] Skipped {file_path.name} - "
                  f"file disappeared during processing")
            stats["skipped"] += 1
            skipped_files.append(file_path.name)
        
        except Exception as e:
            print(f"❌ [{index}/{len(files)}] Error with {file_path.name}: {e}")
            stats["errors"] += 1
            error_files.append((file_path.name, str(e)))
    
    # Print summary
    print("\n" + "="*50)
    print("📊 SUMMARY")
    print("="*50)
    
    if not dry_run:
        print(f"✅ Files moved: {stats['moved']}")
    else:
        print(f"🔍 Files that would be moved: {len(files) - stats['skipped'] - stats['errors']}")
    
    if stats['skipped'] > 0:
        print(f"⏭️  Files skipped: {stats['skipped']}")
        if verbose and skipped_files:
            print(f"   └─ {', '.join(skipped_files[:5])}"
                  f"{'...' if len(skipped_files) > 5 else ''}")
    
    if stats['errors'] > 0:
        print(f"❌ Errors: {stats['errors']}")
        if error_files:
            for filename, error in error_files[:3]:
                print(f"   └─ {filename}: {error}")
            if len(error_files) > 3:
                print(f"   └─ ... and {len(error_files) - 3} more")
    
    if not dry_run and stats['moved'] > 0:
        print(f"\n🎉 Successfully organized {stats['moved']} files!")
    elif dry_run:
        print(f"\n💡 Run without --dry-run to apply these changes")
    
    return stats


def main():
    """Main entry point for the script."""
    parser = argparse.ArgumentParser(
        description="Organize downloads folder by file type",
        epilog="Example: python main.py --dry-run --verbose"
    )
    parser.add_argument(
        "--path",
        type=str,
        default=str(DOWNLOADS_PATH),
        help="Path to the downloads folder (default: ~/Downloads)"
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Preview changes without moving files"
    )
    parser.add_argument(
        "--verbose",
        action="store_true",
        help="Print detailed information about each file"
    )
    
    args = parser.parse_args()
    
    print("🗂️  Downloads Organizer")
    print(f"📁 Target folder: {args.path}\n")
    
    organize_files(args.path, dry_run=args.dry_run, verbose=args.verbose)


if __name__ == "__main__":
    main()
