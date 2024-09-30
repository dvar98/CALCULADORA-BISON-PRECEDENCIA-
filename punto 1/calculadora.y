%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char* s) {
    fprintf(stderr, "Error: %s\n", s);
}

int yylex(void);
%}

%union {
    double dval;
}

%token <dval> NUMBER
%token ADD SUB MUL DIV OP CP EOL

%left ADD SUB
%left MUL DIV

%type <dval> expr

%%

input:
    /* vacío */
    | input line
    ;

line:
    EOL
    | expr EOL { printf("Resultado: %f\n", $1); }
    ;

expr:
    NUMBER
    | expr DIV expr { $$ = $1 / $3; }
    | expr MUL expr { $$ = $1 * $3; }
    | expr SUB expr { $$ = $1 - $3; }
    | expr ADD expr { $$ = $1 + $3; }
    | OP expr CP { $$ = $2; }
    ;

%%

int main() {
    printf("Calculadora: Ingrese expresiones (CTRL+D para salir)\n");
    return yyparse();
}