%option noyywrap
%{
#include <stdio.h>
%}

%x UPPERCASE

%%
[A-Z]+ {
    BEGIN(UPPERCASE);
    printf("Uppercase word start: %s\n", yytext);
}

<UPPERCASE>[A-Z]+ {
    printf("Uppercase word continuation: %s\n", yytext);
}

<UPPERCASE>[^A-Za-z]+ {
    BEGIN(INITIAL);
}

[a-z]+ {
    printf("Lowercase word: %s\n", yytext);
}

[^A-Za-z]+ {
    /* Handle non-word characters */
}

%%

int main() {
    yylex();
    return 0;
}

