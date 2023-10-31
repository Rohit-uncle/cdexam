%{
#include<stdio.h>
%}
%union{
float dval;
}
%token NUMBER ID
%left '+' '-'
%left '*' '/'
%left '(' ')'

%type <dval> E T NUMBER ID 
%%

E: T {printf("Result: %.3f",$$);}

T:
 '+' T T {$$=$2+$3;}
 |'-' T T {$$=$2-$3;}
 |'*' T T {$$=$2*$3;}
 |'/' T T {$$=$2/$3;}
 |'-' NUMBER {$$=-$1;}
 |'-' ID {$$=-$1;}
 |ID {$$=$1;}
 |NUMBER {$$=$1;}

%%

int main(){
        printf("Enter the expression: ");
        yyparse();
}

int yyerror(char *s){
        printf("Expression is invalid");
}
