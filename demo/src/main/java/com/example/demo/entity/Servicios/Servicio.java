package com.example.demo.entity.Servicios;


import com.example.demo.entity.Entidad.Establecimiento;
import com.example.demo.entity.Tipos.TipoServicio;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="servicios")
public  class Servicio {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(nullable=false)
    private String nombre;
    @Column(nullable=false)
    private Boolean esHabitual;
    @OneToOne
    @JoinColumn(name = "tipo_servicio")
    private TipoServicio tipoServicio;
    @ManyToOne
    @JoinColumn(name="establecimiento_id", nullable=false)
    private Establecimiento establecimiento;

    public Servicio(Long idServicioAfectado) {
        id = idServicioAfectado;
    }
}
