# Python 5-Minute Refresher

> **Use this when returning after weeks/months away from Python**

## Core Mental Models (Read First)

### 1. Everything is an Object
```python
# Even simple things are objects
number = 5
text = "hello"
my_list = [1, 2, 3]

# They all have methods you can use
text.upper()  # "HELLO"
my_list.append(4)  # [1, 2, 3, 4]
```

**Remember:** In Python, everything can do things (methods) and hold information (attributes).

---

### 2. Indentation = Structure
```python
# This matters:
if condition:
    do_this()      # Indented = inside the if
    and_this()     # Still inside
do_that()          # Not indented = outside the if
```

**Remember:** No braces like `{}`. Indentation IS the structure.

---

### 3. For Loops = "Do This for Each Thing"
```python
for item in collection:
    process(item)
```

**Mental hook:** "For each _____ in _____, do _____"

---

### 4. Lists vs Dictionaries
```python
# List = ordered collection (access by position)
files = ["file1.txt", "file2.jpg", "file3.pdf"]
first_file = files[0]  # "file1.txt"

# Dictionary = key-value pairs (access by key)
file_info = {
    "name": "file1.txt",
    "size": 1024,
    "type": "text"
}
name = file_info["name"]  # "file1.txt"
```

**Remember:** Lists for ordered things, dictionaries for labeled things.

---

## Common Patterns (Recognize, Don't Memorize)

### Pattern 1: Loop Through Items
```python
for file in files:
    print(file)
```

### Pattern 2: Filter Items
```python
# Get only items that match condition
jpg_files = [f for f in files if f.endswith('.jpg')]
```

### Pattern 3: Build a Dictionary from Lists
```python
result = {}
for key, value in zip(keys, values):
    result[key] = value
```

### Pattern 4: Error Handling
```python
try:
    risky_operation()
except SpecificError:
    handle_error()
```

---

## Quick Syntax Reference

### Variables
```python
name = "value"              # String
count = 42                  # Integer
price = 19.99              # Float
is_active = True           # Boolean
items = [1, 2, 3]          # List
data = {"key": "value"}    # Dictionary
```

### Conditionals
```python
if condition:
    do_something()
elif other_condition:
    do_other_thing()
else:
    do_default()
```

### Functions
```python
def function_name(parameter):
    """What this function does"""
    result = do_something(parameter)
    return result
```

### Imports
```python
import module               # Use as: module.function()
from module import thing    # Use as: thing()
from pathlib import Path    # Common for file operations
```

---

## Most Common Operations

### Working with Files
```python
from pathlib import Path

# Get all files in a folder
folder = Path("downloads")
for file in folder.glob("*"):
    print(file.name)

# Read a file
with open("file.txt", "r") as f:
    content = f.read()

# Write a file
with open("file.txt", "w") as f:
    f.write("content")
```

### Working with Strings
```python
text = "Hello World"
text.upper()           # "HELLO WORLD"
text.lower()           # "hello world"
text.split()           # ["Hello", "World"]
"_".join(["a", "b"])   # "a_b"
```

### Working with Lists
```python
items = [1, 2, 3]
items.append(4)        # [1, 2, 3, 4]
items.remove(2)        # [1, 3, 4]
len(items)             # 3
items[0]               # First item: 1
items[-1]              # Last item: 4
```

---

## Quick Self-Test

**Can you explain these in plain English?**

1. `for file in Path("downloads").glob("*.jpg"):`
2. `results = [x * 2 for x in numbers if x > 5]`
3. `with open("data.txt", "r") as f:`

**Answers:**
1. "For each JPG file in the downloads folder"
2. "Double each number that's greater than 5"
3. "Open data.txt for reading (and auto-close when done)"

**If you got these, you're ready to code!**

---

## Now What?

### Option 1: Dive Right In (30 seconds)
Go to `real_projects/01_downloads_organizer/` and run:
```bash
python main.py --dry-run
```

If you understand what it does, you're warmed up!

### Option 2: Quick Warmup (30 minutes)
1. Go to `problem_solving/real_world_challenges/`
2. Pick a simple problem
3. Try to solve it with AI
4. Review what AI built
5. Modify something small

### Option 3: Rebuild Muscle Memory (1 hour)
1. Look at one of your old projects
2. Try to recreate it from scratch (with AI help)
3. Compare to your original
4. The concepts will flood back

---

## Common "Oh Right!" Moments

- **"Lists are mutable"** - You can change them after creation
- **"Strings are immutable"** - You create new ones, not modify
- **"Indentation matters"** - 4 spaces is standard
- **"`range(5)` gives 0-4, not 1-5"** - It starts at 0
- **"Dictionaries throw errors on missing keys"** - Check with `key in dict` first
- **"`==` for equality, `=` for assignment"** - Classic mistake

---

## Emergency Commands

```python
# See what something is
type(variable)

# See what methods it has
dir(variable)

# Get help
help(function_name)

# Pretty print
from pprint import pprint
pprint(complex_data)
```

---

## You're Ready!

The best way to remember Python is to **use it for something real.**

Pick a problem. Build a solution (with AI). Understand what you built.

The syntax will come back as you code. Focus on the concepts.

**Now go build something! 🚀**
