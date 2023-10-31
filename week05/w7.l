%{                                                                                                                                                      


        #include <stdio.h>                                                                                                                              
        #include <stdlib.h>                                                                                                                             
        #include <string.h>                                                                                                                             
        #define SIZE 50  
	int c=0;                                                                                                                               
	int l=1;

char stack[SIZE];                                                                                                                                       
int top = -1;                                                                                                                                           


void push(char c)                                                                                                                                       
{                                                                                                                                                       
    if (top < SIZE - 1) {                                                                                                                               
        stack[++top] = c;                                                                                                                               
    }                                                                                                                                                   
}                                                                                                                                                       


char pop() {                                                                                                                                            
    if (top >= 0) {                                                                                                                                     
        return stack[top--];                                                                                                                            
    }                                                                                                                                                   
}                                                                                                                                                       



%}                                                                                                                                                      


%option noyywrap                                                                                                                                        


%%                                                                                                                                                      

                                                                                                        
"("             { push('('); }                                                                                                                          
")"             { if(top == -1){c=1;
			printf("Unmatched paranthesis at line number : %d\n",l);	 }
		else                                                                                                 
                         pop();
					                                                                                                                        
                }                                                                                                                                                                                                                                                  
. ;
\n	{l++;}	                                                                                


%%                                                                                                                                                      


int main() {                                                                                                                                            
	FILE *fp = fopen("s3.c","r");                                                                                                                        
	if(fp)                                                                                                                                                  
        	yyin = fp;                                                                                                                                      
	yylex();
	if(top <=0 && c==0){
		printf("Valid\n");
	}                                                                                                                                         
	return 0;                                                                                                                                               
}                   
