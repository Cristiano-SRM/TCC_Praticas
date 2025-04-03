package Pratica4;
import java.util.ArrayList;
import java.util.List;
// metodo responsavel para calcular a intersecao entre os dois conjuntos
public class IntersecaoConjuntos {
    public int[] intersecao(int[] vetor1, int[] vetor2) {
        List<Integer> listaIntersecao = new ArrayList<>(); //lista para armazenar os elementos da intersecao

        //percorre cada elemento do conjunto A
        for (int numA : vetor1) {
            // para cada elemento do conjunto A, percorre cada elemento do conjunto B
            for (int numB : vetor2) {
                // verifica se os elementos são iguais e se ainda nao foi adicionado a lista
                if (numA == numB && !listaIntersecao.contains(numA)) { // Evita duplicatas
                    listaIntersecao.add(numA); //adiciona os elementos a lista de intersecao
                    break; //sai do loop interno pois ja encontrou a correspondência e muda para o proximo valor de A para checar
                }
            }
        }
         // converte a lista de integer para um array de int novamente e retorna o resultado
        return listaIntersecao.stream().mapToInt(Integer::intValue).toArray();
    }
}
