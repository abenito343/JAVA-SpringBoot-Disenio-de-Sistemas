package com.example.demo.dto.ComunidadDto.IncidenteDto;


import com.example.demo.dto.ComunidadDto.CommunityDto;
import com.example.demo.dto.ServiciosDto.ServicioDto;
import com.example.demo.dto.tipoDto.TipoIncidenteDto;
import com.example.demo.entity.Comunidad.Comunidad;
import com.example.demo.entity.Comunidad.Incidente.Incidente;
import com.example.demo.entity.Servicios.Servicio;
import com.example.demo.entity.Tipos.TipoIncidente;

import jakarta.validation.constraints.PositiveOrZero;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class IncidenteDto
{

    private Long id;
    ServicioDto servicioDto;

    String observaciones;
    TipoIncidenteDto tipoIncidenteDto;
    CommunityDto comunidadDto;

    Date horaDeApertura;
    Date horaDeCierre;
    public Incidente toPersist(){
        Incidente incidente = new Incidente();
        incidente.setObservaciones(observaciones);
        incidente.setTipoIncidente(new TipoIncidente(this.tipoIncidenteDto.getId()));
        incidente.setComunidad(new Comunidad(this.comunidadDto.getId()));
        incidente.setServicioAfectado(new Servicio(this.servicioDto.getId()));
        return incidente;

    }
}