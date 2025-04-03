package Pratica4;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
public class UniaoConjuntos {
	 public int[] uniao(int[] vetor1, int[] vetor2) {
	        List<Integer> lista = new ArrayList<>();
	        
	        for (int num : vetor1) {
	            lista.add(num);
	        }
	        
	        for (int num : vetor2) {
	            lista.add(num);
	        }
	        
	        return lista.stream().mapToInt(Integer::intValue).toArray();
	    }
}
