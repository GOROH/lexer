%{
    int simbuls = 0;
%}

%option yylineno
identifier [[:alpha:]]([[:alpha:]]|[[:digit:]])*

%%
"+" {
    printf("PL{%d, %d, %d}; ", yylineno, simbuls, simbuls + yyleng);
    simbuls += yyleng;
}
"-" {
    printf("MIN{%d, %d, %d}; ", yylineno, simbuls, simbuls + yyleng);
    simbuls += yyleng;
}
"*" {
    printf("UMN{%d, %d, %d}; ", yylineno, simbuls, simbuls + yyleng);
    simbuls += yyleng;
}
"=" {
    printf("EQ{%d, %d, %d}; ", yylineno, simbuls, simbuls + yyleng);
    simbuls += yyleng;
}
"==" {
    printf("EQ2{%d, %d, %d}; ", yylineno, simbuls, simbuls + yyleng);
    simbuls += yyleng;
}
"(" {
    printf("BRACKET{%d, %d, %d}; ", yylineno, simbuls, simbuls + yyleng);
    simbuls += yyleng;
}
")" {
    printf("BRACKET2{%d, %d, %d}; ", yylineno, simbuls, simbuls + yyleng);
    simbuls += yyleng;
}

"/" {
    printf("SLASH{%d, %d, %d}; ", yylineno, simbuls, simbuls + yyleng);
    simbuls += yyleng;
}
"%" {
    printf("PROZ{%d, %d, %d}; ", yylineno, simbuls, simbuls + yyleng);
    simbuls += yyleng;
}

"!=" {
    printf("NOEQ{%d, %d, %d}; ", yylineno, simbuls, simbuls + yyleng);
    simbuls += yyleng;
}
">" {
    printf("MORE{%d, %d, %d}; ", yylineno, simbuls, simbuls + yyleng);
    simbuls += yyleng;
}
"<" {
    printf("LESS{%d, %d, %d}; ", yylineno, simbuls, simbuls + yyleng);
    simbuls += yyleng;
">=" {
    printf("MOREEQ{%d, %d, %d}; ", yylineno, simbuls, simbuls + yyleng);
    simbuls += yyleng;
}
"<=" {
    printf("LESSEQ{%d, %d, %d}; ", yylineno, simbuls, simbuls + yyleng);
    simbuls += yyleng;
}
"&&" {
    printf("AND{%d, %d, %d}; ", yylineno, simbuls, simbuls + yyleng);
    simbuls += yyleng;
}
"||" {
    printf("OR{%d, %d, %d}; ", yylineno, simbuls, simbuls + yyleng);
    simbuls += yyleng;
}
":=" {
    printf("ASSIGN{%d, %d, %d}; ", yylineno, simbuls, simbuls + yyleng);
    simbuls += yyleng;
}
";" {
    printf("SEMICOLON{%d, %d, %d}; ", yylineno, simbuls, simbuls + yyleng);
    simbuls += yyleng;
}
"while" {
    printf("WHILE{%d, %d, %d}; ", yylineno, simbuls, simbuls + yyleng);
    simbuls += yyleng;
}
"do" {
    printf("DO{%d, %d, %d}; ", yylineno, simbuls, simbuls + yyleng);
    simbuls += yyleng;
}
"if" {
    printf("IF{%d, %d, %d}; ", yylineno, simbuls, simbuls + yyleng);
    simbuls += yyleng;
}
"then" {
    printf("THEN{%d, %d, %d}; ", yylineno, simbuls, simbuls + yyleng);
    simbuls += yyleng;
}
"else" {
    printf("ELSE{%d, %d, %d}; ", yylineno, simbuls, simbuls + yyleng);
    simbuls += yyleng;
}
"skip" {
    printf("SKIP{%d, %d, %d}; ", yylineno, simbuls, simbuls + yyleng);
    simbuls += yyleng;
}
"write" {
    printf("WRITESYM{%d, %d, %d}; ", yylineno, simbuls, simbuls + yyleng);
    simbuls += yyleng;
}
"read" {
    printf("READ{%d, %d, %d}; ", yylineno, simbuls, simbuls + yyleng);
    simbuls += yyleng;
}

{identifier} {
    printf("IDENTIFIER{%s, %d, %d, %d}; ", yytext, yylineno, simbuls, simbuls + yyleng);
    simbuls += yyleng;
}
[[:digit:]]+ {
    printf("DIGIT{%s, %d, %d, %d}; ", yytext, yylineno, simbuls, simbuls + yyleng);
    simbuls += yyleng;
}
. {
    printf("DOT{%s, %d, %d, %d}; ", yytext, yylineno, simbuls, simbuls + yyleng);
    simbuls += yyleng;
}
{
    printf("\n");
    simbuls = 0;
}

%%
int main(int argc, char **argv) 
{
    argv++; argc--;
    if (argc > 0) 
		{
			yyin = fopen(argv[0], "r");
		} 
			else 
			{
				yyin = stdin;
			}
    yylex();
}
