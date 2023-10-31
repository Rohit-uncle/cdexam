%option noyywrap
%{
#include <stdio.h>
int error_count = 0;
%}

%%
"int main()"                   {printf("Main function found\n");}
"int "|"float "|"char "|"double "  { printf("Declaration found: %s\n", yytext); }
"if"|"else"|"while"|"for"      { printf("Control statement found: %s\n", yytext); }
"printf"|"scanf"               {printf("Keywords found: %s\n",yytext);}
"("                            { printf("Left parenthesis found: %s\n", yytext); }
")"                            { printf("Right parenthesis found: %s\n", yytext); }
"{"                            { printf("Left curly brace found: %s\n", yytext); }
"}"                            { printf("Right curly brace found: %s\n", yytext); }
";"                            { printf("Semicolon found: %s\n", yytext); }
"return "                      { printf("Return found\n");}
[0-9]+                         { printf("Integer constant found: %s\n", yytext); }
[a-zA-Z][a-zA-Z0-9_]*          { printf("Identifier found: %s\n", yytext); }
[#include<].*[>]               {printf("Header file found: %s\n",yytext);}
[=|+|*|-]                      {printf("Operator found\n");}
[\n]|[\t]                      {printf("Escape character found: %s\n",yytext);}
["].*["]
.                              { printf("Unrecognized character: %s\n", yytext); error_count++; }

%%

int main() {
    
    
    yyin = fopen("input2.c", "r");
    
    if (yyin == NULL) {
        printf("Error opening input file.\n");
        return 2;
    }
    
    yylex();
    
    printf("Total errors found: %d\n", error_count);
    
    fclose(yyin);
    return 0;
}

