# Pattern Recognition in Python

> **Identifying and understanding code patterns: the building blocks of programming**

When you read a lot of code, patterns emerge. Learning to recognize these patterns helps you:
- Understand code faster
- Write better code
- Know what to expect
- Communicate more clearly ("Oh, that's a list comprehension")

---

## 🎯 What Are Code Patterns?

A pattern is a repeating solution to a common problem.

**Example: Looping through a list**

Without pattern knowledge:
```python
# Hmm, what does this do?
result = []
for item in items:
    result.append(item * 2)
```

With pattern knowledge:
```python
# Ah, that's "map with side effect" - which is better written as:
result = [item * 2 for item in items]  # List comprehension pattern
```

Both do the same thing. The second is the recognized **pattern** in Python.

---

## 📚 Essential Patterns

### Pattern 1: List Comprehension

**Problem:** Apply a transformation to each item in a list

**Old way (loop):**
```python
squares = []
for x in numbers:
    squares.append(x ** 2)
```

**Pattern way (list comprehension):**
```python
squares = [x ** 2 for x in numbers]
```

**Also works with filtering:**
```python
even_squares = [x ** 2 for x in numbers if x % 2 == 0]
```

**Why learn it:** 
- Faster
- More readable to experienced Python developers
- More efficient
- Used everywhere

---

### Pattern 2: Dictionary Comprehension

**Problem:** Create a dictionary from data

**Without pattern:**
```python
word_lengths = {}
for word in words:
    word_lengths[word] = len(word)
```

**With pattern:**
```python
word_lengths = {word: len(word) for word in words}
```

**Recognize it:** `{key_expr: value_expr for item in items}`

---

### Pattern 3: Generator Expression

**Problem:** Process large data without loading everything into memory

**Memory hog:**
```python
squares = [x ** 2 for x in range(1000000)]  # Creates huge list in memory
```

**Memory efficient:**
```python
squares = (x ** 2 for x in range(1000000))  # Generator - creates on demand
```

**Recognize it:** Like comprehension but with `()` instead of `[]`

---

### Pattern 4: Try-Except (Error Handling)

**Problem:** Handle errors gracefully instead of crashing

**Recognize it:**
```python
try:
    risky_operation()
except SpecificError as e:
    handle_error(e)
finally:
    cleanup()
```

**Common in:**
- File operations
- Network requests
- Type conversions
- Library calls

---

### Pattern 5: Context Manager (With Statement)

**Problem:** Ensure cleanup always happens (even if error occurs)

**Without pattern (risky):**
```python
f = open('file.txt')
data = f.read()
f.close()  # What if error happens before this?
```

**With pattern (safe):**
```python
with open('file.txt') as f:
    data = f.read()
# File automatically closed, even if error occurred
```

**Recognize it:** `with statement:` that ensures cleanup

---

### Pattern 6: Dictionary Get with Default

**Problem:** Get a value from dict without KeyError

**Without pattern (crashes if key missing):**
```python
value = data['key']  # KeyError if 'key' not present
```

**With pattern (safe):**
```python
value = data.get('key', default_value)  # Returns default if missing
```

**Also works for defaultdict:**
```python
from collections import defaultdict
data = defaultdict(list)
data['new_key'].append(item)  # Always works, creates empty list if needed
```

---

### Pattern 7: F-Strings

**Problem:** Create formatted strings

**Old way:**
```python
name = "Alice"
message = "Hello, " + name + "!"
```

**Pattern way:**
```python
name = "Alice"
message = f"Hello, {name}!"
```

**With expressions:**
```python
score = 95
grade = f"Score: {score} ({score/100:.0%})"
```

**Recognize it:** `f"text {variable} text"`

---

### Pattern 8: Unpacking

**Problem:** Extract multiple values from a sequence

**Without pattern (verbose):**
```python
point = (10, 20)
x = point[0]
y = point[1]
```

**With pattern (clean):**
```python
point = (10, 20)
x, y = point
```

**Also works with ignore:**
```python
name, *rest = ["Alice", "Bob", "Charlie"]
first, *middle, last = data
```

---

### Pattern 9: Map, Filter, Reduce

**Problem:** Functional programming patterns

**Map (transform each):**
```python
numbers = [1, 2, 3, 4, 5]
squares = map(lambda x: x ** 2, numbers)
```

**Filter (keep some):**
```python
evens = filter(lambda x: x % 2 == 0, numbers)
```

**Reduce (combine into one):**
```python
from functools import reduce
total = reduce(lambda a, b: a + b, numbers)  # Sum
```

**Note:** List comprehensions usually better than map/filter:
```python
squares = [x ** 2 for x in numbers]  # Better than map
evens = [x for x in numbers if x % 2 == 0]  # Better than filter
```

---

### Pattern 10: Path Operations

**Problem:** Work with file paths in a cross-platform way

**Old way (brittle):**
```python
path = "C:\Users\downloads\file.txt"  # Breaks on Mac/Linux
```

**Pattern way:**
```python
from pathlib import Path
path = Path.home() / "Downloads" / "file.txt"  # Works everywhere
```

**Why:** 
- Works on Windows, Mac, Linux
- Can't mess up separators (`\` vs `/`)
- Built-in methods for common operations

---

## 🎓 Learning Patterns

**How to recognize a pattern in code you see:**

1. **Read the code** - What is it trying to do?
2. **Notice the structure** - See the shape/template
3. **Ask "Is this a pattern?"** - Does this appear often?
4. **Learn the name** - "Oh, that's a list comprehension"
5. **Use it yourself** - Practice writing it
6. **Spot it everywhere** - See it in others' code

---

## 🔍 Spotting Anti-Patterns

Things NOT to do:

**Anti-Pattern 1: Over-complicated Code**
```python
# ❌ DON'T
result = list(map(lambda x: x ** 2, filter(lambda x: x > 0, data)))

# ✅ DO
result = [x ** 2 for x in data if x > 0]
```

**Anti-Pattern 2: Ignoring Errors**
```python
# ❌ DON'T
try:
    risky_stuff()
except:
    pass  # Silently ignore problems
```

**Anti-Pattern 3: Mutable Default Arguments**
```python
# ❌ DON'T
def append_item(item, items=[]):
    items.append(item)
    return items

# ✅ DO
def append_item(item, items=None):
    if items is None:
        items = []
    items.append(item)
    return items
```

---

## 📖 Pattern Study Guide

**To master patterns:**

1. **Read code** written by experienced Python developers
2. **Notice what they do** - These are patterns
3. **Understand why** - When and why each pattern is used
4. **Practice** - Write code using these patterns
5. **Recognize them** - See them in real code
6. **Teach someone** - Explain why you'd use each

---

## 🚀 Next Steps

- **Read:** Code from projects in this repo - spot the patterns
- **Look at:** [Real Python](https://realpython.com/) articles on specific patterns
- **Practice:** Write list comprehensions, context managers, etc.
- **Review:** AI-generated code and recognize patterns it uses
- **Apply:** Use patterns in your own projects

---

Remember: **Patterns are the way experienced programmers think and communicate. Learn them, use them, recognize them.**
