%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
[0-9]+  {
            yylval.value = atoi(yytext);
            return NUMBER;
        }
"["     { return OSBRACKET;}
"]"     { return CSBRACKET;}
","     { return COMMA;}
\n      { return 0;}
[ \t]+  { ; }
%%

#ifdef yywrap
    yywrap() { return 1; }
#endif
