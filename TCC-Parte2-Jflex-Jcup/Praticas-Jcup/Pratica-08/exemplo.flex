import java_cup.runtime.Symbol;

%%

%cup

digito = [0-9]
inteiro = {digito}+

%%

{inteiro} {
            Integer numero = Integer.valueOf(yytext());
            return new Symbol(sym.INTEIRO, yyline, yycolumn, numero);
          }
"+"       { return new Symbol(sym.MAIS); }
"-"       { return new Symbol(sym.MENOS); }
"*"       { return new Symbol(sym.MULTIPLICA); } 
"/"       { return new Symbol(sym.DIVISAO); }
"%"       { return new Symbol(sym.RESTO); }
"^"       { return new Symbol(sym.POTENCIA); }
";"       { return new Symbol(sym.PTVIRG); }
\n        { /* Ignora nova linha. */ }
[ \t\r]+  { /* Ignora espaços. */ }
.         { System.err.println("Caractere inválido: " + yytext()); return null; }
