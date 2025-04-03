package Pratica4;
import java.util.ArrayList;
import java.util.List;
// metodo que calcula a diferenca entre os conjuntos
public class DiferencaConjuntos {
    public int[] diferenca(int[] conjunto1, int[] conjunto2) {
        List<Integer> listaDiferenca = new ArrayList<>();
// calcula A - B (os elementos em A que não tem em B) ou B - A (os elementos em B que não tem em A) dependendo de qual conjunto for informado em sua respectiva ordem

      //percorre todo elemento do primeiro conjunto
        for (int num1 : conjunto1) {
            boolean encontrado = false; //indica se o elemento ja foi encontrado no segundo conjunto
            // percorre o segundo conjunto à cada iteração com o primeiro conjunto
            for (int num2 : conjunto2) {
                if (num1 == num2) {
                    encontrado = true;
                    break; // interrompe pois ja sabemos que o numero esta no conjunto 2
                }
            }
            // se o numero nao foi encontrado no conjunto 2 adicionamos a lista de diferenca
            if (!encontrado) {
                listaDiferenca.add(num1);
            }
        }
        // converte a lista de integer para array e retorna o resultado
        return listaDiferenca.stream().mapToInt(Integer::intValue).toArray();
    }
}


