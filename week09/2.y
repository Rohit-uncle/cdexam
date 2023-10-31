%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<string.h>

struct SymbolEntry{
	char* name;
	char* type;
}

void addToSymbolTable(struct SymbolEntry** table,int* tableSize,char* name,char* type){

	*tableSize += 1
	*table=(struct SymbolEntry**)realloc*(*table,(*tableSize) * sizeof(struct SymbolEntry*));
	(*table)[*tableSize-1]=(struct SymbolEntry*)malloc(sizeof(struct SymbolEntry));
	(*table)[*tableSize-1]->name=strdup(name);
	(*table)[*tableSize-1]->type=strdup(type);
	
}

void printSymbolTable(struct SymbolEntry** table,int tableSize)
{
	printf("Symbol Table : \n");
	for(int i=0;i<tableSize;i++)
	{
		printf("Name : %s,  Type : %s\n",table[i]->name,table[i]->type);
	}
}

int yylex();

int yyerror(char* s);

struct SymbolEntry** symbolTable = NULL;

int symbolTableSize = 0;

%}

%union{
	char* str;
}

%token <str> TYPE IDENTIFIER SEMICOLON COMMA NEWLINE

%%
program: declaration_list;
declaration_list: | declaration_list declaration
declaration: TYPE identifier_list SEMICOLON
	   {
		char* type = $1;
		addToSymbolTable(&symbolTable,&symbolTableSize,type,identifier_list);
		free(identifier_list);
		};
identifier_list: IDENTIFIER
	       | identifier_list COMMA IDENTIFIER
	       {
		    if($1==NULL){
			$$=strdup($3);
			}
			else{
				$$=strcat($1,$3);}
		};
%%

int  main(){
	yyparse();
	printSymbolTable(symbolTable,symbolTableSize);
	for(int i=0;i<symbolTableSize;i++)
	{
		free(symbolTable[i]->name);
		free(symbolTable[i]->type);
		free(symbolTable[i]);
	}
	free(symbolTable);
	return 0;
}
int yyerror(char* s){
	fprintf("Syntax Error: %s\n"s);
	return 0;
}

	
