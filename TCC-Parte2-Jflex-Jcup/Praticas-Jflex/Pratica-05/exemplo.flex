/* Alguns métodos e variáveis disponíveis:
 * int yyline: armazena o número da linha atual.
 * int yycolumn: armazena o número da coluna atual na linha atual.
 * String yytext(): método que retorna a sequência de caracteres que foi casada com a regra.
 * int yylength(): método que retorna o comprimento da sequência de caracteres que foi casada com a regra.
 */

/* Definição: seção para código do usuário. */

%%

/* Opções e Declarações: seção para diretivas e macros. 
 Importante: 
  - Alguns caracteres precisam ser tratados com \, como:
    - `/` vira `\/`   porque barra `/` é interpretada como operador de divisão
    - `:` vira `\:`   dois pontos são interpretados como um operador, nao tenho certeza qual
    - `+` vira `\+`   mais é interpretado como operador de repetição/adição
    - `.` vira `\.`   ponto é interpretado como qualquer caractere, então precisa ser literal
    - '( ', ')' e '-' não preçisam ser tratados, pois são interpretados literalmente */

%standalone      // Execução independente do analisador sintático. (Faz com que não precisemos usar jcup)
%line            // Permite usar yyline.
%column          // Permite usar yycolumn.
%class Scanner   // Troca o nome da classe Yylex para Scanner.

%{
    /* Metodo que pega o texto/string do input, posteriormente mostrado nos macros*/
    public String getLexema() {
        return yytext();
    }
%}

// Macros:
/* Letras e numeros basicos */
letra = [a-zA-Z]
numero = [0-9]

/* Macros para data, hora, telefone, cpf, email e URL como pedido na ativdade 5, uso de '\' explicado acima */
data = {numero}{numero}\/{numero}{numero}\/{numero}{numero}{numero}{numero}
hora = {numero}{numero}\:{numero}{numero}

/* ' s* ' permite zero ou mais espaços, poderia ter somente ignorado espaços também */
telefone = {numero}{numero}\+\s*\({numero}{numero}{numero}\)\s*{numero}\s*{numero}{numero}{numero}{numero}-{numero}{numero}{numero}{numero}

cpf = {numero}{numero}{numero}\.{numero}{numero}{numero}\.{numero}{numero}{numero}-{numero}{numero}

/* Permite letras e números antes de @. Após @, permite letras, números e hífen.*/
email = {letra}({letra}|{numero})*@{letra}({letra}|{numero}|[-])*\.{letra}+

/* - `sei que também exist http mas decidi ir com apenas https
   - [./?=_-] porque um link pode conter estes simbulos de maneira aleatoria*/
url = https\:\/\/({letra}|{numero}|[./?=_-])+

%%

/* Regras lexicas, caso estes tokens sejam identificados, imprimem X mensagem*/

{data} {
    System.out.println(" -> Encontrei um <Token: DATA, Lexema: " + getLexema() + ", Tamanho: " + yylength() + ", Linha: " + yyline + ", Coluna: " + yycolumn + ">");
}

{hora} {
    System.out.println(" -> Encontrei um <Token: HORA, Lexema: " + getLexema() + ", Tamanho: " + yylength() + ", Linha: " + yyline + ", Coluna: " + yycolumn + ">");
}

{telefone} {
    System.out.println(" -> Encontrei um <Token: TELEFONE, Lexema: " + getLexema() + ", Tamanho: " + yylength() + ", Linha: " + yyline + ", Coluna: " + yycolumn + ">");
}

{cpf} {
    System.out.println(" -> Encontrei um <Token: CPF, Lexema: " + getLexema() + ", Tamanho: " + yylength() + ", Linha: " + yyline + ", Coluna: " + yycolumn + ">");
}

{email} {
    System.out.println(" -> Encontrei um <Token: EMAIL, Lexema: " + getLexema() + ", Tamanho: " + yylength() + ", Linha: " + yyline + ", Coluna: " + yycolumn + ">");
}

{url} {
    System.out.println(" -> Encontrei um <Token: URL, Lexema: " + getLexema() + ", Tamanho: " + yylength() + ", Linha: " + yyline + ", Coluna: " + yycolumn + ">");
}

/* Ignorar qualquer coisa não casada */
.|\n { /* Ignorar */ }
