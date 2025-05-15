%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Flex external variables (important!)
extern FILE *yyin;
extern char *yytext;

// Global declarations
FILE* tac_file;
int temp_count = 0;

// Function declaration
char* new_temp();

%}

// YYSTYPE definition
%union {
    int num;
    char* id;
    char* str;
}

// Token definitions
%token <num> NUMBER
%token <id> ID
%token <str> STRING

%token START END PRINT IF THEN ELSE WHILE DO BREAK CONTINUE RETURN
%token INT FLOAT CHAR BOOL TRUE FALSE AND OR NOT FUNC ENDFUNC
%token SWITCH CASE DEFAULT ERROR READ ASSIGN EQ NEQ GT LT GTE LTE
%token ADD SUB MUL DIV MOD INC DEC FOR EACH IN GET PUT

// Type declarations
%type <str> expr

// Operator precedence
%right ASSIGN
%left OR
%left AND
%left EQ NEQ
%left GT LT GTE LTE
%left ADD SUB
%left MUL DIV MOD
%right NOT INC DEC

%%

program:
    START stmt_list END {
        fprintf(tac_file, "Program complete.\n");
    };

stmt_list:
    /* empty */
    | stmt_list stmt;

stmt:
    PRINT expr ';' {
        char* temp = new_temp();
        fprintf(tac_file, "%s = %s\n", temp, $2);
        fprintf(tac_file, "PRINT %s\n", temp);
    }
    | ID ASSIGN expr ';' {
        fprintf(tac_file, "%s = %s\n", $1, $3);
    };

expr:
    NUMBER { $$ = strdup(yytext); }
    | ID { $$ = strdup($1); }
    | expr ADD expr {
        $$ = new_temp();
        fprintf(tac_file, "%s = %s + %s\n", $$, $1, $3);
    }
    | expr SUB expr {
        $$ = new_temp();
        fprintf(tac_file, "%s = %s - %s\n", $$, $1, $3);
    }
    | expr MUL expr {
        $$ = new_temp();
        fprintf(tac_file, "%s = %s * %s\n", $$, $1, $3);
    }
    | expr DIV expr {
        $$ = new_temp();
        fprintf(tac_file, "%s = %s / %s\n", $$, $1, $3);
    }
    | '(' expr ')' { $$ = $2; }
    ;

%%

// Helper function to generate temporary variables
char* new_temp() {
    static char temp[10];
    sprintf(temp, "t%d", temp_count++);
    return strdup(temp);
}

// Main function
int main(int argc, char** argv) {
    if (argc < 2) {
        printf("Usage: compiler input.hgl\n");
        exit(1);
    }

    yyin = fopen(argv[1], "r");
    tac_file = fopen("output.tac", "w");

    if (!yyin || !tac_file) {
        perror("File open error");
        exit(1);
    }

    yyparse();

    fclose(tac_file);
    return 0;
}

// Required by Flex
int yywrap() {
    // Required by Bison for error reporting
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
    
    return 1;
}

// Required by Bison
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}