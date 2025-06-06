%%

%public
%class Scanner
%line
%column
%unicode
%standalone

%{
  private void print(String type, String value) {
    System.out.println("[" + type + "]: " + value.trim());
  }
%}
//macros ( \ antes do espaço da escape, faz com que ignore espaços e leia sem dar erro de compilação )
Patente = 7022487
Titulo = United\ States\ Patent
Data = July\ 31,\ 2003
Resumo = SUMMARY\ OF\ THE\ INVENTION
Reivindicações = Claims

%%

{Patente}  {
   System.out.println("[Linha:" + yyline + " Coluna:" + yycolumn + "] " + yytext() + " ( 1.Numero )" );
}

{Titulo} {
   System.out.println("[Linha:" + yyline + " Coluna:" + yycolumn + "] " + yytext() + " ( 2.Titulo )" );
}

{Data} {
   System.out.println("[Linha:" + yyline + " Coluna:" + yycolumn + "] " + yytext() + " ( 3.Data de publicação )" );
}

{Resumo} {
    System.out.println("[Linha:" + yyline + " Coluna:" + yycolumn + "] " + yytext() + " ( 4.Resumo [O resumo se encontra proximo a esta linha] )" );
}

{Reivindicações} {
    System.out.println("[Linha:" + yyline + " Coluna:" + yycolumn + "] " + yytext() + " ( 5.Reivindicações [As reivindicações se encontram proximo a estas linhas] )" );
}

[^]  { /* ignora outros caracteres */ }
