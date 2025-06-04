/* 
 * Alguns métodos e variáveis disponíveis:
 * int yyline: armazena o número da linha atual.
 * int yycolumn: armazena o número da coluna atual na linha atual.
 * String yytext(): método que retorna a sequência de caracteres que foi casada com a regra.
 * int yylength(): método que retorna o comprimento da sequência de caracteres que foi casada com a regra.
 */

/* 
  Importa a classe Token localizada no pacote token 
Sempre que uma regra for identificada pelo analisador léxico, o analisador cria uma nova instância de Token (objeto), 
passando as informações específicas: linha, coluna, lexema e descrição. 
Em seguida, chama o método 'imprimir()' da instância de Token para exibir os dados do token reconhecido.
*/

import token.Token;

%%

/* 
 * Opções e Declarações: seção para diretivas e macros. 
 */

// Diretivas:
%standalone         // Execução independente do analisador sintático.
%line               // Permite usar yyline.
%column             // Permite usar yycolumn.
%class Scanner      // Troca o nome da classe Yylex para Scanner.

%{
  Token token; /* Declara a variavel token do tipo Token dentro do analisador lexico (Yylex, ou neste caso renomeado para Scanner)*/
%}

/* Macros utilizados para ler um trecho de codigo pascal: */
BRANCO = [\n| |\t|\r]
PONTOEVIRGULA = ";"
VIRGULA = ","                   
ABREPARENTESE = "("
FECHAPARENTESE = ")"
SOMA = "+"
SUBTRACAO = "-"
MULTIPLICACAO = "*"
DIVISAO = "/"
ATRIBUICAO = ":="
COMPARACAO = "=="
MENOR = "<"
MAIOR = ">"
INTEIRO = 0|[1-9][0-9]*
ID = [_|a-z|A-Z][a-z|A-Z|0-9|_]*

%%

/*  
   Regras: seção de instruções para o analisador léxico. (Quando Lê um token, imprime na tela) 
 */

{ABREPARENTESE}  { token = new Token(yyline, yycolumn, yytext(), "Abre parêntese"); token.imprimir(); }
{FECHAPARENTESE} { token = new Token(yyline, yycolumn, yytext(), "Fecha parêntese"); token.imprimir(); }
{PONTOEVIRGULA}  { token = new Token(yyline, yycolumn, yytext(), "Ponto e vírgula"); token.imprimir(); }
{VIRGULA}        { token = new Token(yyline, yycolumn, yytext(), "Vírgula"); token.imprimir(); } 
{ATRIBUICAO}     { token = new Token(yyline, yycolumn, yytext(), "Atribuição"); token.imprimir(); }
{COMPARACAO}     { token = new Token(yyline, yycolumn, yytext(), "Comparação"); token.imprimir(); }
{MENOR}          { token = new Token(yyline, yycolumn, yytext(), "Operador menor"); token.imprimir(); }
{MAIOR}          { token = new Token(yyline, yycolumn, yytext(), "Operador maior"); token.imprimir(); }
{SOMA}           { token = new Token(yyline, yycolumn, yytext(), "Operador soma"); token.imprimir(); }
{SUBTRACAO}      { token = new Token(yyline, yycolumn, yytext(), "Operador subtração"); token.imprimir(); }
{MULTIPLICACAO}  { token = new Token(yyline, yycolumn, yytext(), "Operador multiplicação"); token.imprimir(); }
{DIVISAO}        { token = new Token(yyline, yycolumn, yytext(), "Operador divisão"); token.imprimir(); }

"if"             { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada if"); token.imprimir(); }
"then"           { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada then"); token.imprimir(); }
"else"           { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada else"); token.imprimir(); }
"begin"          { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada begin"); token.imprimir(); }
"end"            { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada end"); token.imprimir(); }
"writeln"        { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada writeln"); token.imprimir(); }
"sqrt"           { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada sqrt"); token.imprimir(); }

{BRANCO}         { token = new Token(yyline, yycolumn, yytext(), "Espaço em branco"); token.imprimir(); }
\'[^\'\n]*\'     { token = new Token(yyline, yycolumn, yytext(), "Constante string"); token.imprimir(); }

{ID}             { token = new Token(yyline, yycolumn, yytext(), "Identificador"); token.imprimir(); }
{INTEIRO}        { token = new Token(yyline, yycolumn, yytext(), "Número"); token.imprimir(); }

.                { token = new Token(yyline, yycolumn, yytext(), "Caractere inválido"); token.dispararExcecao(); }
