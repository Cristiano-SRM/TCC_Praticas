package Pratica4;
import java.util.ArrayList;
import java.util.List;

public class IntersecaoConjuntos {
    public int[] intersecao(int[] vetor1, int[] vetor2) {
        List<Integer> listaIntersecao = new ArrayList<>();

        for (int numA : vetor1) {
            for (int numB : vetor2) {
                if (numA == numB && !listaIntersecao.contains(numA)) { // Evita duplicatas
                    listaIntersecao.add(numA);
                    break;
                }
            }
        }

        return listaIntersecao.stream().mapToInt(Integer::intValue).toArray();
    }
}
