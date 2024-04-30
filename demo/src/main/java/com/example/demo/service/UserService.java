package com.example.demo.service;


import com.example.demo.dto.AuthenticationDto.UserDto;
import com.example.demo.entity.Authentication.User;

import java.util.List;

public interface UserService {
    void saveUser(UserDto userDto);
    User update(UserDto userDto);

    UserDto findUserByEmail(String email);

    List<UserDto> findAllUsers();

    User findByEmail(String email);
    User findById(Long id);
    public UserDto findUserById(Long id);
    List<UserDto> findByInteres(Long interesesId, List<Long> usersId);
}