%{                                                                                                                                                                      
#include<stdio.h>                                                                                                                                                       
#include<stdlib.h>                                                                                                                                                      
#include<ctype.h>                                                                                                                                                       
int count=0;                                                                                                                                                            
%}                                                                                                                                                                      
%token NUM                                                                                                                                                              
%left '+'                                                                                                                                                               
%left '*'                                                                                                                                                               
%left '-'                                                                                                                                                               
%left '/'                                                                                                                                                               
%%                                                                                                                                                                      
                                                                                                                                                                        
ST: Exp '\n' {printf("Valid expression.\nResult after evaluation: %d\n",$$);exit(0);}                                                                                   
                                                                                                                                                                        
                                                                                                                                                                        
Exp : Exp Exp '+'  {$$=$1+$2;}                                                                                                                                          
  | Exp Exp '-' {$$=$1-$2;}                                                                                                                                             
  | Exp Exp '*' {$$=$1*$2;}                                                                                                                                             
  | Exp Exp '/' {$$=$1/$2;}                                                                                                                                             
  | Exp Exp '%' {$$=$1%$2;}                                                                                                                                             
  | NUM                                                                                                                                                                 
  ;                                                                                                                                                                     
%%                                                                                                                                                                      
yyerror(char const *s)                                                                                                                                                  
{                                                                                                                                                                       
//printf("yyerror %s\n",s);                                                                                                                                             
if(count==0)                                                                                                                                                            
{                                                                                                                                                                       
printf("Not Valid\n");                                                                                                                                                  
exit(0);                                                                                                                                                                
return 0;                                                                                                                                                               
}                                                                                                                                                                       
count++;                                                                                                                                                                
}                                                                                                                                                                       
int yylex() {                                                                                                                                                           
int c;                                                                                                                                                                  
c=getchar();                                                                                                                                                            
if (isdigit(c)) {                                                                                                                                                       
yylval=c-'0';                                                                                                                                                           
return NUM;                                                                                                                                                             
}                                                                                                                                                                       
return c;                                                                                                                                                               
}                                                                                                                                                                       
int main(){                                                                                                                                                             
while(1){                                                                                                                                                               
yyparse();                                                                                                                                                              
}                                                                                                                                                                       
return 1;                                                                                                                                                               
}                                                                                                                                                                       
                           
