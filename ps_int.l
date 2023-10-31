%option noyywrap

%{
#include<stdio.h>
#include "y.tab.h"
#include <math.h>
extern int yylval;
%}

%%
[0-9]+  {yylval = atoi(yytext);return NUM;}
[ \t]   ;
\n      return 0;
.       {return yytext[0];}
%%

void yyerror(char *s) {
        printf("Invalid Expression\n");
}

int main() {
        yyparse();
        return 1;
}
