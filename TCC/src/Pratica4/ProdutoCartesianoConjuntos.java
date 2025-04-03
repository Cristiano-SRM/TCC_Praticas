package Pratica4;
import java.util.ArrayList;
import java.util.List;

public class ProdutoCartesianoConjuntos {
    public String[] produtoCartesianoConjuntos(int[] vetor1, int[] vetor2) {
        List<String> pares = new ArrayList<>();

        for (int numA : vetor1) {
            for (int numB : vetor2) {
                pares.add("(" + numA + ", " + numB + ")");
            }
        }

        return pares.toArray(new String[0]);
    }
}
