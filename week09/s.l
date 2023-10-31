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
"!"  { return NOT; }

"=="   { return EQ; }
"!="   { return NEQ; }
"<"    { return LT; }
">"    { return GT; }
"&&"  { return AND; }
"||"   { return OR; }
"NOT"  { return NOT; }
[ \t]+ ;
\n {return '\n';}
. {return yytext[0];}
%%
