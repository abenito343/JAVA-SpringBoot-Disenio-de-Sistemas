package com.example.demo.entity.Comunidad.Incidente;

import com.example.demo.dto.ComunidadDto.IncidenteDto.IncidenteDto;
import com.example.demo.entity.Comunidad.Comunidad;
import com.example.demo.entity.Servicios.Servicio;
import com.example.demo.entity.Tipos.TipoIncidente;
import com.example.demo.entity.Tipos.TipoMiembro;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;
import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@Entity
@ToString
@Table(name="incidentes")
public class Incidente {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @OneToOne
    @JoinColumn(name = "servicio")
    Servicio servicioAfectado;
    @Column(nullable = false)
    String observaciones;
    @Column
    String solucion;
    @OneToOne
    @JoinColumn(name = "tipo_incidente")
    TipoIncidente tipoIncidente;
    @Column(nullable=false)
    Date horaDeApertura;
    @Column
    Date horaDeCierre;
    @ManyToOne
    @JoinColumn(name="comunidad_id", nullable=false)
    private Comunidad comunidad;

    public Incidente(){
        horaDeApertura =  new Date();
    }
    public void cerrarIncidente(){
        horaDeCierre = new Date();
    }

    public boolean estaCerrado(){
        return horaDeCierre!= null;
    }

}
