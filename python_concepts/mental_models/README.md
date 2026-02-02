# Python Mental Models

> **Understanding how Python thinks - concepts that stick even after months away**

## Why Mental Models Matter

**Bad Learning:** "A for loop uses this syntax..."  
**Good Learning:** "A loop is about doing something repeatedly"

Mental models help you:
- Remember concepts, not syntax
- Recognize patterns in unfamiliar code
- Ask AI better questions
- Debug with intuition

---

## Mental Model 1: Everything is an Object

### The Concept
In Python, literally everything is an object with:
- **State** (what it knows/stores)
- **Behavior** (what it can do)

### Real-World Analogy
Think of objects like tools in a toolbox:
- A hammer (object) has a weight (state) and can pound nails (behavior)
- A screwdriver has a size (state) and can turn screws (behavior)

### In Python
```python
# Even simple numbers are objects
number = 42
number.bit_length()  # It can do things! Returns 6

# Strings are objects
text = "hello"
text.upper()        # Returns "HELLO"
text.count("l")     # Returns 2

# Lists are objects
items = [1, 2, 3]
items.append(4)     # Changes the list
items.reverse()     # Changes the list
```

### Why This Matters
When you see `something.method()`, you're asking that object to do something for you. The dot (`.`) means "ask this object to..."

### Common Pattern
```python
path = Path("downloads")    # Create an object
path.exists()              # Ask it a question
path.mkdir()               # Tell it to do something
```

**Remember:** `object.action()` = "Hey object, do this action"

---

## Mental Model 2: The Loop Mindset

### The Concept
Loops aren't about syntax - they're about repetition with variation.

### Real-World Analogy
Going through your mail:
```
For each letter in the mailbox:
    - Look at the sender
    - Decide if it's important
    - Put it in the right pile
```

### In Python
```python
for letter in mailbox:
    if is_important(letter):
        important_pile.append(letter)
    else:
        junk_pile.append(letter)
```

### Mental Template
**"For each _____ in _____, do _____"**

Examples:
- "For each file in the folder, check its extension"
- "For each number in the list, double it"
- "For each line in the file, count the words"

### When You See Loop Code
```python
for file in folder.glob("*"):
    if file.suffix == ".jpg":
        process_image(file)
```

**Read it as:** "Go through every file in the folder. When you find a JPG, process it."

### The Power Move: List Comprehensions
Same mental model, compressed:
```python
# Long form
results = []
for item in items:
    if condition(item):
        results.append(transform(item))

# Compressed (same logic)
results = [transform(item) for item in items if condition(item)]
```

**Read it as:** "Transform and keep items that match the condition"

---

## Mental Model 3: Containers and What They Hold

### The Concept
Python has different ways to hold collections of things. Each has a purpose.

