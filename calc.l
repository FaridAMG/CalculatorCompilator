%{
    #include<math.h>
    #include"calc.tab.h" // for left, right, up, down
%}
%%
[0-9]+|[0-9]*\.[0-9]+ {
                        yylval.p = atof(yytext);
                        return num;   // return nonterminal
                      }
sin {return SIN;}
cos {return COS;}
cube {return CUBE;}
squre {return SQURE;}
ln {return LN;}
tan return TAN;
log return LOG;
sqrt return SQRT;
[\t];
\n    return 0;
.     return yytext[0];
%%
