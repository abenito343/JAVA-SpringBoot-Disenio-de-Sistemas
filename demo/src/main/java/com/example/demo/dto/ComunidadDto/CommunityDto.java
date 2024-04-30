package com.example.demo.dto.ComunidadDto;

import com.example.demo.dto.ComunidadDto.IncidenteDto.IncidenteDto;

import java.util.ArrayList;
import java.util.List;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CommunityDto
{
    private Long id;
    private List<MiembroDto> miembros = new ArrayList<>();
    @NotEmpty(message = "Nombre should not be empty")
    private String nombre;
    private List<IncidenteDto> incidente = new ArrayList<>();
    private boolean esMiembro = false;

    public CommunityDto(long id) {
        this.id = id;
    }
}