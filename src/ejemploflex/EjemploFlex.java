package ejemploflex;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

/**
 *
 * @author Eugenia
 */
public class EjemploFlex {

    public static void main(String[] args) throws IOException {
        try {
            FileReader f = new FileReader("prueba.txt");
            Lexico Lexer = new Lexico(f);
            Lexer.next_token();
        } catch (FileNotFoundException ex) {
            System.out.println("No se encontró el archivo");
        }
        
    }
    
}
