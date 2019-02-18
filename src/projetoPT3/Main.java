package projetoPT3;

import java.io.FileReader;
import java.nio.file.Paths;

import java_cup.runtime.Symbol;

public class Main {

    public static void main(String[] args) {
    	
        String rootPath = Paths.get("").toAbsolutePath().toString();
        String subPath = "/Arquivos/";
        String sourcecode = rootPath + subPath + "Teste.txt";

        try {
            Parser p = new Parser(new Lexer(new FileReader(sourcecode)));
            Object result = p.debug_parse().value;
            System.out.println("Compilacao concluida com sucesso...");
            
        } catch (Exception e) {
            e.printStackTrace();
            
        }
    }
}


