# 07-jcup

(muda repositorio no terminal)
cd TCC-Parte2-Jflex-Jcup/Praticas-Jcup/Pratica-11/Questão-3-SQL

Self notes:
usar /* */ ao inves de // evita bugs no cup e flex 
melhorar e adicionar mais comandos sql 

1. Dar permissão de execução para o arquivo de script `executar.sh` (torná-lo executável):
- `chmod +x executar.sh`

2. Executar o `executar.sh`:
- `./executar.sh`

exemplos SQL testes possiveis para o entrada.txt: (SELECT, FROM e WHERE precisam estar maiusculos)

SELECT a, b, c
FROM tab1, tab2, tab3
WHERE tab1.id = tab2.id,
      tab2.id = tab3.id;

SELECT col1, col2, col3
FROM tabela1, tabela2
WHERE tabela1.id = tabela2.id, tabela2.status = ativo;

SELECT a
FROM tab1, tab2
WHERE tab1.5 = tab2.id, tab1_status = tab2_29;


