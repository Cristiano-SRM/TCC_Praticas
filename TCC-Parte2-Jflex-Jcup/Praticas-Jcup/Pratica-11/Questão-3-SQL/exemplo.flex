/* Definição: seção para código do usuário. */
import java_cup.runtime.Symbol;

%%

%cup
%unicode
%line
%column
%class MeuScanner

/* Macros */
letra = [a-zA-Z]
digito = [0-9]
ident = [a-zA-Z0-9_]([a-zA-Z0-9_])* 
/* o identificador que gera o ID para o identificador selecionado, pode ser quaisquer letras ou numeros e pode ser separado por _ */

%%

/* Palavras-chave (potencialmente pode-se incluir coisas como INSERT e DELETE etc, há espaço para melhoria) */
"SELECT"    { return new Symbol(sym.SELECT); }
"FROM"      { return new Symbol(sym.FROM); }
"WHERE"     { return new Symbol(sym.WHERE); }

/* Símbolos utilizados na gramatica SQL */
","             { return new Symbol(sym.VIRG); }
";"             { return new Symbol(sym.PTVIRG); }
"="             { return new Symbol(sym.IGUAL); }
"."             { return new Symbol(sym.PONTO); }  /* Adicionamos o ponto */

/* Identificador qualificado */
{ident}         { return new Symbol(sym.ID, yytext()); }

/* Ignorar espaços, tabs e novas linhas (isto junto ao StringBuilder disponibilizam que o prompt SQL seja escrito em varias linhas) */
[ \t\r\n]+      { /* Ignora */ }

/* Qualquer outro caractere é inválido */
.               { System.err.println("Caractere inválido: " + yytext() + " na linha: " + yyline); return null; }
