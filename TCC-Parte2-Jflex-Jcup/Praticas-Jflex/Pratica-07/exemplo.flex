%%

%standalone          // Executa sem precisar de um parser
%class Scanner       // Nome da classe gerada
%line                // Ativa rastreamento de linha
%column              // Ativa rastreamento de coluna
%type void     // Especifica o tipo de retorno do yylex().

%{
   // Variável para armazenar a String (StringBuilder melhora o desempenho):
    private StringBuilder comentario = new StringBuilder();

    // Método auxiliar para imprimir o comentário:
    private void imprimirComentario(String texto, int linha, int coluna) {
        System.out.println("Comentário (linha: " + linha + ", coluna: " + coluna + "): " + texto.trim());
    }
%}

%states TITLE

%%

<YYINITIAL>{
    "<TITLE>" {
        yybegin(TITLE);
        comentario.setLength(0);
    }
     [^] { /* Ignorar qualquer caracter fora de comentários. */ }
}

<TITLE> {
    "</TITLE>" {
        yybegin(YYINITIAL);
        imprimirComentario(comentario.toString(), yyline, yycolumn);
        comentario.setLength(0);
    }

     . { comentario.append(yytext()); }
}

<<EOF>> { 
    if (comentario.length() > 0) {
        imprimirComentario(comentario.toString(), yyline, yycolumn);
        comentario.setLength(0);
    }
    System.out.println("Fim do arquivo!");

    return;
}