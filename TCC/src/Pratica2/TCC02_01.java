package Pratica2;
import java.util.Scanner;

public class TCC02_01 {

	public static void main(String[] args) {
	Scanner input = new Scanner(System.in);
   //autômato finito deterministico aonde qualquer entrada de 'a' e 'b' a partir de qualquer estado leva ao mesmo resultado.
	  System.out.println("Considerando um AFD que so aceita 'a' ou 'b' a partir de qualquer estado informe uma palavra: ");
      String stringInformada;
      stringInformada = input.nextLine();
      /* .matches("[?]") verifica se a string é igual ao conteúdo no modulo em "[]"
      caso se adicione um +, verifica-se multiplos caraceteres sem vazio
      caso se adicione um *, verifica-se multiplos caracteres incluindo vazios*/
      if (stringInformada.matches("[ab]+")) {
    	  System.out.println("Estado final da palavra informada aceita.");
      } else {
    	  System.out.println("Estado final da palavra informada rejeitada.");
      }
	}

}
