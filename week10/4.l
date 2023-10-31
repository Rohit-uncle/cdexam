%option noyywrap
%{
#include "y.tab.h"
//extern int yylval;
%}
%%
[0-9]+  {
                yylval.dval=atof(yytext);
                return NUMBER;
        }
[a-zA-Z]+ {return ID;}
[ \t] ;
\n {return 0;}
. {return yytext[0];}

%%
