package Pratica1;
import java.util.Scanner;
public class TCC01_02 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        while (true) {
            System.out.println("Informe uma string: ");
            String stringInformada = input.nextLine();

            /* 'StringBuilder' permite manipulaçar strings sem criar novos objetos a cada modificação
            diferente de 'String' que cria uma nova string na memoria a cada modificação
            melhorando a performance e disponibilizando novos metodos para manipulação de texto*/
            String stringInvertida = new StringBuilder(stringInformada).reverse().toString();
            /* Criou-se uma nova string a partir da string original e a inverteu 'reverse()'
             'toString()' retorna o valor à 'stringInvertida' */
           
            if (stringInformada.equalsIgnoreCase(stringInvertida)) {
            	//compara as duas strings, ignorando maiúsculas e minusculas
                System.out.println("A string é um palíndromo!");
            } else {
                System.out.println("A string NÃO é um palíndromo.");
            }

            System.out.println("Deseja executar o programa novamente? 1 - Sim 2 - Não");
            int resposta = input.nextInt();
            input.nextLine(); // Consume proxima linha preenchida por /n por conta do next int

            if (resposta == 2) {
                break;
            }
        }

        input.close(); 
    }
}
