# Simple Calculator Interpreter (Lex & Yacc)

> **Student Name:** Ahmet Hakan Aksu  
> **Student ID:** 191101068  
> **Course:** Programming Languages  

This project implements a simple calculator interpreter using Lex and Yacc (Flex and Bison). It supports arithmetic expressions, floating-point numbers, exponentiation, smart output formatting, and robust error handling.

---

## Assignment Objective

Implement a simple calculator using Lex and Yacc to:

- Tokenize input using Lex
- Define arithmetic grammar using Yacc
- Evaluate expressions with variables, assignment, and arithmetic
- Report syntax and runtime errors appropriately

---

## Features

✔️ Integer and floating-point number support  
✔️ Arithmetic operations: `+`, `-`, `*`, `/`  
✔️ Parentheses for grouping  
✔️ Exponentiation operator `^` (Bonus)  
✔️ Division by zero detection  

✔️ Smart output formatting:
  - Print integers as `int`
  - Print floats with decimals  

✔️ Clear error messages for:
  - Invalid syntax
  - Invalid characters
  - Division by zero

---

## Bonus Features (Fully Implemented)

| Bonus Feature                            | Status   |
|-----------------------------------------|----------|
| Floating-point support                  | ✔️ Done  |
| Exponentiation operator (`^`)           | ✔️ Done  |
| Smart output formatting (int/float)     | ✔️ Done  |
| Full error reporting for invalid input  | ✔️ Done  |

---

## Project Structure

```
calculator/
├── calculator.l       # Lex file
├── calculator.y       # Yacc file
├── README.md          # Project documentation
├── test_cases.txt     # Test cases text file
```

---

## Requirements

- Linux or WSL (Ubuntu)
- `flex` (Lex)
- `bison` (Yacc/Bison)
- `gcc` compiler

⚠️ **Important:** The `pow()` function is used for exponentiation, so you **must compile with the math library** using `-lm`.

Install dependencies:

```bash
sudo apt update
sudo apt install flex bison gcc
```

---

## Build & Run Instructions

Clone the project:

```bash
git clone https://github.com/ahmethakanaksu/BIL395-HW1-Calculator-Interpreter.git
```

### Compilation (⚠️ Important: You must compile with the math library using `-lm`)


```bash
lex calculator.l
yacc -d calculator.y
gcc lex.yy.c y.tab.c -o calculator -lm  # -lm is required
```

### Run

```bash
./calculator
```

Then enter any arithmetic expression and press Enter.

---

### Test with a file:

```bash
./calculator < test_cases.txt
```

---

## Example Usage

### Basic Arithmetic

```
3 + 5
Result: 8

7.5 * 2
Result: 15.000000
```

### Parentheses

```
(4 + 1) * 2
Result: 10
```

### Exponentiation (Bonus)

```
2 ^ 3
Result: 8

9 ^ 0.5
Result: 3
```

### Smart Result Formatting

```
8 / 2
Result: 4

7 / 2
Result: 3.500000
```

### Division by Zero

```
10 / 0
Error: Division by zero!
```

### Invalid Characters

```
5 + @
Syntax Error: Unexpected character: @
Parse error: syntax error
```

### Invalid Syntax

```
* 3 + 5
Parse error: syntax error
```

---

## Complex Expressions (Stress Tests)

```
(3.5 + 2.5) * (4 ^ 2) - 8 / (2 ^ 2)
Result: 94

(((1 + 2) * 3 - 4) / 2) ^ 2 + (6 / 3) * (7 - 5)
Result: 28
```

---

## Notes

- Whitespace is ignored.
- Expressions must end with Enter (newline).
- Operator precedence and associativity is handled via `%left` / `%right`.

---

## Author

**Name:** Ahmet Hakan Aksu  
**Student Number:** 191101068  
**Course:** Programming Languages  

---

## License

This project is for educational use only.
