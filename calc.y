
%{
    #include<stdio.h>
    #include<math.h>
%}

%union   // Defines possible symbol types
{double p;}
%token<p>num
%token SIN COS TAN LOG LN SQRT SQURE CUBE

/*Defining the Precedence and Associativity*/
%left '+' '-'     //lowest Precedence
%left '*' '/'     //highest Precedence
%nonassoc uminu   //no Associativity
%type<p>exp       //Sets the type for nonterminal
%%

ss: exp {printf("Answer=%g\n",$1);} /*Stores the answer*/
/*for binary arithmetic operators*/
exp: exp'+'exp {$$=$1+$3;}
    |exp'-'exp {$$=$1-$3;}
    |exp'*'exp {$$=$1*$3;}
    |exp'/'exp { if($3==0)
                  {printf("Divide by zero err"); exit(0);
                  }
                  else $$=$1/$3;
                }
    |'-'exp {$$=-$2;}
    |'('exp')' {$$=$2;}
    |SIN'('exp')' {$$=sin($3);}
    |COS'('exp')' {$$=cos($3);}
    |TAN'('exp')' {$$=tan($3);}
    |LOG'('exp')' {$$=log($3);}
    |LN'('exp')' {$$=log($3);}
    |SQRT'('exp')' {$$=sqrt($3);}
    |SQURE'('exp')' {$$=$3*$3;}
    |CUBE'('exp')' {$$=$3*$3*$3;}
    |num;
%%

/*extern FILE *yyin; */

main(){
  do{
      printf("\n enter your expression please!");
      yyparse();   /*Parses the sentence repeatedly till the i/p runs out */
    }while(1);
}

yyerror(s) /*Prints the error message*/

char *s;
{
printf("ERROR");
}
