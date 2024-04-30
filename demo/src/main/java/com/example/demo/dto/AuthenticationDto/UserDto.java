package com.example.demo.dto.AuthenticationDto;

import com.example.demo.dto.ComunidadDto.MiembroDto;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UserDto
{
    private Long id;
    @NotEmpty
    private String firstName;
    @NotEmpty
    private String lastName;
    @NotEmpty(message = "Email should not be empty")
    @Email
    private String email;
    @NotEmpty(message = "Password should not be empty")
    private String password;
    @NotEmpty(message = "Phone number field should not be empty")
    private String numero;
    private List<MiembroDto> membresias = new ArrayList<>();


}