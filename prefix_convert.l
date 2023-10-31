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

[a-zA-Z0-9]+    {fprintf(yyout,"%s ",yytext);}
"("     {push('(');}
")"     {while(top>=0 && st[top]!='(') fprintf(yyout,"%c ",pop());pop();}
[-+*/]  {while(top>=0 && pred(st[top])>=pred(yytext[0]) && st[top]!='(') fprintf(yyout,"%c ",pop());
        push(yytext[0]); }
" "      {while(top>=0) fprintf(yyout,"%c ",pop());putchar('\n');}

%%

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
int main() {
char ar[50];
printf("Enter the expression: ");
scanf("%s",ar);
char ch;
for(int i=0,j=strlen(ar)-1;i<j;i++,j--) {
        ch = ar[i];
        ar[i] = ar[j];
        ar[j] = ch;
}
ar[strlen(ar)] = ' ';
FILE *fp = fopen("in1.txt","w");
fprintf(fp,ar);
fclose(fp);
FILE* f = fopen("in1.txt","r");
yyin = f;
FILE* out = fopen("in2.txt","w");
yyout = out;
yylex();
fclose(f);
fclose(out);
FILE* final = fopen("in2.txt","r");
char f1[50];
while(fgets(f1,50,final)) {
char ch1;
for(int i=0,j=strlen(f1)-1;i<j;i++,j--) {
        ch1 = f1[i];
        f1[i] = f1[j];
        f1[j] = ch1;
}
}
printf("Output: %s\n",f1);
return 1;
}
