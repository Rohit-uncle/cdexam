
%option noyywrap



%{

                                                                                                                                                                                                                   

#include<stdio.h>

                                                                                                                                                                                                                   

%}

                                                                                                                                                                                                                   

%%

                                                                                                                                                                                                                   

^[a-zA-Z][a-zA-Z0-9_]* { printf("Valid Identifier"); }

                                                                                                                                                                                                                   

-1 return 0;

                                                                                                                                                                                                                   

^[0-9_-]+[a-zA-Z0-9_]* { printf("Invalid Identifier"); }

                                                                                                                                                                                                                   

.;

                                                                                                                                                                                                                   

%%

                                                                                                                                                                                                                   

int main()

                                                                                                                                                                                                                   

{

                                                                                                                                                                                                                   

yylex();

                                                                                                                                                                                                                   

return 0;

                                                                                                                                                                                                                   

}
