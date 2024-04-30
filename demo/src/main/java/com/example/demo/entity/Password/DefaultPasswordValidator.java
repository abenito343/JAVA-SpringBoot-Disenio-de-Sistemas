package com.example.demo.entity.Password;

import java.io.IOException;

public class DefaultPasswordValidator implements IPasswordValidator{
    @Override
    public boolean isValid(String password) {
        return !password.equals("admin") && !password.equals("1234") && !password.equals("root");
    }
}
