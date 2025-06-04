import token.Token;

/* 
  Importa a classe Token localizada no pacote token.
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
  Token token; /* Declara a variável token do tipo Token dentro do analisador léxico (Yylex, ou neste caso renomeado para Scanner) */
%}

/* Macros utilizados para ler um trecho de código Java: */
BRANCO = [ \t\r\n]+
ID = [a-zA-Z_][a-zA-Z0-9_]*
NUM = [0-9]+

%%

/*  
   Regras: seção de instruções para o analisador léxico.
   Neste exemplo, o analisador foi preparado para reconhecer as principais palavras reservadas, operadores e símbolos
   que aparecem no trecho de código fornecido.
*/

"public"      { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada public"); token.imprimir(); }
"class"       { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada class"); token.imprimir(); }
"static"      { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada static"); token.imprimir(); }
"void"        { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada void"); token.imprimir(); }
"int"         { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada int"); token.imprimir(); }
"for"         { token = new Token(yyline, yycolumn, yytext(), "Palavra reservada for"); token.imprimir(); }
"System"      { token = new Token(yyline, yycolumn, yytext(), "Classe System"); token.imprimir(); }
"out"         { token = new Token(yyline, yycolumn, yytext(), "Objeto out"); token.imprimir(); }
"println"     { token = new Token(yyline, yycolumn, yytext(), "Método println"); token.imprimir(); }
"args"        { token = new Token(yyline, yycolumn, yytext(), "Parâmetro args"); token.imprimir(); }
"Principal"   { token = new Token(yyline, yycolumn, yytext(), "Classe Principal"); token.imprimir(); }

":"           { token = new Token(yyline, yycolumn, yytext(), "Dois pontos"); token.imprimir(); }
"="           { token = new Token(yyline, yycolumn, yytext(), "Operador de atribuição"); token.imprimir(); }
","           { token = new Token(yyline, yycolumn, yytext(), "Vírgula"); token.imprimir(); }
";"           { token = new Token(yyline, yycolumn, yytext(), "Ponto e vírgula"); token.imprimir(); }
"("           { token = new Token(yyline, yycolumn, yytext(), "Abre parêntese"); token.imprimir(); }
")"           { token = new Token(yyline, yycolumn, yytext(), "Fecha parêntese"); token.imprimir(); }
"{"           { token = new Token(yyline, yycolumn, yytext(), "Abre chave"); token.imprimir(); }
"}"           { token = new Token(yyline, yycolumn, yytext(), "Fecha chave"); token.imprimir(); }
"\["          { token = new Token(yyline, yycolumn, yytext(), "Abre colchete"); token.imprimir(); }
"\]"          { token = new Token(yyline, yycolumn, yytext(), "Fecha colchete"); token.imprimir(); }
"."           { token = new Token(yyline, yycolumn, yytext(), "Operador de acesso"); token.imprimir(); }

{ID}          { token = new Token(yyline, yycolumn, yytext(), "Identificador"); token.imprimir(); }
{NUM}         { token = new Token(yyline, yycolumn, yytext(), "Número"); token.imprimir(); }
{BRANCO}      { token = new Token(yyline, yycolumn, yytext(), "Espaço em branco"); token.imprimir(); }

.             { token = new Token(yyline, yycolumn, yytext(), "Caractere inválido"); token.dispararExcecao(); }
