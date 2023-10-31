
%option noyywrap                                                                                                                                                                                                   
%{                                                                                                                                                                                                                 
#include <stdio.h>                                                                                                                                                                                                 
#include <string.h>                                                                                                                                                                                                
#include <stdlib.h>                                                                                                                                                                                                
char replace_with[100];                                                                                                                                                                                            
char replace[100];                                                                                                                                                                                                 
                                                                                                                                                                                                                   
%}                                                                                                                                                                                                                 
                                                                                                                                                                                                                   
%%                                                                                                                                                                                                                 
[a-zA-Z]+       {if(strcmp(yytext, replace)==0)                                                                                                                                                                    
                fprintf(yyout, "%s",replace_with);                                                                                                                                                                 
        else                                                                                                                                                                                                       
                fprintf(yyout, "%s",yytext);}                                                                                                                                                                      
%%                                                                                                                                                                                                                 
                                                                                                                                                                                                                  
int main()                                                                                                                                                                                    
{                                                                                                                                                                                                                  
        printf("Enter the string that is to be replaced: ");                                                                                                                                                       
        scanf("%s",replace);                                                                                                                                                                                       
        printf("Enter the string to be replaced: ");                                                                                                                                                               
        scanf("%s",replace_with);                                                                                                                                                                                  
        FILE* fp=fopen("input.txt","r");                                                                                                                                                                              
        yyin = fp;                                                                                                                                                                                                 
        yyout=fopen("output.txt","w");                                                                                                                                                                                 
        yylex();                                                                                                                                                                                                   
        return 0;                                                                                                                                                                                                  
}                   
