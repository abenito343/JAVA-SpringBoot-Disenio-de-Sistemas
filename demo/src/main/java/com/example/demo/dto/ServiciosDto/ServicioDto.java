package com.example.demo.dto.ServiciosDto;

import com.example.demo.dto.tipoDto.TipoServicioDto;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ServicioDto
{
    private Long id;
    @NotEmpty
    private String nombre;
    @NotEmpty
    private Boolean esHabitual;
    @NotEmpty
    private TipoServicioDto tipoServicio;

    public ServicioDto(Long id) {
        this.id = id;
    }
}