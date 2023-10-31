%option noyywrap

%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#define s 50

char st[s];
int top = -1;
char c;

void push(char c) {
	if(top<s-1) 
		st[++top] = c;
}

char pop() {
	if(top>-1)
		c = st[top--];
}

int pred(char c) {
	if(c == '+' || c == '-') return 1;
	else if(c == '*' || c == '/') return 2;
	return 0;
}

%}

%%

[a-zA-Z0-9]+	{printf("%s ",yytext);}
"("	{push('(');}
")"	{while(top>=0 && st[top]!='(') printf("%c ",pop());pop();}
[-+*/]	{while(top>=0 && pred(st[top])>=pred(yytext[0]) && st[top]!='(') printf("%c ",pop());
	push(yytext[0]); }
\n	{while(top>=0) printf("%c ",pop());return 0;}

%%

int main() {
yylex();
return 1;
}
