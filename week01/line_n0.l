
%option noyywrap

D [0-9]

%{



int line_no = 0;

int char_no = 0;

%}

%%

\n ++line_no;

. ++char_no;

{D}+ return 0;

%%

int main()

{

yylex();

printf("number of lines = %d, number of chars = %d\n",line_no, char_no );

return 0;

}
