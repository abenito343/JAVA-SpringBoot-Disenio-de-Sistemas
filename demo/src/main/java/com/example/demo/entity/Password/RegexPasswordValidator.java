package com.example.demo.entity.Password;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegexPasswordValidator implements IPasswordValidator {
    @Override
    public boolean isValid(String password) {
        Pattern pattern = Pattern.compile("^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!?@#$%]).{8,20}$");
        Matcher matcher = pattern.matcher(password);
        return matcher.matches();
    }
}
