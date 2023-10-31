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
exp : exp '+' term {$$ = $1 + $3;op = $$;}
    | exp '-' term {$$ = $1 - $3;op = $$;}
| term ;
term : term '*' fact{$$ = $1 * $3;op = $$;}
| term '/' fact{$$ = $1 / $3;op = $$;}
| term '%' fact {$$ = $1 % $3;op = $$;}
| fact;
fact : '(' exp ')' {$$ = $2;op = $$;}
    | NUM {$$ = $1;op=$$;}
;
N : {printf("Valid Expression!\nOutput:%d\n",op);}
  ;
%%
