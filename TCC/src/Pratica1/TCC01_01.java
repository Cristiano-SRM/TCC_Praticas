package Pratica1;
import java.util.Scanner;
public class TCC01_01 {

	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);

		while (true) {
		System.out.println("Informe uma string.");
		String stringInformada;
	    stringInformada = input.nextLine();
	    
	    int meio = stringInformada.length() / 2;
        String prefixo = stringInformada.substring(0, meio); 
        String sufixo = stringInformada.substring(meio); 
         // Logica da 'substring' (inicio, fim) prefixo pega do inicio (posição 0) ate o meio da string
         //  sufixo pega do meio (determinado pela divisão por 2) ate o fim
        
        System.out.println("Prefixo: " + prefixo);
        System.out.println("Sufixo: " + sufixo);
        // Imprime prefixo e sufixo respectivamente e pergunta caso queira que o programa se repita
	    
	    System.out.println("Deseja executar o programa novamente? 1 - Sim 2 - Não");
	    int resposta = 0;
	    resposta = input.nextInt();
	    input.nextLine(); // Consume proxima linha preenchida por /n por conta do next int
	    if(resposta == 2) {
	    	System.out.println("Programa terminado.");
	    	break;
	    }
		}
}
}