
%option noyywrap                                                                                                                                                                                                   
                                                                                                                                                                                                                   
%{                                                                                                                                                                                                                 
#include <stdio.h>                                                                                                                                                                                                 
#include <string.h>                                                                                                                                                                                                
                                                                                                                                                                                                                   
int char_no=0,tab=0,white=0;                                                                                                                                                                                       
%}                                                                                                                                                                                                                 
                                                                                                                                                                                                                   
%%                                                                                                                                                                                                                 
"\t"    tab++;                                                                                                                                                                                                     
" "     white++;                                                                                                                                                                                                   
.       char_no++;                                                                                                                                                                                                 
                                                                                                                                                                                                                   
%%                                                                                                                                                                                                                 
                                                                                                                                                                                                                   
int main()                                                                                                                                                                                                         
{                                                                                                                                                                                                                  
        FILE *fp = fopen("ip.txt", "r");                                                                                                                                                                           
        if(fp)                                                                                                                                                                                                     
                yyin = fp;                                                                                                                                                                                         
        yylex();                                                                                                                                                                                                   
        printf("No. of characters: %d\nNo. of white spaces: %d\nNo. of tabs: %d\n",char_no,white,tab);                                                                                                             
                                                                                                                                                                                                                   
}                             
