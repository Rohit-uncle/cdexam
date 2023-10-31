%option noyywrap
%{
#include<stdio.h>
#include<string.h>
char replace_with[]="hii";
char replace[100]="hello";
%}

%%
.    { if(strcmp(yytext, replace)==0)
                        fprintf(yyout, "%s", replace_with);
                        else
                                fprintf(yyout, "%s", yytext);}
%%

int main()
{	
		extern FILE *yyin, *yyout;
	yyin=fopen("input.txt", "r");
	yyout=fopen("output.txt", "w");

		yylex();

}
