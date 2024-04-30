package com.example.demo.entity.Tipos;

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
@Table(name="tipo_miembros")
public class TipoMiembro {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable=false)
    private String name;

    public static final TipoMiembro MIEMBRO_COMUN = new TipoMiembro(1L, "usuario");
    public static final TipoMiembro MIEMBRO_ADMIN= new TipoMiembro(2L, "admin");

}
