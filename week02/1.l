
%option noyywrap                                                                                                                                                                                                   
%{                                                                                                                                                                                                                 

#include<stdio.h>                                                                                                                                                                                                  
	int char_no = 0;                                                                                                                                                                                                   

%}                                                                                                                                                                                                                 

%%                                                                                                                                                                                                                 

\n ;                                                                                                                                                                                                               
" " ;                                                                                                                                                                                                              
. ++char_no;                                                                                                                                                                                                       

end return 0;                                                                                                                                                                                                      

%%                                                                                                                                                                                                                 

int main()                                                                                                                                                                                                         

{                                                                                                                                                                                                                  

	yylex();                                                                                                                                                                                                           

	printf("number of chars = %d\n",char_no );                                                                                                                                                                         

	return 0;                                                                                                                                                                                                          

}             
