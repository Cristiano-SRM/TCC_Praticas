/* Definição: seção para código do usuário. */
import java_cup.runtime.Symbol;

%%

// Diretivas:

%cup
%unicode
%line
%column
%class MeuScanner

// Macros:
digito = [0-9]
inteiro = {digito}+
string = \"([^\"])*\"   
/* String entre aspas duplas */


%%

/* Declarações dos simbolos utilizados em JSON para o analisador lexico a ser gerado */

"{"           { return new Symbol(sym.ESQCHAVE); }
"}"           { return new Symbol(sym.DIRCHAVE); }
"["           { return new Symbol(sym.ESQCOLCH); }
"]"           { return new Symbol(sym.DIRCOLCH); }
":"           { return new Symbol(sym.DOISPON); }
","           { return new Symbol(sym.VIRG); }
{string}      { return new Symbol(sym.STRING, yytext()); }
{inteiro}     { return new Symbol(sym.NUMBERO, Integer.valueOf(yytext())); }
[ \t\r\n]+    { /* Ignorar espaços, tabs e novas linhas */ }
.             { System.err.println("Caractere inválido: " + yytext() + " na linha: " + yyline); return null; }