### Real-World Analogy
- **List** = Bookshelf (ordered, you can add/remove)
- **Tuple** = Photo in a frame (ordered, can't change)
- **Dictionary** = Filing cabinet (labeled drawers)
- **Set** = Bag of unique items (no duplicates, no order)

### Lists: Ordered, Changeable
```python
# Like a playlist - order matters, you can edit
playlist = ["song1.mp3", "song2.mp3", "song3.mp3"]
playlist.append("song4.mp3")      # Add to end
playlist.remove("song2.mp3")       # Remove one
first_song = playlist[0]           # Get by position
```

**Use when:** You need an ordered, editable collection

### Dictionaries: Key-Value Pairs
```python
# Like a contact list - look up by name
contacts = {
    "Alice": "555-1234",
    "Bob": "555-5678"
}
alice_number = contacts["Alice"]   # Look up by key
contacts["Charlie"] = "555-9999"   # Add new entry
```

**Use when:** You need to look things up by name/label

### Sets: Unique Items Only
```python
# Like a collection of unique stamps
file_types = {"jpg", "png", "pdf", "jpg"}  # Duplicate jpg ignored
file_types.add("gif")              # Add new type
```

**Use when:** You need to track unique items or check membership

### Common Pattern: Grouping Things
```python
# Group files by extension
files_by_type = {}  # Empty dictionary

for file in all_files:
    extension = file.suffix
    
    # Create list if extension not seen before
    if extension not in files_by_type:
        files_by_type[extension] = []
    
    # Add file to its type's list
    files_by_type[extension].append(file)

# Result: {'.jpg': [file1, file2], '.pdf': [file3], ...}
```

**Mental model:** "Sort items into labeled buckets"

---

## Mental Model 4: Functions Are Tools

### The Concept
Functions are reusable tools you create. Give them input, get output.

### Real-World Analogy
A coffee maker:
- **Input:** Coffee grounds + water
- **Process:** Brew
- **Output:** Coffee

### In Python
```python
def make_coffee(grounds, water):
    """Takes ingredients, returns coffee"""
    coffee = brew(grounds, water)
    return coffee

# Use the tool
my_coffee = make_coffee("dark roast", "8oz")
```

### Mental Template
```
Function = specialized tool that:
1. Takes inputs (parameters)
2. Does something with them
3. Returns a result (or changes state)
```

### Why Functions Exist
Instead of:
```python
# Repeat this everywhere
file1_ext = file1.split('.')[-1]
file2_ext = file2.split('.')[-1]
file3_ext = file3.split('.')[-1]
```

Create a tool:
```python
def get_extension(filename):
    return filename.split('.')[-1]

# Use the tool
ext1 = get_extension(file1)
ext2 = get_extension(file2)
ext3 = get_extension(file3)
```

**Mental model:** "If I'm doing this more than once, make it a function"

---

## Mental Model 5: Error Handling = Safety Net

### The Concept
Things can go wrong. Plan for it.

### Real-World Analogy
When cooking:
```
Try to:
    Open the oven
If it's too hot:
    Use oven mitts
If it's broken:
    Order pizza
```

### In Python
```python
try:
    file_content = open("data.txt").read()
except FileNotFoundError:
    print("File doesn't exist")
    file_content = ""  # Use default
except PermissionError:
    print("Can't read file")
    file_content = ""
```

### Mental Template
```
Try to do the ideal thing
If specific problem occurs:
    Handle that problem
If other problem occurs:
    Handle that problem
Either way:
    Clean up (optional)
```

### Common Pattern: File Operations
```python
try:
    with open("file.txt", "r") as f:
        data = f.read()
except FileNotFoundError:
    # File doesn't exist, create it
    with open("file.txt", "w") as f:
        f.write("default content")
```

**Mental model:** "Try the happy path, catch the sad paths"

---

## Mental Model 6: Imports = Bringing In Tools

### The Concept
Python comes with lots of tools. Import the ones you need.

### Real-World Analogy
Your toolbox at home vs. Home Depot:
- You keep common tools at home (built-in functions)
- You go to Home Depot for specialized tools (imports)

### In Python
```python
# Built-in (always available)
len([1, 2, 3])  # 3
print("hello")

# Standard library (import when needed)
from pathlib import Path      # File operations
from datetime import datetime # Dates and times
import json                   # Working with JSON

# Third-party (install first, then import)
import requests               # HTTP requests
import pandas                 # Data analysis
```

### Mental Template
```
If you need to work with:
- Files → from pathlib import Path
- Dates → from datetime import datetime
- Web requests → import requests
- Excel → import openpyxl
- CSV → import csv
```

### Common Pattern
```python
# Import what you need
from pathlib import Path
import json

# Use the tools
folder = Path("data")
files = folder.glob("*.json")

for file in files:
    data = json.loads(file.read_text())
    process(data)
```

**Mental model:** "Import the toolbox, use the tools"

---

## Putting It All Together: Real Example

Let's apply these mental models to real code:

```python
from pathlib import Path  # Import tools (Model 6)

def organize_downloads(folder_path):  # Function = tool (Model 4)
    """Organize files by type"""
    
    folder = Path(folder_path)  # Object with behavior (Model 1)
    files_by_type = {}          # Container for grouping (Model 3)
    
    # Loop through each file (Model 2)
    for file in folder.glob("*"):
        
        # Error handling (Model 5)
        try:
            extension = file.suffix  # Object method (Model 1)
            
            # Group files (Model 3)
            if extension not in files_by_type:
                files_by_type[extension] = []
            
            files_by_type[extension].append(file.name)
            
        except Exception as e:
            print(f"Error with {file}: {e}")
    
    return files_by_type
```

**Read this as:**
1. Import file tools
2. Create an organizing function
3. Set up a grouping container
4. For each file, get its type
5. Group it with similar files
6. Handle errors gracefully
7. Return the organized groups

**See? It's all mental models combined!**

---

## How to Use These Models

### When Reading Code:
1. Identify the pattern: "Oh, this is a loop"
2. Apply the model: "For each item, do something"
3. Understand the logic: "It's filtering JPG files"

### When Writing Code:
1. Think in models: "I need to group things"
2. Pick the pattern: "That's a dictionary"
3. Ask AI or look up syntax if needed

### When Coming Back After Time Away:
1. The syntax fades
2. The mental models remain
3. You recognize patterns
4. You reconstruct the syntax (or ask AI)

---

## Practice Exercise

**Read this code using mental models:**

```python
def count_word_frequency(text):
    word_counts = {}
    for word in text.split():
        word = word.lower()
        if word in word_counts:
            word_counts[word] += 1
        else:
            word_counts[word] = 1
    return word_counts
```

**Your turn:**
- What's the mental model for `word_counts`?
- What's the mental model for the loop?
- What pattern is being used?

**Answers:**
- Dictionary (grouping/counting by label)
- Loop (for each word, do something)
- Pattern: Counting occurrences

**If you got this, you understand mental models! 🎉**

---

## Remember

**Syntax is temporary. Concepts are permanent.**

When you forget the syntax:
- ✅ You'll still recognize the pattern
- ✅ You'll know what you're trying to do
- ✅ You can ask AI for the syntax
- ✅ You'll understand AI's answer

**Master the mental models. The syntax will follow.**
