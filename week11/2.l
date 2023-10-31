%{                                                                                                                                                                      
#include<stdio.h>                                                                                                                                                       
#include<stdlib.h>                                                                                                                                                      
#include "y.tab.h"                                                                                                                                                      
extern int yylval;                                                                                                                                                       
%}                                                                                                                                                                      
                                                                                                                                                                        
%%                                                                                                                                                                      
"if " return IF;                                                                                                                                                          
"then " return THEN;                                                                                                                                                        
"else " return ELSE;                                                                                                                                                        
"exa " return A;                                                                                                                                                           
"exb " return B;                                                                                                                                                           
"\n" return NL;                                                                                                                                                         
. return(yytext[0]);                                                                                                                                                    
                                                                                                                                                                        
%%                      
