#!/bin/bash

cd TCC-Parte2-Jflex-Jcup/Praticas-Jcup/Pratica-09/

# Remover arquivos:
rm -rf *.class *.java~
rm -rf jcup.jar AnalisadorSintatico.java sym.java 
rm -rf jflex.jar AnalisadorLexico.java   


# Gerar o Analisador Léxico:
java -cp ../../jflex.jar:../../jcup.jar jflex.Main exemplo.flex

# Gerar o Analisador Sintático:
java -cp ../../jcup.jar java_cup.Main -parser AnalisadorSintatico exemplo.cup

# Compilar as classes .java:
javac -cp ../../jcup.jar *.java

# Executar a classe principal:
echo "Digite uma expressão:"
echo "Exemplos:"
echo "(10 + 5) - 2; -> 13"
echo "10 + (5 - 2); -> 13"
echo "10 + 5 - 2;   -> 13"
echo "10 - (5 + 2); ->  3"
echo "10 - 5 + 2;   ->  7"
java -cp .:../../jcup.jar Main
