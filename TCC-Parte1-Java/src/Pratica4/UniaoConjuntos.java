package Pratica4;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class UniaoConjuntos {
	 public int[] uniao(int[] vetor1, int[] vetor2) {
	        List<Integer> lista = new ArrayList<>(); // Cria uma lista dinâmica para armazenar os elementos
			//arraylist são "vetores sem limite predeterminado"
	        
	        for (int num : vetor1) {
	            lista.add(num);
				//adiciona todos numeros em vetor1 à lista
	        }
	        
	        for (int num : vetor2) {
	            lista.add(num);
				//adiciona todos numeros em vetor2 à lista
			}
	        // converte cada integer armazenado em 'lista' em int primitivo e novamente em array(vetor)
	        return lista.stream().mapToInt(Integer::intValue).toArray();
			// retorna valor (strings unidas à 'uniao') 
	    }
}
