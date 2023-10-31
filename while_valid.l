%option noyywrap

%{
#include<stdio.h>
#include<stdlib.h>
#include "y.tab.h"
%}

al	[a-zA-Z]
dig	[0-9]

%%
" "	return SPACE;
while	return WHILE;
[(]	return PARS;
[)]	return PARE;
{al}({al}|{dig})*	return ID;
{dig}*	return NUM;
"<="|">="|"=="|"!="	return RELOP;
"+"|"-"|"*"|"/"	return OP;
=	return ASSGN;
\n	return NL;
[{]	return CURS;
[}]	return CURE;
[;]	return SEMI;
%%

void yyerror(char *str) {
	printf("Invalid\n");
}

int main() {
FILE* fp = fopen("while.txt","r");
yyin = fp;
yyparse();
return 1;
}
