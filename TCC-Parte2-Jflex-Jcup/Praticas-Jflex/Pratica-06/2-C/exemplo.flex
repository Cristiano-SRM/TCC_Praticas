import token.Token;

/* 
  Importa a classe Token localizada no pacote token 
Sempre que uma regra for identificada pelo analisador léxico, o analisador cria uma nova instância de Token (objeto), 
passando as informações específicas: linha, coluna, lexema e descrição. 
Em seguida, chama o método 'imprimir()' da instância de Token para exibir os dados do token reconhecido.
*/

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

/* Macros utilizados para ler um trecho de codigo C: */
BRANCO = [ \t\r\n]+
ID = [a-zA-Z_][a-zA-Z0-9_]*
NUM = [0-9]+

%%

/*  
   Regras: seção de instruções para o analisador léxico. (Quando Lê um token valido, imprime na tela) 
   C, principalmente este trecho de codigo especifico não tem muita complexidade ou variedade em atribuições
   Então o processo de macro foi pulado e incluido diretamente nas regras (caso mais precisão e especificidade fosse necessario macros seriam importantes)
 */
"int"     { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada int"); token.imprimir(); }
"while"   { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada while"); token.imprimir(); }
"return"  { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada return"); token.imprimir(); }
"printf"  { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada printf"); token.imprimir(); }
"main"    { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada main"); token.imprimir(); }

"<="      { token = new Token(yyline, yycolumn, yytext(), "Operador relacional menor ou igual"); token.imprimir(); }
"++"      { token = new Token(yyline, yycolumn, yytext(), "Operador de incremento"); token.imprimir(); }
"+="      { token = new Token(yyline, yycolumn, yytext(), "Operador de atribuição com soma"); token.imprimir(); }
"="       { token = new Token(yyline, yycolumn, yytext(), "Operador de atribuição"); token.imprimir(); }
";"       { token = new Token(yyline, yycolumn, yytext(), "Ponto e vírgula"); token.imprimir(); }
"("       { token = new Token(yyline, yycolumn, yytext(), "Abre parêntese"); token.imprimir(); }
")"       { token = new Token(yyline, yycolumn, yytext(), "Fecha parêntese"); token.imprimir(); }
"{"       { token = new Token(yyline, yycolumn, yytext(), "Abre chave"); token.imprimir(); }
"}"       { token = new Token(yyline, yycolumn, yytext(), "Fecha chave"); token.imprimir(); }

{ID}      { token = new Token(yyline, yycolumn, yytext(), "Identificador"); token.imprimir(); }
{NUM}     { token = new Token(yyline, yycolumn, yytext(), "Número"); token.imprimir(); }
{BRANCO}  { token = new Token(yyline, yycolumn, yytext(), "Espaço em branco"); token.imprimir(); }

.         { token = new Token(yyline, yycolumn, yytext(), "Caractere inválido"); token.dispararExcecao(); }
