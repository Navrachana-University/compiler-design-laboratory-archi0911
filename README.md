Hinglish Compiler
Name: Archi Prajapati
Roll No: 22000378

Project Description
This project implements a compiler for a Hinglish-based programming language. “Hinglish” refers to a hybrid language combining Hindi and English syntax. Source files are written using a .hgl (or .txt) extension, which are then translated into Three-Address Code (TAC) as an intermediate representation.
The project demonstrates core compiler design principles using Lex (Flex) and Yacc (Bison), including lexical analysis, syntax parsing, and intermediate code generation.

Project Files
lexer.l – Contains Flex definitions for tokenizing the Hinglish programming language.
parser.y – Contains Bison grammar rules and semantic actions for generating Three-Address Code (TAC).
input.txt – Example input file written in the custom Hinglish syntax.
output.txt – Output file containing the generated TAC after compilation.
README.md – Documentation file explaining the project setup, features, and usage.

Special Instructions for Executing the Code
To build and execute the code, follow these steps:
Verify that Flex, Bison, and GCC are installed on your system.
Open a terminal or command prompt and move to the directory containing the project files.
Use the following commands to generate the C source files:
  flex lexer.l
  bison -d parser.y
Compile the generated files with:
  gcc lex.yy.c y.tab.c -lfl -o compiler
Execute the compiler with the input file and redirect the output to output.txt:
  ./compiler input.txt > output.txt
(Alternatively, for precompiled versions:
compiler.exe input.txt > output.txt)

The resulting Three-Address Code will be stored in output.txt.

