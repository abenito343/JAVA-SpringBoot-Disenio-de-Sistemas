package com.example.demo.dto.ComunidadDto;

import com.example.demo.dto.tipoDto.TipoMiembroDto;
import com.example.demo.entity.Authentication.User;
import com.example.demo.entity.Comunidad.Comunidad;
import com.example.demo.entity.Comunidad.Miembro;
import com.example.demo.entity.Tipos.TipoMiembro;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MiembroDto
{

    private Long id;
    @NotEmpty(message = "User should not be empty")
    private Long userId;
    @NotEmpty(message = "TipoMiembro should not be empty")
    private TipoMiembroDto tipoMiembroDto;
    // TODO: agregar comunidades
    public Miembro toPersist( User user ){
        return new Miembro(this.getId(), user,new Comunidad(), new TipoMiembro(this.getTipoMiembroDto().getId(),this.getTipoMiembroDto().getNombre()) );
    }

}