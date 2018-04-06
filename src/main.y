

%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token INT STRING PALAVRA VAZIO END

%%

PROGRAMA	:	'[' DENTRO ']' '\n' { printf("OK\n"); exit(0); }
		 	|	VAZIO '\n' { printf("OK\n"); exit(0); }
		 	;

DENTRO	:	ELEMENTO
	   	|	DENTRO ',' DENTRO
		|	'[' DENTRO ']'
		;

ELEMENTO	:	INT
			|	STRING
			|	PALAVRA
			|	VAZIO
			;

%%

void yyerror(char *s) {
	printf("ERRO\n");
}

int main() {
  yyparse();
    return 0;

}
