/* Definição: seção para código do usuário. */

import java_cup.runtime.Symbol;

%%

/* Opções e Declarações: seção para diretivas e macros. */

// Diretivas:
%cup
%unicode
%line
%column
%class MeuScanner

// Macros:
digito = [0-9]
inteiro = {digito}+
string = [a-zA-Z]

%%

/* Regras e Ações Associadas: seção de instruções para o analisador léxico. */

{string}      { return new Symbol(sym.STRING, yytext()); }
{inteiro}     { return new Symbol(sym.INTEIRO, Integer.valueOf(yytext())); }

"if"      { return new Symbol(sym.IF); }
"else"    { return new Symbol(sym.ELSE); }

">"       { return new Symbol(sym.MAIOR); }
"<"       { return new Symbol(sym.MENOR); }
"="       { return new Symbol(sym.IGUAL); }
"("       { return new Symbol(sym.PARENTESQ); }
")"       { return new Symbol(sym.PARENTDIR); }
";"       { return new Symbol(sym.PTVIRG); }
\n        { /* Ignora nova linha. */ }
[ \t\r]+  { /* Ignora espaços. */ }
.         { System.err.println("\n Caractere inválido: " + yytext() +
                               "\n Linha: " + yyline +
                               "\n Coluna: " + yycolumn + "\n"); 
            return null; 
          }