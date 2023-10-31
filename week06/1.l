%option noyywrap

%{
#include<stdio.h>
#include<string.h>
%}

%%
"if"    {printf("Case");}
"else if"       {printf("Case");}
"else"  {printf("default ");}
[(].[)] {printf("%s",yytext);}
[)]     {printf("):");}
.[;]$   {printf("%s",yytext);}
"}"     {printf("\tbreak;\n");}
\n      {printf("\n");}
\t      {printf("\t");}
"{"     ;

%%

int main() {
        extern FILE *yyin;
        yyin = fopen("inp1.txt","r");
        printf("switch(true)\n{\n");
        yylex();
        printf("}\n");
        return 0;
}
