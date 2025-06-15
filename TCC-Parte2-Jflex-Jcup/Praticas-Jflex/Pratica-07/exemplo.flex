%%

%public
%class Scanner
%line
%column
%unicode
%standalone

 /* A partir do estado inicial, quando analisador lexico encontra uma sequencia definida
ele muda para o estado, lê o conteudo e chama o metodo auxiliar imprimir abaixo informando tipo(uma string), o proprio conteudo, linha e coluna
o metodo auxiliar então imprime o resultado formatado com uma quebra de linha, processo se repete ate todo o html ter sido lido.

 baseei-me bastante no exemplo-5 da atividade no uso de estados*/

%{
   private StringBuilder buffer = new StringBuilder();

   private void imprimir(String tipo, String texto, int linha, int coluna) {
        System.out.println(tipo + " (linha: " + linha + ", coluna: " + coluna + "): " + texto.trim() + "\n");
   }
%}

// Estados personalizados dado as necessidades da atividade, como há três reivindicações, fiz 3 estados diferentes
%states LINHA_PATENTE, LINHA_TITULO, LINHA_DATA, LINHA_RESUMO, LINHA_CLAIMS_UM, LINHA_CLAIMS_DOIS, LINHA_CLAIMS_TRES

%%
// Estado inicial, quando encontra quaisquer umas destas sequencias, muda de estado para ler o conteudo das mesmas, limpando o buffer toda vez
<YYINITIAL> {

    // Encontra-se o numero da patente e muda de estado
    "<TR>"[ \t]*"<TD ALIGN=\"LEFT\" WIDTH=\"50%\"><B>United States Patent </B></TD>"[ \t]*"<TD ALIGN=\"RIGHT\" WIDTH=\"50%\"><B>" {
        yybegin(LINHA_PATENTE); 
        buffer.setLength(0); // limpa buffer
    }

    // Encontra-se o titulo e muda de estado
    "<TITLE>"[ \t]* {
        yybegin(LINHA_TITULO);
        buffer.setLength(0);
    }

    // Encontra a data de publicação, escolhi esta data pois as tags proximas eram "PUB. date" o que interpretei como publish date ou published (publicado)
    "<TR><TD VALIGN=\"TOP\" ALIGN=\"LEFT\" WIDTH=\"10%\" NOWRAP>PCT PUB. Date: </TD><TD ALIGN=\"LEFT\" WIDTH=\"90%\"><B>" {
        yybegin(LINHA_DATA);
        buffer.setLength(0);
    }

    // Encontra o resumo 'Abstract' e muda de estado
    "<BR><CENTER><B>Abstract</B></CENTER><P>" {
        yybegin(LINHA_RESUMO);
        buffer.setLength(0);
    }
    // Encontra as reivindicações, são 3
    "<BR1> 1." {
        yybegin(LINHA_CLAIMS_UM);
        buffer.setLength(0);
    }

    "<BR2> 2." {
        yybegin(LINHA_CLAIMS_DOIS);
        buffer.setLength(0);
    }

    "<BR3> 3." {
        yybegin(LINHA_CLAIMS_TRES);
        buffer.setLength(0);
    }

    [^] { /* Ignora outros caracteres */ }

    /* Obti-ve problemas em fazer o flex identificar tags com quebras de linha, então agrupei os conteudos em uma só linha no html
    mas em teoria ele faz o que a atividade pede, identifica certas tags e lê o conteudo entre elas, espero que esteja tudo bem */
}

// Inicia a leitura da patente e imprime o resultado
<LINHA_PATENTE> {
    "</B></TD> </TR>" {
        imprimir("Número da patente", buffer.toString(), yyline, yycolumn);
        buffer.setLength(0);
        yybegin(YYINITIAL);
    }

    [^<]+ { buffer.append(yytext()); }
}

// Inicia a leitura do titulo e imprime o resultado
<LINHA_TITULO> {
    "</TITLE>" {
        imprimir("Título", buffer.toString(), yyline, yycolumn);
        buffer.setLength(0);
        yybegin(YYINITIAL);
    }

    [^<]+ { buffer.append(yytext()); }
}

// Inicia a leitura da data e imprime o resultado
<LINHA_DATA> {
    "</B></TD></TR></TABLE>" {
        imprimir("Data de publicação", buffer.toString(), yyline, yycolumn);
        buffer.setLength(0);
        yybegin(YYINITIAL);
    }

    [^<]+ { buffer.append(yytext()); }
}

// Inicia a leitura do resumo e imprime o resultado
<LINHA_RESUMO> {
    "</P><HR><TABLE WIDTH=\"100%\">" {
        imprimir("Resumo (Abstract)", buffer.toString(), yyline, yycolumn);
        buffer.setLength(0);
        yybegin(YYINITIAL);
    }

    [^<]+ { buffer.append(yytext()); }
}

// Inicia a leitura da primeira reivindicação e imprime o resultado
<LINHA_CLAIMS_UM> {
    "<BR1>" {
        imprimir("Reivindicação 1", buffer.toString(), yyline, yycolumn);
        buffer.setLength(0);
        yybegin(YYINITIAL);
    }

    [^<]+ { buffer.append(yytext()); }
}

// Inicia a leitura da segunda reivindicação e imprime o resultado
<LINHA_CLAIMS_DOIS> {
    "<BR2>" {
        imprimir("Reivindicação 2", buffer.toString(), yyline, yycolumn);
        buffer.setLength(0);
        yybegin(YYINITIAL);
    }

    [^<]+ { buffer.append(yytext()); }
}

// Inicia a leitura da terceira reivindicação e imprime o resultado
<LINHA_CLAIMS_TRES> {
    "<BR3>" {
        imprimir("Reivindicação 3", buffer.toString(), yyline, yycolumn);
        buffer.setLength(0);
        yybegin(YYINITIAL);
    }

    [^<]+ { buffer.append(yytext()); }
}
