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
%}

%%
[(]	push('(');
"["	push('[');
[{]	push('{');
")"	{if(st[top]=='(') pop();else { printf("Invalid\n");exit(0);}}
"]"	{if(st[top]=='[') pop();else { printf("Invalid\n");exit(0);}}	
"}"	{if(st[top]=='{') pop();else { printf("Invalid\n");exit(0);}}
\n	{if(top<=0)printf("Valid!\n");else printf("Invalid!!\n");return 0;}
%%

void yyerror(char *str) {
printf("Error\n");
}

int main() {
yylex();
return 1;
}
