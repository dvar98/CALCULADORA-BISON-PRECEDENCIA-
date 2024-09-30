%option nodefault yylineno

%{
    #include "calculadoraO.tab.h"
    #include <stdio.h>
    #include <stdlib.h>
%}

%%
"+"             { return ADD; }
"-"             { return SUB; }
"*"             { return MUL; }
"/"             { return DIV; }
"("             { return OP;  }
")"             { return CP;  }

[0-9]+(\.[0-9]+)? {
                    yylval.dval = atof(yytext);
                    return NUMBER;
                  }

\n              { return EOL; }
[ \t]           { /* Ignorar espacios en blanco */ }
"//".*          { /* Ignorar comentarios */ }
.               { printf("Caracter desconocido: %c\n", *yytext); }
%%

int yywrap() {
    return 1;
}