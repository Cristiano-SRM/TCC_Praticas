import java.io.*;

public class Main {

  public static void main(String[] args) throws Exception {
    BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
    System.out.println("Digite expressões (termine com ';') e pressione ENTER. Ctrl+C para sair.");

    while (true) {
      System.out.print("> ");
      String linha = reader.readLine();

      if (linha == null || linha.trim().isEmpty()) continue;

      // Adicionar um \n no final para garantir que o analisador leia a linha completa:
      StringReader sr = new StringReader(linha + "\n");

      parser p = new parser(new Yylex(sr));
      try {
        p.parse();
      } catch (Exception e) {
        System.err.println("Erro na expressão: " + e.getMessage());
      }
    }
  }

  //  Método de exponenciação 
  public static int intPow(int a, int b) { // 'a' é base 'b' é exponente
    int result = 1;
    for (int i = 0; i < b; i++) { // se repete X vezes conforme o tamanho do expoente
        result *= a; // multiplica a base por ela mesmo como uma potencia
        /*ex: 5^3 ->
        1 iteração: result(1) = result * base = 1 * 5 = 5(novo result)
        2 iteração: result(5) = result * base = 5 * 5 = 25(novo result)
        3 iteração: result(25) = result * base = 25*5 = 125(novo result e fim da potencia, retorna valor ao jcup chamando este metodo
        */
    }
    return result;
}
}
