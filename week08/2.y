%{
#include <stdio.h>
#include <stdbool.h>
%}

%token NUM EQ NEQ LT GT AND OR NOT
%left OR
%left AND
%nonassoc NOT

%%

stmt_list: stmt
         | stmt_list stmt
         ;

stmt: expr '\n' { printf("%s\n", $1 ? "TRUE" : "FALSE"); }
    ;

stmt: expr { printf("%s\n", $1 ? "TRUE" : "FALSE"); }
    ;

expr: expr OR expr { $$ = $1 || $3; }
    | expr AND expr { $$ = $1 && $3; }
    | NOT expr %prec NOT { $$ = !$2; }
    | NUM EQ NUM { $$ = $1 == $3; }
    | NUM NEQ NUM { $$ = $1 != $3; }
    | NUM LT NUM { $$ = $1 < $3; }
    | NUM GT NUM { $$ = $1 > $3; }
    | NOT NUM %prec NOT { $$ = !$2; }
    ;

%%

int main() {
    yyparse();
    return 0;
}

int yyerror(const char *s) {
    printf("Error: %s\n", s);
    return 0;
}
