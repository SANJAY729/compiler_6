%{
	#include <stdio.h>
	#include "ass6_18CS10064_translator.h"
	#include "y.tab.h"
	extern void yyerror(const char *);
	static void comment(void);
	#include <math.h>
%}

digit 					[0-9]
identifier-nondigit 	[_a-zA-Z]
identifier 				(({identifier-nondigit}+)({digit}*))+

nonzero-digit 			[1-9]
integer-constant		{nonzero-digit}{digit}*|0

sign					"+"|"-"
digit-sequence 			{digit}+
exponent-part		  	e({sign})?{digit-sequence}|E({sign})?{digit-sequence}
fractional-constant 	({digit-sequence})?"."{digit-sequence}|{digit-sequence}"."
floating-constant 		{fractional-constant}({exponent-part})?|{digit-sequence}{exponent-part}

slash					[\\]
singlequote				[\']
doublequote				[\"]
questionmark			[\?]
escape-sequence 		{slash}{singlequote}|{slash}{doublequote}|{slash}{slash}|{slash}{questionmark}|"\\a"|"\\b"|"\\f"|"\\n"|"\\r"|"\\t"|"\\v"
c-char 					{escape-sequence}|[^'\\\n]
c-char-sequence			({c-char})+
character-constant		\'{c-char-sequence}\'

constant 				{integer-constant}|{floating-constant}|{character-constant}

s-char					{escape-sequence}|[^"\\\n]
s-char-sequence			({s-char})+
string-literal			\"({s-char-sequence})?\"

single-char-punctuator	"["|"]"|"."|"&"|"*"|"+"|"-"|"~"|"!"|"/"|"("|")"|"{"|"}"|"%"|","|"<"|">"|"^"|"|"|"="|"?"|":"|";"|"#"

singleline-comments		\/\/(.*)
multiline-comments 		\/\*(.|\n)*\*\/
white-space 			[ \t\n]

%%

"restrict"          {return RESTRICT;}
"break"             {return BREAK;}
"extern"            {return EXTERN;}
"return"            {return RETURN;}
"void"              {return VOID;}
"char"              {return CHAR;}
"for"              	{return FOR;}
"while"             {return WHILE;}
"const"             {return CONST;}
"goto"              {return GOTO;}
"sizeof"            {return SIZEOF;}
"case"              {return CASE;}
"float"             {return FLOAT;}
"short"             {return SHORT;}
"volatile"          {return VOLATILE;}
"continue"          {return CONTINUE;}
"if"                {return IF;}
"static"            {return STATIC;}
"default"           {return DEFAULT;}
"inline"            {return INLINE;}
"do"                {return DO;}
"int"               {return INT;}
"switch"            {return SWITCH;}
"double"            {return DOUBLE;}
"long"              {return LONG;}
"else"              {return ELSE;}

{identifier}             	{ yylval.idl.name=new string(yytext);return IDENTIFIER;}
{integer-constant}         	{ yylval.intval=atoi(yytext); return INTEGER_CONSTANT;}
{floating-constant}			{ yylval.floatval=atof(yytext); return FLOATING_CONSTANT;}
{character-constant}		{ yylval.charval=yytext[1]; return CHAR_CONST;}
{string-literal}    		{ yylval.strval = new string(yytext);return STRING_LITERAL;}

"->"                {return ARROW;}
"++"                {return INCREMENT;}
"--"                {return DECREMENT;}
"<<"                {return LEFT_SHIFT;}
">>"                {return RIGHT_SHIFT;}
"<="                {return LSOE;}
">="                {return GTOE;}
"=="                {return IS_EQUAL;}
"!="                {return NOT_EQUAL; }
"&&"                {return AND; }
"||"                {return OR; }
"..."               {return TRIPLE_DOT; }
"*="                {return MULTIPLY_EQUAL; }
"/="				{return DIVIDE_EQUAL;}
"%="				{return PERCENT_EQUAL;}
"+="				{return PLUS_EQUAL;}
"-="				{return MINUS_EQUAL;}
"<<="				{return LEFT_SHIFT_EQUAL;}
">>="				{return RIGHT_SHIFT_EQUAL;}
"&="				{return AND_EQUAL;}
"^="				{return HAT_EQUAL;}
"|="				{return OR_EQUAL;}

{single-char-punctuator}	{return yytext[0];}
{singleline-comments}       {;}
{multiline-comments}        {;}
{white-space}        		{;}

%%
int yywrap(){};