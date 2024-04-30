package com.example.demo.entity.Tipos;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "tipos_entidad")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TipoEntidad {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String nombre;
}
