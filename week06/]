%option noyywrap
D       "int"
N       [0-9]
DO      "do"
A       .
W       "while"

%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
char str[100];
char str1[100];
char str2[100];
int c = 0;
%}

%%
{D}[ ]+[a-zA-Z]+[0-9]*[ ]*[=][ ]*[0-9]+[;]      {strcpy(str,yytext);}
{DO}[\n ]*[{][\n ]*({A}+[\n ]*)+[}]     {strcpy(str1,yytext);}
{W}[ ]*[(]{A}+[)]       {strcpy(str2,yytext);}
"END"   return 0;
.       ;

%%

int main() {
        extern FILE *yyin;
        yyin = fopen("ip2.txt","r");
        yylex();
        printf("%s\n",str);
        printf("%s",str2);
        for(int i=2;i<strlen(str1);i++)
                printf("%c",str1[i]);
        printf("\n");
        return 0;
}


