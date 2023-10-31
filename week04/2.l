
%option noyywrap

%{
#include <stdio.h>
#include <string.h>

%}

%%

[a-zA-Z][a-zA-Z0-9]*	printf("Identifier : %s\n",yytext);
[+][+]	 printf("Operator : ++\n",yytext);
[+\-*/=]	printf("Operator : %s\n",yytext);
[\n]	;
.	;

%%

int main()
{
        FILE *fp = fopen("2.txt", "r");
        if(fp)
                yyin = fp;
        printf("output : \n");
        yylex();
}
