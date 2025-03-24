%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

extern int yylex();
void yyerror(const char *s);

/* flag to indicate if a division by zero or syntax error occurred */
int error_flag = 0;
%}

/* union for numerical values */
%union {
    float fval;
}

/* token types */
%token <fval> NUMBER
%token PLUS MINUS TIMES DIVIDE EXPONENT LPAREN RPAREN

/* expression type */
%type <fval> expr

/* operator precedence */
%left PLUS MINUS
%left TIMES DIVIDE
%right EXPONENT

%%

input:
    | input line
    ;

line:
    expr '\n' {
        if (!error_flag) {
            /* if result is an integer print as int otherwise print as float */
            if (floor($1) == $1) {
                printf("Result: %d\n", (int)$1);
            } else {
                printf("Result: %f\n", $1);
            }
        }
        error_flag = 0;  // reset for the next expression
    }
    ;

expr:
    expr PLUS expr     { $$ = $1 + $3; }
    | expr MINUS expr  { $$ = $1 - $3; }
    | expr TIMES expr  { $$ = $1 * $3; }
    | expr DIVIDE expr { 
        if ($3 == 0) {
            printf("Error: Division by zero!\n");
            error_flag = 1;
            $$ = 0;
        } else {
            $$ = $1 / $3; 
        }
    }
    | expr EXPONENT expr { $$ = pow($1, $3); }
    | LPAREN expr RPAREN { $$ = $2; }
    | NUMBER             { $$ = $1; }
    ;

%%

/* prints parser errors */
void yyerror(const char *s) {
    fprintf(stderr, "Parse error: %s\n", s);
    error_flag = 1;
}

int main() {
    printf("Welcome to Calculator! Enter expressions:\n");
    return yyparse();
}
