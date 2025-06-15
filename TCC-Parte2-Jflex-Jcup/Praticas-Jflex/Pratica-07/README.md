# 07-jflex

## Instalação:
(caso necessario)

`sudo apt update`

`sudo apt install jflex` Escrever um -y depois de install, faz aceitação automatica

## Execução:

`cd TCC-Parte2-Jflex-Jcup/Praticas-Jflex/Pratica-07` *Recomendado, pode ser necessario/evitar ter que atribuir muitos paths a cada comando

`jflex exemplo.flex` 

`javac Scanner.java`

`java Scanner p7022487.html`

## Jogando a saída num arquivo:

`java Scanner p7022487.html > saida.txt`

Saida esperada para saida.txt/terminal: 

Título (linha: 3, coluna: 36): United States Patent: 7022487

Número da patente (linha: 40, coluna: 110): 7,022,487

Resumo (Abstract) (linha: 54, coluna: 217): Compositions and methods for regulating CD154 gene expression are provided that rely on the interaction of polypyrimidine tract proteins with the 3'-untranslated region of CD154.

Data de publicação (linha: 89, coluna: 118): July 31, 2003

Reivindicação 1 (linha: 130, coluna: 518): A method for identifying agents that modulate the level or activity of a polypyrimidine tract protein comprising contacting a test cell, which contains a polypyrimidine tract protein and a cis-acting element of a CD154 3'-untranslated region operatively-linked to a nucleic acid sequence encoding a reporter, with an agent and detecting the expression of a product of the nucleic acid sequence encoding the reporter in the test cell.

Reivindicação 2 (linha: 131, coluna: 526): The method of claim 1, wherein a decrease in the expression of a product of the nucleic acid sequence encoding the reporter, in the test cell contacted with the agent relative to the expression of the product of the nucleic acid sequence encoding the reporter in a test cell not contacted with the agent, indicates that the agent causes a decrease in the level or activity of polypyrimidine tract protein of SEQ ID NO:2 or an increase in the level or activity of polypyrimidine tract protein isoform of SEQ ID NO:1.

Reivindicação 3 (linha: 132, coluna: 526): The method of claim 1, wherein an increase in the expression of a product of the nucleic acid sequence encoding the reporter in the test cell contacted with the agent relative to the expression of the product of the nucleic acid sequence encoding the reporter in a test cell not contacted with the agent, indicates that the agent causes an increase in the level or activity of polypyrimidine tract protein of SEQ ID NO:2 or a decrease in the level or activity of polypyrimidine tract protein isoform of SEQ ID NO:1.


