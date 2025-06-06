import java_cup.runtime.Symbol;

%%

// Diretivas do JFlex:
%cup
%unicode
%line
%column
%class MeuScanner

// Macros:
conteudo = [a-zA-Z0-9:/._-]
string = {conteudo}+

%%

/* Regras léxicas */

"a"       { return new Symbol(sym.HYPERLINK); }
"/a"      { return new Symbol(sym.CLOSEHYPER); } 
"href"    { return new Symbol(sym.REFERENCE); }
"img"     { return new Symbol(sym.IMAGE); }
"src"     { return new Symbol(sym.SOURCE); }

"<"       { return new Symbol(sym.ABRETAG); }
">"       { return new Symbol(sym.FECHATAG); }
"="       { return new Symbol(sym.IGUAL); }
"/"       { return new Symbol(sym.CLOSEBAR); }
\"        { return new Symbol(sym.ASPAS); }

{string}  { return new Symbol(sym.STRING, yytext()); }

\n        { /* ignora nova linha */ }
[ \t\r]+  { /* ignora espaços em branco */ }

.         { 
  System.err.println("\nCaractere inválido: " + yytext() +
                     "\nLinha: " + yyline +
                     "\nColuna: " + yycolumn + "\n"); 
  return null; 
}
