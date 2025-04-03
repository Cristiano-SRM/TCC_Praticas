package Pratica4;
import java.util.ArrayList;
import java.util.List;

public class ProdutoCartesianoConjuntos {
    public String[] produtoCartesianoConjuntos(int[] vetor1, int[] vetor2) {
        List<String> pares = new ArrayList<>();
       /*  Método que consegue o produto carteseano dos conjuntos A e B
        um conjunto de pares ordenados que resulta do emparelhamento de todos os elementos de dois conjuntos    */

        //percorre cada elemento no primeiro vetor
        for (int numA : vetor1) {
            //para cada elemento do primeiro vetor, percorre odos elementos do segundo vetor
            for (int numB : vetor2) {
                // adiciona a lista uma string representando o par ordenado (numA, numB)
                pares.add("(" + numA + ", " + numB + ")");

            }
        }
         //converte a lista de pares para um array de strings e retorna o resultado a main que chamou o metodo
        return pares.toArray(new String[0]);
    }
}
