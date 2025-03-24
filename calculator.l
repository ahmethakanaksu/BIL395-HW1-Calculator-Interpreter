%{
#include "y.tab.h"
#include <stdio.h>
%}

%%
[0-9]+(\.[0-9]+)?    { yylval.fval = atof(yytext); return NUMBER; }
\+                   { return PLUS; }
\-                   { return MINUS; }
\*                   { return TIMES; }
\/                   { return DIVIDE; }
\^                   { return EXPONENT; }
\(                   { return LPAREN; }
\)                   { return RPAREN; }
\n                   { return '\n'; }
[ \t\r]+             { /* ignore whitespace */ }
.                    { printf("Syntax Error: Unexpected character: %s\n", yytext); return 0; }
%%

int yywrap() { return 1; }
