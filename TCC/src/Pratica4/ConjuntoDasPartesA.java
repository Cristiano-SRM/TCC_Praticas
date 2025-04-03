package Pratica4;
import java.util.ArrayList;
import java.util.List;
/* "potencia do conjunto"
 * o conjunto vazio e as propria combinações dentro deste mesmo conjunto 2^n
 */
public class ConjuntoDasPartesA {
    public List<List<Integer>> conjuntoDasPartes(int[] conjunto) {
        List<List<Integer>> partes = new ArrayList<>(); // lista para armazenar todos os sub-conjuntos gerados
        int totalSubconjuntos = (int) Math.pow(2, conjunto.length); // numero total de sub conjuntos

        // itera de 0 a 2^n -1, onde cada numero representa um sub-conjunto unico
        for (int i = 0; i < totalSubconjuntos; i++) {
            List<Integer> subconjunto = new ArrayList<>(); // lista para armazenar o subconjunto atual

            // verifica quais elementos pertecem ao subconjunto usando manipulação de bits
            for (int j = 0; j < conjunto.length; j++) {
                if ((i & (1 << j)) != 0) { // Se o bit j estiver ativado em i, adicionamos conjunto[j]
                    subconjunto.add(conjunto[j]);
                }
            } 
            partes.add(subconjunto); // Adiciona subconjunto gerado a lista principal
        }

        return partes; // retorna a lista contendo todos os subconjuntos
    }
}
