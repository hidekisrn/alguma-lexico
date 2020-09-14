package br.ufscar.dc.compiladores.alguma.lexico;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.misc.ParseCancellationException;

public class Principal {

    public static void main(String[] args) throws FileNotFoundException {
        // Preparação do arquivo de saída, args[1] é o caminho do arquivo de saída
        PrintStream out = new PrintStream(new FileOutputStream(args[1])); 
        System.setOut(out);
        try {
            // args[0] é o primeiro argumento da linha de comando referente ao arquivo de entrada
            CharStream cs = CharStreams.fromFileName(args[0]);
            // Cria uma instância do interpretador para a linguagem LA
            AlgumaLexer lex = new AlgumaLexer(cs);
            Token t = null;
            while ((t = lex.nextToken()).getType() != Token.EOF) {
                // Tratamento do formato de saída
                System.out.println("<" + "'" + t.getText() + "'" + "," + AlgumaLexer.VOCABULARY.getDisplayName(t.getType()) + ">");
            }
        } catch (IOException ex) {
            
        }catch (ParseCancellationException ex){
            // Tratamento de erros
            System.out.println(ex.getMessage());
        }

    }
}