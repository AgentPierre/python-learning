"""
Downloads Organizer
Automatically organize files in the Downloads folder by file type.
"""

import os
import shutil
from pathlib import Path
from datetime import datetime
import argparse

# Import configuration
from config import FILE_CATEGORIES, DOWNLOADS_PATH


def get_file_category(file_extension):
    """
    Determine the category of a file based on its extension.
    
    Args:
        file_extension (str): The file extension (e.g., '.jpg')
    
    Returns:
        str: The category name (e.g., 'Images')
    """
    file_extension = file_extension.lower()
    
    for category, extensions in FILE_CATEGORIES.items():
        if file_extension in extensions:
            return category
    
    return "Miscellaneous"


def organize_files(downloads_path, dry_run=False, verbose=False):
    """
    Organize files in the downloads folder.
    
    Args:
        downloads_path (Path): Path to the downloads folder
        dry_run (bool): If True, only preview changes without moving files
        verbose (bool): If True, print detailed information
    """
    downloads_path = Path(downloads_path)
    
    if not downloads_path.exists():
        print(f"Error: Directory {downloads_path} does not exist.")
        return
    
    # Get all files in the downloads folder (not directories)
    files = [f for f in downloads_path.iterdir() if f.is_file()]
    
    if not files:
        print("No files to organize.")
        return
    
    print(f"Found {len(files)} files to organize.")
    if dry_run:
        print("DRY RUN MODE - No files will be moved.\n")
    
    moved_count = 0
    
    for file_path in files:
        # Get file extension
        file_extension = file_path.suffix
        
        # Determine category
        category = get_file_category(file_extension)
        
        # Create category folder if it doesn't exist
        category_folder = downloads_path / category
        
        # Destination path
        destination = category_folder / file_path.name
        
        # Handle duplicate filenames
        counter = 1
        while destination.exists():
            stem = file_path.stem
            destination = category_folder / f"{stem}_{counter}{file_extension}"
            counter += 1
        
        if verbose or dry_run:
            print(f"{'[DRY RUN] ' if dry_run else ''}Moving: {file_path.name} → {category}/")
        
        # Move the file (unless dry run)
        if not dry_run:
            category_folder.mkdir(exist_ok=True)
            shutil.move(str(file_path), str(destination))
            moved_count += 1
    
    if not dry_run:
        print(f"\n✓ Successfully organized {moved_count} files!")
    else:
        print(f"\n[DRY RUN] Would organize {len(files)} files.")


def main():
    """Main function to run the organizer."""
    parser = argparse.ArgumentParser(description="Organize downloads folder by file type")
    parser.add_argument(
        "--path",
        type=str,
        default=DOWNLOADS_PATH,
        help="Path to the downloads folder"
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Preview changes without moving files"
    )
    parser.add_argument(
        "--verbose",
        action="store_true",
        help="Print detailed information"
    )
    
    args = parser.parse_args()
    
    print(f"Downloads Organizer")
    print(f"Target folder: {args.path}\n")
    
    organize_files(args.path, dry_run=args.dry_run, verbose=args.verbose)


if __name__ == "__main__":
    main()
