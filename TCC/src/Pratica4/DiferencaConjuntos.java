package Pratica4;
import java.util.ArrayList;
import java.util.List;

public class DiferencaConjuntos {
    public int[] diferenca(int[] conjunto1, int[] conjunto2) {
        List<Integer> listaDiferenca = new ArrayList<>();

        for (int num1 : conjunto1) {
            boolean encontrado = false;
            for (int num2 : conjunto2) {
                if (num1 == num2) {
                    encontrado = true;
                    break;
                }
            }
            if (!encontrado) {
                listaDiferenca.add(num1);
            }
        }

        return listaDiferenca.stream().mapToInt(Integer::intValue).toArray();
    }
}


