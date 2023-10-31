
%option noyywrap                                                                                                                                                                                                     
%{                                                                                                                                                                                                                 
     #include<stdio.h>                                                                                                                                                                                             
        int flag=0;                                                                                                                                                                                                
%}                                                                                                                                                                                                                 
%%                                                                                                                                                                                                                 
^[-+]+[0]* ;                                                                                                                                                                                                       
^[-+]?[0-9]+ flag++;                                                                                                                                                                                               
^[-+]+[0-9]* ;                                                                                                                                                                                                     
\n return 0;                                                                                                                                                                                                       
%%                                                                                                                                                                                                                 

int main()                                                                                                                                                                                                         
{                                                                                                                                                                                                                  
        yylex();                                                                                                                                                                                                   
        if(flag == 0)                                                                                                                                                                                              
                printf("Invalid!!!\n");                                                                                                                                                                       
        else                                                                                                                                                                                                       
               printf("Valid!!!\n");                                                                                                                                                                          
        return 0;                                                                                                                                                                                                  
}                
