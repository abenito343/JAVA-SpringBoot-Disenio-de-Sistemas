package com.example.demo.dto.tipoDto;

import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TipoLocalizacionDto
{
    @NotEmpty
    private Long id;

    @NotEmpty
    private String nombre;

}