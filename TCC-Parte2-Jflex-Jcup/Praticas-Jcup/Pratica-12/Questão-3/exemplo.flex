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

%%

/* Regras e Ações Associadas: seção de instruções para o analisador léxico. */

{inteiro}     { return new Symbol(sym.INTEIRO, Integer.valueOf(yytext())); }

"do"      { return new Symbol(sym.DO); }
"num"     { return new Symbol(sym.NUM); }
"out"     { return new Symbol(sym.OUT); }

">"       { return new Symbol(sym.MAIOR); }
"<"       { return new Symbol(sym.MENOR); }
"="       { return new Symbol(sym.IGUAL); }
"["       { return new Symbol(sym.COLCHESQ); }
"]"       { return new Symbol(sym.COLCHDIR); }
"("       { return new Symbol(sym.PARENTESQ); }
")"       { return new Symbol(sym.PARENTDIR); }
";"       { return new Symbol(sym.PTVIRG); }
"++"      { return new Symbol(sym.INCREMENT); }
\n        { /* Ignora nova linha. */ }
[ \t\r]+  { /* Ignora espaços. */ }
.         { System.err.println("\n Caractere inválido: " + yytext() +
                               "\n Linha: " + yyline +
                               "\n Coluna: " + yycolumn + "\n"); 
            return null; 
          }