#!/bin/bash

# Remover arquivos:
rm -rf *.class *.java~
rm -rf jcup.jar MeuParser.java sym.java 
rm -rf jflex.jar MeuScanner.java   

# Gerar o Analisador Léxico:
java -cp ../../../jflex.jar:../../../jcup.jar jflex.Main exemplo.flex

# Gerar o Analisador Sintático:
java -cp ../../../jcup.jar java_cup.Main -parser MeuParser exemplo.cup

# Compilar as classes .java:
javac -cp ../../../jcup.jar *.java

# Executar a classe principal:
java -cp .:../../../jcup.jar MeuParser ./entrada.txt