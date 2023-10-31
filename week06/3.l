%option noyywrap
%{
#include <stdio.h>
%}

%%
[a-zA-Z][a-zA-Z0-9]* { printf("%s", yytext); } // Variables
[0-9]+             { printf("%s", yytext); } // Constants
"+"                { printf(" || "); } // Addition to OR
"*"                { printf(" && "); } // Multiplication to AND
"("                { printf("("); } // Left parenthesis
")"                { printf(")"); } // Right parenthesis
.                  { printf("%s", yytext); } // Other characters

%%

int main() {
    yylex();
    return 0;
}
