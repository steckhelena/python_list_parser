
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}


%%

[0-9]+	{ return INT; }

[\'].*[\']	|
[\"].*[\"]	{ return STRING; }

[_a-zA-Z][_0-9a-zA-Z]*	{ return PALAVRA; } 

[\[][[:space:]]*[\]]	{ return VAZIO; }

"\["	|
"\]"	|
"," 	|
\n { return yytext[0]; }

[[:space:]] ;

.	{ return END; }

%%

int yywrap() {
  return 1;
}
