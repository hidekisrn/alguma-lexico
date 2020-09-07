package br.ufscar.dc.compiladores.alguma.lexico;

import java.io.IOException;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.misc.ParseCancellationException;

public class Principal {

    public static void main(String[] args) {
        try {
            // args[0] é o primeiro argumento da linha de comando
            CharStream cs = CharStreams.fromFileName(args[0]);
            AlgumaLexer lex = new AlgumaLexer(cs);
            Token t = null;
           System.out.println(); 
            while ((t = lex.nextToken()).getType() != Token.EOF) {
                System.out.println("<" + "'" + t.getText() + "'" + "," + AlgumaLexer.VOCABULARY.getDisplayName(t.getType()) + ">");
            }
        } catch (IOException ex) {
            
        }catch (ParseCancellationException ex){
            System.out.println(ex.getMessage());
        }

    }
}