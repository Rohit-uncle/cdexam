
%option noyywrap
                                                                                                                                                                                                                   
%{
#include <stdio.h>
#include <string.h>
                                                                                                                                                                                                                   
%}
                                                                                                                                                                                                                   
%%
[a-z]*"a"[a-z]*"e"[a-z]*"i"[a-z]*"o"[a-z]*"u"[a-z]*     printf("%s\n",yytext);
.       ;
\n      ;
[0-9]*  ;
[A-Z]*	;
%%
                                                                                                                                                                                                                   
int main()
{                                                                                                                                                                                                                  
        FILE *fp = fopen("ip.txt", "r");
        if(fp)
                yyin = fp;                                                                                                                                                                                         
        printf("Strings containing 'aeiou' : \n");
        yylex();                                                                                                                                                                                                   
}
