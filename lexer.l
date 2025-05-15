%{
#include "h.tab.h"
#include <string.h>
#include <stdlib.h>

extern FILE* tac_file;
extern int temp_count;
%}

DIGIT [0-9]
ID [a-zA-Z][a-zA-Z0-9_]*

%%

"shuru"         return START;
"dikhao"        return PRINT;
"agar"          return IF;
"tab"           return THEN;
"nahi_to"       return ELSE;
"jabtak"        return WHILE;
"karo"          return DO;
"band_karo"     return END;
"bando"         return BREAK;
"jara"          return CONTINUE;
"vapas"         return RETURN;
"int"           return INT;
"float"         return FLOAT;
"char"          return CHAR;
"bool"          return BOOL;
"sahi"          return TRUE;
"galat"         return FALSE;
"and"           return AND;
"or"            return OR;
"nhi"           return NOT;
"nimna"         return FUNC;
"antim"         return ENDFUNC;
"yadi"          return SWITCH;
"matlab"        return CASE;
"default"       return DEFAULT;
"galti"         return ERROR;
"padh"          return READ;
"ho"            return ASSIGN;
"hai"           return EQ;
"nhi_hai"       return NEQ;
"jyada"         return GT;
"km"            return LT;
"jyada_barabar" return GTE;
"km_barabar"    return LTE;
"jod"           return ADD;
"ghata"         return SUB;
"guna"          return MUL;
"bhag"          return DIV;
"shesh"         return MOD;
"badhao"        return INC;
"ghatao"        return DEC;
"jaise"         return FOR;
"har"           return EACH;
"mein"          return IN;
"lelo"          return GET;
"daalo"         return PUT;

{DIGIT}+        yylval.num = atoi(yytext); return NUMBER;
\"[^\"\n]*\"   yylval.str = strdup(yytext); return STRING;
{ID}           yylval.id = strdup(yytext); return ID;

[ \t\n]+        ; // ignore whitespace
.              return yytext[0];

%%