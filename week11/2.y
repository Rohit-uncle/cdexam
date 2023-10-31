%{                                                                                                                                                                      
#include<stdio.h>                                                                                                                                                       
#include<ctype.h>                                                                                                                                                       
#include<stdlib.h>                                                                                                                                                      
                                                                                                                                                                        
int yylex();                                                                                                                                                            
int yyerror();                                                                                                                                                          
%}                                                                                                                                                                      
                                                                                                                                                                        
                                                                                                                                                                        
%token IF NL THEN A B ELSE                                                                                                                                              
%%                                                                                                                                                                      
                                                                                                                                                                        
s:stmt NL {printf("Input accepted\n");exit(0);};                                                                                                                        
stmt: IF expr THEN stmt                                                                                                                                                 
    |IF expr THEN stmt ELSE stmt                                                                                                                                        
| A;                                                                                                                                                                    
expr: B;                                                                                                                                                                
%%                                                                                                                                                                      
                                                                                                                                                                        
void main() {                                                                                                                                                           
printf("Enter the expression:\n");                                                                                                                                      
yyparse();                                                                                                                                                              
}                                                                                                                                                                       
int yywrap()                                                                                                                                                            
{}                                                                                                                                                                      
yyerror(char const *s)                                                                                                                                                  
{                                                                                                                                                                       
printf("Input not matched\n");                                                                                                                                          
exit(0);                                                                                                                                                                
}                             
