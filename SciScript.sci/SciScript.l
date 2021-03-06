%{
#include <stdlib.h>
#include <stdio.h>
#include "y.tab.h"
void yyerror(char *); 
%}
%%
"("				{ return RPAR; }
")"				{ return LPAR; }
"{"				{ return RBRACK; }
"}"				{ return LBRACK; }
"=="			{ return EQU; }
"!="			{ return NE; }
">"				{ return GT; }
">="			{ return GE; }
"<"				{ return LT; }
"<="			{ return LE; }
";"				{ return SEMICOLON; }
"if"			{ return IF; }
"else"			{ return ELSE; }
"while"         { return WHILE; }
"do"            { return DO; }
"for"           { return FOR; }
"#"				{ return POUND; }
"define"		{ return DEFINE; }
"func"			{ return FUNC; }
"class"			{ return CLASS; }
(([0-9]+(\.[0-9]*)?)|([0-9]*\.[0-9]+)) {yylval.num = atoi(yytext); return NUMBER;}
[a-z][a-z0-9]*		{ yylval.id = yytext[0]; return NAME; }
[-+()=/*\n]		{ return *yytext; }
\               { ; }
\t              { ; }
.				yyerror("Invalid Character");

%%
int yywrap(void) {
    return 1;
}

