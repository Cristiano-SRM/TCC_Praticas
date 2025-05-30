package Pratica3;
import java.util.Scanner;

public class TCC03_01 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.println("Dado um autômato que aceita 'a' ou 'b', digite uma palavra: ");

        String estadoAtual = "q0"; 
        String palavra = "";

        // Primeiro loop, a palavra oscila entre estado q0 e s3 no autômato finito não deterministico
        do {
            System.out.println("Digite uma letra ('a' ou 'b'): ");
            String entrada = input.nextLine();
            
            palavra += entrada;

            if (!entrada.matches("[ab]")) { // Se a entrada não for 'a' ou 'b', rejeita
                System.out.println("Palavra rejeitada, não condiz com as regras do autômato: " + palavra);
                System.exit(0);
            }

            if (estadoAtual.equals("q0")) { //caso 'a' seja digitado, move-se para s3
                if (entrada.equals("a")) {
                    estadoAtual = "s3"; 
                } 
            } else if (estadoAtual.equals("s3")) { // caso 'a' seja digitado novamente "aa" sai de s3 e move-se para s6
                if (entrada.equals("a")) {
                    estadoAtual = "s6";
                    break; // sai do primeiro loop, pois atingiu s6
                } else {
                    estadoAtual = "q0"; // caso o programa não tenha encerrado e nem 'a' for escrito, significa que 'b' foi escrito, o loop de q0 continua
                }
            }

            System.out.println("Estado atual: " + estadoAtual);
        } while(true);

        System.out.println("Palavra atual no estado s6: " + palavra);
        System.out.println("Estados s6 e s4 são de aceitação.");

        // Segundo loop entre s4 e s6, estados conclusivos aonde o usuario pode terminar sua palavra a qualquer momento
        do {
            System.out.println("Digite uma letra ('a' ou 'b'): ");
            String entrada = input.nextLine();
            
            palavra += entrada;

            if (!entrada.matches("[ab]")) {  // Se a entrada não for 'a' ou 'b', rejeita
                System.out.println("Palavra rejeitada, não condiz com as regras do autômato: " + palavra);
                System.exit(0);
            }

            //se for 'b' move para s4, se for 'a' continua em s6
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
            System.out.println("Deseja continuar? (s - sim, n - não): "); //pergunta se o usuario quer terminar a palavra a cada iteração
            String condicao = input.nextLine();

            if (condicao.equalsIgnoreCase("n")) {
                break;
            }
        } while(true);

        System.out.println("Palavra final aceita: " + palavra); // fim, caso a palavra tenha sido aceita e o programa não tenha se terminado anteriormente
        System.out.println("Palavra concluída em: " + estadoAtual);
        input.close();
    }
}
