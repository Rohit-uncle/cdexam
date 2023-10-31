%{
#include<stdio.h>
#include<stdlib.h>
#include "y.tab.h"
%}

alpha [a-zA-Z]
digit [0-9]

%%

" "	return SPACE;
"void"	return VOID;
"\n"	return NL;
"("	return OPPR;
")"	return CLPR;
","	return COM;
";"	return SEMI;
"}"	return CPR;
"{"	return OPR;
"_"	return UN;
"int"|"float"|"char"|"*"	return KEY;

{alpha}({alpha}{digit})*	return ID;
.	return CHARAC;
%%
