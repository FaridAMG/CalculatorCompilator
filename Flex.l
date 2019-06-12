
%{
    #include<math.h>
    #include "y.tab.h" // for left, right, up, down
}%

%%
[0-9]+|[0-9]*\.[0-9]+ {
                        yylval.p = atof(yytext);
                        return num;   // return nonterminal
                      }

                  //Send TOKENS to YACC
sin {return SIN;}
cos {return COS;}
cube {return CUBE;}
square {return SQURE;}
ln {return LN;}
tan {return TAN;}
log {return LOG};
sqrt {return SQRT};
[\t];
\n    return 0;
.     return yytext[0];

%%
