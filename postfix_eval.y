%{
#include<stdio.h>
int yylex(void);
float op = 0.0;
%}

%union {
float dval;
}

%token <dval> NUM
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS
%type <dval> state
%type <dval> exp
%type <dval> N

%%
state : exp N {}
      ;
exp : exp exp '+' {$$ = $1 + $2;op = $$;}
    | exp exp '-' {$$ = $1 - $2;op = $$;}
    | exp exp '*' {$$ = $1 * $2;op = $$;}
| exp exp '/' {$$ = $1 / $2;op = $$;}
| NUM {$$ = $1;op=$$;}
;
N : {printf("Valid Expression!\nOutput:%.3f\n",op);}
  ;
%%
