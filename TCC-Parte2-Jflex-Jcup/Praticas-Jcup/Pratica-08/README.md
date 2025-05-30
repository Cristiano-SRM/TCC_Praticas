# 03-jcup

1. Baixar o `JFlex`:
- `wget https://repo1.maven.org/maven2/de/jflex/jflex/1.8.2/jflex-1.8.2.jar -O jflex.jar`

2. Baixa o `JCup`:
- `wget https://repo1.maven.org/maven2/com/github/vbmacher/java-cup/11b-20160615/java-cup-11b-20160615.jar -O jcup.jar`

3. Comando para o JFlex:
- `java -cp jflex.jar:jcup.jar jflex.Main exemplo.flex`
- `java -cp TCC-Parte2-Jflex-Jcup/Praticas-Jcup/Pratica-08/jflex.jar:TCC-Parte2-Jflex-Jcup/Praticas-Jcup/Pratica-08/jcup.jar jflex.Main TCC-Parte2-Jflex-Jcup/Praticas-Jcup/Pratica-08/exemplo.flex`
(^ comando corrigo para este repo em especifico)

4. Comando para o JCup:
- `java -cp jcup.jar java_cup.Main exemplo.cup`
- `java -cp TCC-Parte2-Jflex-Jcup/Praticas-Jcup/Pratica-08/jcup.jar java_cup.Main TCC-Parte2-Jflex-Jcup/Praticas-Jcup/Pratica-08/exemplo.cup`
(^ comando corrigo para este repo em especifico)

5. Comandos para compilar as classes .java:
- `cd TCC-Parte2-Jflex-Jcup/Praticas-Jcup/Pratica-08/` (muda o repositorio em especifico no terminal para os comandos abaixo funcionarem)
- `java -cp .:jcup.jar Main`

6. Rodar a classe principal:
- `java -cp .:jcup.jar Main` 

7. Informe expressões matemáticas do tipo: 
- `1 + 2 - 7;` (é necessário terminar com ";")

- ```
  1 + 2
  - 7;
  ```
  (é necessário terminar com ";")

8. Excluir arquivos desnecessários: 
- `rm -rf *.class parser.java sym.java Yylex.java *.java~`