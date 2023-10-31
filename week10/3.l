%option noyywrap
%{
#include<stdio.h>
#include<stdlib.h>
#include "y.tab.h"
extern int yyval;
%}

alpha [A-Za-z]
digit [0-9]

%%
" " return SPACE;
[ /t] ;
"printf(\"\%d\,\%d\\n\"\,i\,j)" return INSIDE;
"int main()\n{\n" return START;
"\nreturn 0;\n}" return END;
for return FOR;
"int"|"float"|"char" return KEY;
";" return SEM;
[sS][0-9]|[a-b] return S;
{digit}+ return NUM;
{alpha}({alpha}|{digit})* return ID;
"<="|">="|"=="|"!="|"||"|"&&"|"<"|">" return RELOP;
"=" return EQ;
"+"|"-" return OP;
"++"|"--" return INC;
"\n" return NL;
. return(yytext[0]);

%%

void yyerror(char * str)
{
 printf("Invalid Expression");
}
int main()
{
 yyin=fopen("3.txt","r");
 yyparse();
 return(0);
}
