%option noyywrap
%{
  //      #include "bool.h"
        #include "y.tab.h"
        extern int yylval;
%}
%%
[0-9]+ {
        yylval = atoi(yytext);
        return NUM;
       }
"=="   { return EQ; }
"!="   { return NEQ; }
"<"    { return LT; }
">"    { return GT; }
"AND"  { return AND; }
"OR"   { return OR; }
"NOT"  { return NOT; }
[ \t]+ ;
\n {return '\n';}
. {return yytext[0];}
%%
