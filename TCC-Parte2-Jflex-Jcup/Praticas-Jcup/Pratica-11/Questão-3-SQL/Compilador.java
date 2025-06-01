import java.io.*;

public class Compilador {
    public void compilar(String caminhoDoArquivoDeEntrada) throws Exception {
        FileReader fileReader = null;
        BufferedReader bufferedReader = null;

        try {
            fileReader = new java.io.FileReader(caminhoDoArquivoDeEntrada);
            bufferedReader = new BufferedReader(fileReader);

            /* Estrutura de repetição alterada:
             * Foi adicionado a classe StringBuilder e instanciado o objeto da mesma
             * StringBuilder permite acumular texto linha por linha ao inves de processar uma linha de cada vez
             * (Necessario devido a estrutura do JSON que consome varias linhas para um mesmo objeto/expressão)
             */
            StringBuilder conteudo = new StringBuilder();
            String linha;
            while ((linha = bufferedReader.readLine()) != null) {
                conteudo.append(linha).append("\n"); //append() é um metodo da classe StringBuilder/Buffer que acrescenta algum valor a uma sequência atual
            }
            // Para cada linha do entrada.txt lida, a adicionamos ao objeto string builder instanciado 'conteudo' usando append(linha).append("\n")
            // Assim, no final do loop, temos o conteúdo inteiro do arquivo entrada.txt em uma única String à ser avaliada pelo compilador

            System.out.println("> " + conteudo.toString());
            processar(conteudo.toString()); // Agora so chamamos o metodo processar uma vez, apos construção de toda a String JSON

        } catch (IOException e) {
            System.err.println("Erro ao ler arquivo de entrada: " + e.getMessage());
        } finally {
            if (bufferedReader != null)
                bufferedReader.close();
            if (fileReader != null)
                fileReader.close();
        }
    }

    public void processar(String conteudo) {
        StringReader stringReader = new StringReader(conteudo);

        MeuParser meuParser = new MeuParser(new MeuScanner(stringReader));

        try {
            meuParser.parse();
            System.out.println("SQL válido!"); //Adicionado comentario caso entrada seja valida
        } catch (Exception e) {
            System.err.println("Erro na expressão: " + e.getMessage());
        } finally {
            stringReader.close();
        }
    }
}

/* Mesmo conteúdo da main dentro da parser usado pelo JSON */