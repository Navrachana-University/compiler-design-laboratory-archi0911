Project Description
This project implements a compiler for a Hinglish-based programming language. “Hinglish” refers to a hybrid language combining Hindi and English syntax. Source files are written using a .hgl extension, which are then translated into Three-Address Code (TAC) as an intermediate representation.
The project demonstrates core compiler design principles using Lex (Flex) and Yacc (Bison), including lexical analysis, syntax parsing, and intermediate code generation.


Project Files
lexer.l – Contains Flex definitions for tokenizing the Hinglish programming language.
parser.y – Contains Bison grammar rules and semantic actions for generating Three-Address Code (TAC).
input.txt – Example input file written in the custom Hinglish syntax.
output.txt – Output file containing the generated TAC after compilation.
README.md – Documentation file explaining the project setup, features, and usage.
