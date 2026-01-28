# Practice Exercises

Small, focused practice scripts organized by topic. These are coding drills to build muscle memory.

## Organization

Each subfolder contains exercises for a specific topic:

- **01_basics/** - Variables, operators, input/output
- **02_data_structures/** - Lists, dictionaries, tuples, sets
- **03_functions/** - Function definitions, lambda, decorators
- **04_files_io/** - Reading/writing files, paths
- **05_automation/** - Regex, system operations, automation basics

## How to Use

1. **Create one file per concept** (e.g., `loops.py`, `dictionaries.py`)
2. **Practice deliberately** - Focus on understanding, not completion
3. **Experiment freely** - This is your sandbox
4. **Don't worry about perfection** - These are throwaway scripts

## Example Exercise File

```python
# exercises/01_basics/loops.py

# Exercise 1: Print numbers 1-10
for i in range(1, 11):
    print(i)

# Exercise 2: Sum of even numbers from 1-100
total = sum(i for i in range(1, 101) if i % 2 == 0)
print(f"Sum of even numbers: {total}")

# Exercise 3: FizzBuzz
for i in range(1, 21):
    if i % 15 == 0:
        print("FizzBuzz")
    elif i % 3 == 0:
        print("Fizz")
    elif i % 5 == 0:
        print("Buzz")
    else:
        print(i)
```

## Tips

- Run each file to test your code: `python exercises/01_basics/loops.py`
- Add comments explaining what you're practicing
- Try multiple approaches to the same problem
- Refer back to these when starting projects
