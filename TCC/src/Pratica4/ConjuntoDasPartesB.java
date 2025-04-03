package Pratica4;
import java.util.ArrayList;
import java.util.List;

public class ConjuntoDasPartesB {
    public List<List<Integer>> conjuntoDasPartes(int[] conjunto) {
        List<List<Integer>> partes = new ArrayList<>();
        int totalSubconjuntos = (int) Math.pow(2, conjunto.length);

        for (int i = 0; i < totalSubconjuntos; i++) {
            List<Integer> subconjunto = new ArrayList<>();
            for (int j = 0; j < conjunto.length; j++) {
                if ((i & (1 << j)) != 0) { // Verifica se o bit correspondente está ativo
                    subconjunto.add(conjunto[j]);
                }
            }
            partes.add(subconjunto);
        }

        return partes;
    }
}
