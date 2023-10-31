
%option noyywrap

%{

#include <stdio.h>

#include <string.h>

%}

%%                                                                                                                   

[b][a][n][a]?$  printf("%s\n",yytext);

[b][a][n][a][n][a]?$    printf("%s\n",yytext);

.        ;

\n      ;

%%



int main()                                                                                                           

{                                                                                                                    

        FILE *fp = fopen("ipc.txt", "r");                                                                       

        if(fp)                                                                                                       

                yyin = fp;                                                                                           

        printf("output : \n");                                                                                       

        yylex();                                                                                                     

}
