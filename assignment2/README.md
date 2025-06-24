# Text Analyzer Script

## Overview

This project contains a Bash script (`text_analyzer.sh`) that analyzes `.txt` files and provides useful insights such as word counts, line counts, character counts, and more. It can handle multiple files and summarize results for each file.

## Features

- Outputs the following for each `.txt` file:
  - Total number of words
  - Total number of lines
  - Total number of characters
  - Top 10 most common words (case-insensitive)
  - The longest word in the file
- Accepts multiple files as input and processes them sequentially.

## Requirements

- Linux operating system
- Bash shell

## Usage

1. **Save the script as `text_analyzer.sh`**.

- Place the script in your desired directory ( eg., `assignment2`).

2. **Make the script executable**

```bash
chmod +x text_analyzer.sh
```

3. **Prepare your `.txt` files**

- Ensure you have one or more `.txt` files you want to analyze in the same directory

4. **Run the script with one or more `.txt` files as arguments**

```bash
   ./text_analyzer.sh file1.txt file2.txt
```

- You can specify as many files as you want, separated by spaces.
- If the files are in a different directory, provide the full or relative path, e.g.:
  ```bash
  ./text_analyzer.sh /path/to/file1.txt /path/to/file2.txt
  ```

5. **View the Results**

- The script will output, for each file:
  - Total words, lines, and characters
  - Top 10 most common words
  - The longest word in the file

6. **Error handling**

- If a file does not exist or not readable, the script will display an error message for that file and continue with the rest.

7. **Example output**

```
   Analyzing file: example.txt
   ---------------------------------------
   Total Words: 120
   Total Lines: 15
   Total Characters: 850
   Top 10 Most Common Words:
     15 the
     12 and
     10 of
     ...
   Longest Word: ---------
   ---------------------------------------
```
