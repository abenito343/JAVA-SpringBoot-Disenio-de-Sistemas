package com.example.demo.dto.EntidadDto;

import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class LocalizacionDto
{
    @NotEmpty
    private Long id;

    @NotEmpty
    private String nombre;

}