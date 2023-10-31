%option noyywrap

%{
        #include<stdio.h>
        #include<string.h>
%}

%%

"if" {printf("case");}
"else if"       {printf("case");}
"else"  {printf("default");}
[(].[)] {printf(" %s",yytext);}
"{"     {printf(":");}
.[;]$ {printf("%s",yytext);}
[}]   {printf("break;\n");}
\n {printf("\n");
}


%%

int main()
{
        extern FILE *yyin,*yyout;
        yyin = fopen("if_switch.txt","r");
        printf("switch(true)\n{\n");
        yylex();
	printf("}\n");
        return 0;
}
