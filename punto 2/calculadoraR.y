%{
    #include <stdio.h>
    #include <stdlib.h>

    void yyerror(const char *s);
    extern int yylex();
%}

%union {
    double dval;
}

%token <dval> NUMBER
%token ADD SUB MUL DIV OP CP
%token EOL

%left ADD SUB
%left MUL DIV

%type <dval> expr
%type <dval> calculation

%%

calculation:
    calculation expr EOL { printf("Resultado: %lf\n", $2); }
    | /* empty */ { $$ = 0; }
    ;

expr:
    expr ADD expr %prec ADD { $$ = $1 + $3; }
    | expr SUB expr %prec SUB { $$ = $1 - $3; }
    | expr MUL expr %prec MUL { $$ = $1 * $3; }
    | expr DIV expr %prec DIV { 
        if($3 == 0) {
            yyerror("Error: División entre cero");
            return 1;
        }
        $$ = $1 / $3; 
    }
    | OP expr CP { $$ = $2; }
    | NUMBER { $$ = $1; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Calculadora: Ingrese expresiones (CTRL+D para salir)\n");
    return yyparse();
}