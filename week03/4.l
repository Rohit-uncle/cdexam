
%option noyywrap                                                                                                                                                                                                   
                                                                                                                                                                                                                   
%{                                                                                                                                                                                                                 
#include <stdio.h>                                                                                                                                                                                                 
#include <string.h>                                                                                                                                                                                                
                                                                                                                                                                                                                   
%}                                                                                                                                                                                                                 
                                                                                                                                                                                                                   
%%                                                                                                                                                                                                                 
[a|b]*"abb"[a|b]*       ;                                                                                                                                                                                          
[a|b]*[a]+[b]+[a|b]*  printf("%s\n",yytext);                                                                                                                                                                       
.       ;                                                                                                                                                                                                          
\n      ;                                                                                                                                                                                                          
%%                                                                                                                                                                                                                 
                                                                                                                                                                                                                   
int main()                                                                                                                                                                                                         
{                                                                                                                                                                                                                  
        FILE *fp = fopen("ip4.txt", "r");                                                                                                                                                                             
        if(fp)                                                                                                                                                                                                     
                yyin = fp;                                                                                                                                                                                         
        printf("output : \n");                                                                                                                         
        yylex();                                                                                                                                                                                                   
} 
