%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
extern int yyin;
%}

%token WHILE PARS PARE ID NUM RELOP OP ASSGN NL SPACE CURS CURE SEMI

%%
stmt : WHILE PARS para_stmt PARE NL CURS NL in_stmt CURE	{printf("Valid!\n");exit(0);};

para_stmt : ID RELOP ID
	  | ID RELOP NUM
	  | NUM RELOP ID
	  | NUM RELOP NUM
	;
in_stmt : ID ASSGN ID OP NUM SEMI NL;
%%

