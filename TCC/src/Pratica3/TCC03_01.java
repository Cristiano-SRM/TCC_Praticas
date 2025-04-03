package Pratica3;
import java.util.Scanner;

public class TCC03_01 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.println("Dado um AFN que aceita 'a' ou 'b', digite uma palavra: ");

        String estadoAtual = "q0"; 
        String palavra = "";

        // Primeiro loop de transições
        while (true) {
            System.out.println("Digite uma letra ('a' ou 'b'): ");
            String entrada = input.nextLine();
            
            palavra += entrada;

            if (!entrada.matches("[ab]")) { // Se a entrada não for 'a' ou 'b', rejeita
                System.out.println("Palavra rejeitada, não condiz com as regras do autômato: " + palavra);
                System.exit(0);
            }

            if (estadoAtual.equals("q0")) {
                if (entrada.equals("a")) {
                    estadoAtual = "s3"; 
                } 
            } else if (estadoAtual.equals("s3")) {
                if (entrada.equals("a")) {
                    estadoAtual = "s6";
                    break; // Sai do primeiro loop, pois atingiu s6
                } else {
                    estadoAtual = "q0"; 
                }
            }

            System.out.println("Estado atual: " + estadoAtual);
        }

        System.out.println("Palavra atual no estado s6: " + palavra);
        System.out.println("Estados s6 e s4 são de aceitação.");

        // Segundo loop de transições a partir de s6
        while (true) {
            System.out.println("Digite uma letra ('a' ou 'b'): ");
            String entrada = input.nextLine();
            
            palavra += entrada;

            if (!entrada.matches("[ab]")) {
                System.out.println("Palavra rejeitada, não condiz com as regras do autômato: " + palavra);
                System.exit(0);
            }


            if (estadoAtual.equals("s6")) {
                if (entrada.equals("b")) {
                    estadoAtual = "s4";
                }
            } else if (estadoAtual.equals("s4")) {
                if (entrada.equals("a")) {
                    estadoAtual = "s6";
                }
            }

            System.out.println("Estado atual: " + estadoAtual);
            System.out.println("Deseja continuar? (s - sim, n - não): ");
            String condicao = input.nextLine();

            if (condicao.equalsIgnoreCase("n")) {
                break;
            }
        }

        System.out.println("Palavra final aceita: " + palavra);
        System.out.println("Palavra concluída em: " + estadoAtual);
        input.close();
    }
}
