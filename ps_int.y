%{
#include<stdio.h>
int yylex(void);
int op = 0;
%}


%token NUM
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS

%%
state : exp N {}
      ;
exp : exp exp '+' {$$ = $1 + $2;op = $$;}
    | exp exp '-' {$$ = $1 - $2;op = $$;}
    | exp exp '*' {$$ = $1 * $2;op = $$;}
| exp exp '/' {$$ = $1 / $2;op = $$;}
| exp exp '%' {$$ = $1 % $2;op = $$;}
| NUM {$$ = $1;op=$$;}
;
N : {printf("Valid Expression!\nOutput:%d\n",op);}
  ;
%%
