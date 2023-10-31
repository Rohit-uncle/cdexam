%{
#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
int yyerror();
extern int yyin;
int yylex();
%}

%token SPACE KEY NL SEMI COM END OPPR CLPR ID CPR CHARAC VOID OPR UN

%%

funtion_declr : type UN ID OPPR KEY SPACE ID COM KEY SPACE ID CLPR NL OPR NL stmt NL CPR NL  {printf("Valid\n");exit(0);}

type : KEY SPACE
     	VOID SPACE
stmt : CHARAC stmt NL|CHARAC

%%

void main(int argc, char* argv[]) {
FILE *fp=fopen("spot.txt", "r");
yyin=fp;
yyparse();
}
int yywrap()
{}
yyerror(char const *s)
{
printf("Invalid\n");
}

