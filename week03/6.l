
%option noyywrap                                                                                                                                                                                                   
%{                                                                                                                                                                                                                 
     #include<stdio.h>                                                                                                                                                                                             
        int fl=0,fl1=0,fl2=0;                                                                                                                                                                                      
%}                                                                                                                                                                                                                 

%%                                                                                                                                                                                                                 

[a]*    fl=1;                                                                                                                                                                                                      
[a]{1}[b]{1}[b]{1}      fl1=1;                                                                                                                                                                                     
[a]*[b]+        fl2=1;                                                                                                                                                                                             
[a-z]*  ;                                                                                                                                                                                                          
\n return 0;                                                                                                                                                                                                       
                                                                                                                                                                                                                   
%%                                                                                                                                                                                                                 

int main()                                                                                                                                                                                                         
{                                                                                                                                                                                                                  
        yylex();                                                                                                                                                                                                   
        if(fl==1)                                                                                                                                                                                                  
                printf("a* string\n");                                                                                                                                                                       
        else if(fl1==1)                                                                                                                                                                                            
                printf("'abb' string\na*b+ string\n");                                                                                                                                                 
        else if(fl2==1)                                                                                                                                                                                            
                printf("a*b+ string\n");                                                                                                                                                                     
        else                                                                                                                                                                                                       
                printf("Invalid\n");                                                                                                                                                                               
        return 0;                                                                                                                                                                                                  
}  
