package com.example.demo.entity.Password;


import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ValidPasswordManager {

    Set<IPasswordValidator> passwordValidators = new HashSet<>();
    public ValidPasswordManager(){

    }

    public void setPasswordValidation(IPasswordValidator passwordValidation) {
        this.passwordValidators.add(passwordValidation);
    }
    public boolean isValid(String password){
        return passwordValidators.stream().allMatch(validator-> {
            try {
                return validator.isValid(password);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        });
    }
    void addOwasp(){
        this.setPasswordValidation(new OwaspPasswordValidator());
    }
    void addRegex(){
        this.setPasswordValidation(new RegexPasswordValidator());;
    }
    void addDefault(){
        this.setPasswordValidation(new DefaultPasswordValidator());
    }
    public boolean executeAlValidation(String password){
        addDefault();
        addRegex();
        addOwasp();
        return isValid(password);
    }
}