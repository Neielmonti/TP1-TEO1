import java_cup.runtime.Symbol;

%%

/*%cupsym Simbolo*/
%cup 
%public
%class Lexico
%line
%column
%char

LineTerminator = \r|\n|\r\n
WhiteSpace = {LineTerminator} | [ \t\f]
COM = \"
LETRA = [a-zA-Z]+
DIGITO = [0-9]
ESPACIO = \t|\f
ID = {LETRA}({LETRA}|{DIGITO}|_)*
CONST_INT = {DIGITO}+
CONST_STRING = {COM}({LETRA}|{DIGITO}|{ESPACIO})*{COM}
CONST_B = 0b(0|1)+
OP_LOGICO = <=|>=|<>|<|>|=
OP_ARITMETICO = \+|-|\*|\/
CON_LOGICO = and|or|xor
OPLIST = oplist[(+|*)  [ID;ID] [(CTE_E|CTE_R)  (;  (CTE_E|CTE_R))*  ]  ]

%%

<YYINITIAL> {
{ID}	{System.out.println("Token ID encontrado, Lexema "+ yytext());}
{CONST_INT}	{System.out.println("Token CONST_INT, encontrado Lexema "+ yytext());}
{CONST_STRING}      {System.out.println("Token CONST_STRING encontrado, Lexema "+ yytext());}
{CONST_B}           {System.out.println("Token CONST_B encontrado, Lexema "+ yytext());}
{OP_LOGICO}         {System.out.println("Token OP_LOGICO encontrado, Lexema "+ yytext());}
{OP_ARITMETICO}     {System.out.println("Token OP_ARITMETICO encontrado, Lexema "+ yytext());}
{CON_LOGICO}        {System.out.println("Token CON_LOGICO encontrado, Lexema "+ yytext());}
{OPLIST}            {System.out.println("Token OPLIST encontrado, Lexema "+ yytext());}
"::="	{System.out.println("Token ASIGN encontrado, Lexema "+yytext());}
":="	{System.out.println("Token DECLARATION encontrado, Lexema "+yytext());}
"if"                    {System.out.println("Token IF encontrado, Lexema "+yytext());}
"else"                  {System.out.println("Token ELSE encontrado, Lexema "+yytext());}
"endif"                 {System.out.println("Token ENDIF encontrado, Lexema "+yytext());}
"while"                 {System.out.println("Token WHILE encontrado, Lexema "+yytext());}
"for"                   {System.out.println("Token FOR encontrado, Lexema "+yytext());}
"foreach"               {System.out.println("Token FOREACH encontrado, Lexema "+yytext());}
"endwhile"              {System.out.println("Token ENDWHILE encontrado, Lexema "+yytext());}
"endfor"                {System.out.println("Token ENDFOR encontrado, Lexema "+yytext());}
"write"                 {System.out.println("Token WRITE encontrado, Lexema "+yytext());}
"float"                 {System.out.println("Token FLOAT encontrado, Lexema "+yytext());}
"integer"               {System.out.println("Token INTEGER encontrado, Lexema "+yytext());}
"string"                {System.out.println("Token STRING encontrado, Lexema "+yytext());}
"boolean"               {System.out.println("Token BOOLEAN encontrado, Lexema "+yytext());}
"range"                 {System.out.println("Token RANGE encontrado, Lexema "+yytext());}
"true"                  {System.out.println("Token TRUE encontrado, Lexema "+yytext());}
"false"                 {System.out.println("Token FALSE encontrado, Lexema "+yytext());}
"oplist"                {System.out.println("Token OPLIST encontrado, Lexema "+yytext());}
"DECLARE.SECTION"       {System.out.println("Token DECLARE.SECTION encontrado, Lexema "+yytext());}
"ENDDECLARE.SECTION"    {System.out.println("Token ENDDECLARE.SECTION encontrado, Lexema "+yytext());}
"PROGRAM.SECTION"       {System.out.println("Token PROGRAM.SECTION encontrado, Lexema "+yytext());}
"ENDPROGRAM.SECTION"    {System.out.println("Token ENDPROGRAM.SECTION encontrado, Lexema "+yytext());}
/* whitespace */
{WhiteSpace}                   { /* ignore */ }

[^] { throw new Error("Caracter no permitido: " + yytext() + "> en la linea " + yyline); }

}