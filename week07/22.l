%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>
/* Track line numbers for error reporting */
int line_num = 1;

/* Stack to store opening brackets */
#define MAX_STACK_SIZE 100
char stack[MAX_STACK_SIZE];
int top = -1;

/* Function to push a character onto the stack */
void push(char c) {
    if (top < MAX_STACK_SIZE - 1) {
        stack[++top] = c;
    } else {
        fprintf(stderr, "Stack overflow\n");
        exit(1);
    }
}

/* Function to pop a character from the stack */
char pop() {
    if (top >= 0) {
        return stack[top--];
    } else {
        fprintf(stderr, "Unbalanced brackets: '%c' without corresponding opening bracket at line %d\n", stack[0], line_num);
        exit(1);
    }
}
%}

%%
[ \t]+       ; // Ignore whitespace
\n           { line_num++; }
[(){}\[\]]    {
    if (yytext[0] == '(' || yytext[0] == '{' || yytext[0] == '[') {
        /* Push opening brackets onto the stack */
        push(yytext[0]);
    } else {
        /* Check for matching closing brackets */
        if (top == -1) {
            fprintf(stderr, "Unbalanced brackets: '%c' without corresponding opening bracket at line %d\n", yytext[0], line_num);
            exit(1);
        }
        char opening = pop();
        if ((opening == '(' && yytext[0] != ')') ||
            (opening == '{' && yytext[0] != '}') ||
            (opening == '[' && yytext[0] != ']')) {
            fprintf(stderr, "Unbalanced brackets at line %d: '%c' and '%c'\n", line_num, opening, yytext[0]);
            exit(1);
        }
    }
}
.            ; // Ignore other characters
end return 0;
%%

int main() {
    yylex();
    
    if (top != -1) {
        fprintf(stderr, "Unbalanced brackets: '%c' without corresponding closing bracket\n", stack[top]);
        return 1;
    } else {
        printf("Balanced brackets\n");
        return 0;
    }
}
