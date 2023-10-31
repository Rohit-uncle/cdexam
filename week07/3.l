%option noyywrap
%{                                                                                                                                                      
#include <stdio.h>                                                                                                                                      
%}                                                                                                                                                      
                                                                                                                                                        
%%                                                                                                                                                      
\/\/[^\n]*    ;  // Remove single-line comments                                                                                                         
\/\*[^*]*\*\/ ;  // Remove multi-line comments                                                                                                          
.             { putchar(yytext[0]); } // Print other characters                                                                                         
                                                                                                                                                        
%%                                                                                                                                                      
                                                                                                                                                        
int main() {                                                                                                                                            
    yyin = fopen("input.c", "r"); // Replace "input.c" with the name of your C program file.                                                            
    if (yyin == NULL) {                                                                                                                                 
        printf("Failed to open input file\n");                                                                                                          
        return 1;                                                                                                                                       
    }                                                                                                                                                   
                                                                                                                                                        
    yylex();                                                                                                                                            
    fclose(yyin);                                                                                                                                       
                                                                                                                                                        
    return 0;                                                                                                                                           
}                                                                                                                                                       
