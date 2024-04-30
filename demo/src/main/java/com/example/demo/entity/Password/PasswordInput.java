package com.example.demo.entity.Password;

import lombok.Getter;

import java.time.LocalDate;
import java.util.Date;

public class PasswordInput {
    public void setPassword(String password){
        this.password= password;
    }
    @Getter
    public String password;
    Date ultimoIntentoFallido;
    Integer cantidadDeIntentos;

    Date calcularSiguienteIntento(){
        return null;
    }

}
