package com.example.demo.entity.Password;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class OwaspPasswordValidator implements IPasswordValidator {

    @Override
    public boolean isValid(String password) throws IOException {
        String cadena;
        FileReader f = new FileReader("./src/main/resources/10-million-password-list-top-10000.txt");
        BufferedReader b = new BufferedReader(f);
        while ((cadena = b.readLine()) != null) {
            if (password.equals(cadena)) {
                return false;
            }
        }
        b.close();
        return true;
    }
    /* TODO: Permitir el password input
    @Override
    public boolean isValid(PasswordInput password) throws IOException {
        String cadena ;
        FileReader f = new FileReader("./src/main/resources/10-million-password-list-top-10000.txt");
        BufferedReader b = new BufferedReader(f);
        while((cadena = b.readLine())!=null) {
            if (password.getPassword().equals(cadena)){
                return false;
            }
        }
        b.close();
        return true;
    }
     */
}