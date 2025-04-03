package Pratica4;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

public class TCC04_01 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.println("Digite o tamanho do conjunto A (máx 10): ");
        int tamanhoA = scanner.nextInt();
        if (tamanhoA > 10) {
            System.out.println("Erro: Tamanho do conjunto A inválido. O programa será encerrado.");
            System.exit(1); //indica que o programa finalizou com um erro
        }
        int[] vetor1 = new int[tamanhoA];
        System.out.println("Digite os elementos do conjunto A:");
        for (int i = 0; i < tamanhoA; i++) {
            vetor1[i] = scanner.nextInt();
        }

        System.out.println("Digite o tamanho do conjunto B (máx 10): ");
        int tamanhoB = scanner.nextInt();
        if (tamanhoB > 10) {
            System.out.println("Erro: Tamanho do conjunto B inválido. O programa será encerrado.");
            System.exit(1);
        }
        int[] vetor2 = new int[tamanhoB];
        System.out.println("Digite os elementos do conjunto B:");
        for (int i = 0; i < tamanhoB; i++) {
            vetor2[i] = scanner.nextInt();
        }
        
        int escolha = 0;
        String Mensagem = "O que você deseja ver quanto aos dois conjuntos?" +
            "\n 1- Mostrar o conjunto A." +
            "\n 2- Mostrar o conjunto B." +
            "\n 3- Mostrar a união e cardinalidade dos dois conjuntos." +
            "\n 4- Mostrar a interseção e cardinalidade dos dois conjuntos." +
            "\n 5- Mostrar a diferença e cardinalidade dos dois conjuntos." +
            "\n 6- Mostrar o produto cartesiano e cardinalidade dos dois conjuntos." +
            "\n 7- Mostrar o conjunto das partes de A com sua cardinalidade." +
            "\n 8- Mostrar o conjunto das partes de B com sua cardinalidade.";
        
        System.out.println(Mensagem);
        escolha = scanner.nextInt();

        switch (escolha) {
            case 1:
                System.out.println("Conjunto A: " + Arrays.toString(vetor1));
                System.out.println("Cardinalidade do conjunto A: " + tamanhoA);
                break;
            case 2:
                System.out.println("Conjunto B: " + Arrays.toString(vetor2));
                System.out.println("Cardinalidade do conjunto B: " + tamanhoB);
                break;
            case 3:
                UniaoConjuntos uniaoConjuntos = new UniaoConjuntos();
                int[] resultadoUniao = uniaoConjuntos.uniao(vetor1, vetor2);
                System.out.println("União dos conjuntos: " + Arrays.toString(resultadoUniao));
                System.out.println("Cardinalidade da união: " + resultadoUniao.length);
                break;
            case 4:
                IntersecaoConjuntos intersecaoConjuntos = new IntersecaoConjuntos();
                int[] resultadoIntersecao = intersecaoConjuntos.intersecao(vetor1, vetor2);
                System.out.println("Interseção dos conjuntos: " + Arrays.toString(resultadoIntersecao));
                System.out.println("Cardinalidade da interseção: " + resultadoIntersecao.length);
                break;
            case 5:
                DiferencaConjuntos diferencaConjuntos = new DiferencaConjuntos();
                int[] resultadoDiferencaAB = diferencaConjuntos.diferenca(vetor1, vetor2);
                int[] resultadoDiferencaBA = diferencaConjuntos.diferenca(vetor2, vetor1);
                System.out.println("Diferença (A - B): " + Arrays.toString(resultadoDiferencaAB));
                System.out.println("Cardinalidade de (A - B): " + resultadoDiferencaAB.length);
                System.out.println("Diferença (B - A): " + Arrays.toString(resultadoDiferencaBA));
                System.out.println("Cardinalidade de (B - A): " + resultadoDiferencaBA.length);
                break;
            case 6:
                ProdutoCartesianoConjuntos produtoCartesianoConjuntos = new ProdutoCartesianoConjuntos();
                String[] resultadoProduto = produtoCartesianoConjuntos.produtoCartesianoConjuntos(vetor1, vetor2);
                System.out.println("Produto cartesiano (A × B): " + Arrays.toString(resultadoProduto));
                System.out.println("Cardinalidade do produto cartesiano: " + resultadoProduto.length);
                break;
            case 7:
                ConjuntoDasPartesA conjuntoDasPartesA = new ConjuntoDasPartesA();
                List<List<Integer>> resultadoPartesA = conjuntoDasPartesA.conjuntoDasPartes(vetor1);
                System.out.println("Conjunto das partes de A: " + resultadoPartesA);
                System.out.println("Cardinalidade do conjunto das partes de A: " + resultadoPartesA.size());
                break;
            case 8:
                ConjuntoDasPartesB conjuntoDasPartesB = new ConjuntoDasPartesB();
                List<List<Integer>> resultadoPartesB = conjuntoDasPartesB.conjuntoDasPartes(vetor2);
                System.out.println("Conjunto das partes de B: " + resultadoPartesB);
                System.out.println("Cardinalidade do conjunto das partes de B: " + resultadoPartesB.size());
                break;
            default:
                System.out.println("Opção inválida.");
        }

        scanner.close();
    }
}
