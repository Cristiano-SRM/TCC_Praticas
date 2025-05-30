# 03-jcup

cd TCC-Parte2-Jflex-Jcup/Praticas-Jcup/Pratica-08/ (muda o repositorio em especifico no terminal para os comandos abaixo funcionarem)

1. Comando para o JFlex (gera analisador lexico):
- `java -cp jflex.jar:jcup.jar jflex.Main exemplo.flex` ( old )
- `java -cp ../../jflex.jar:../../jcup.jar jflex.Main exemplo.flex` ( comando corrigo para este repo em especifico)

2. Comando para o JCup (gera analisador semantico):
- `java -cp jcup.jar java_cup.Main exemplo.cup` ( old )
- `java -cp ../../jcup.jar java_cup.Main exemplo.cup` ( comando corrigo para este repo em especifico)

3. Comandos para compilar as classes .java:
- `javac -cp .:../../jcup.jar *.java`

4. Rodar a classe principal:
- `java -cp .:../../jcup.jar Main` 