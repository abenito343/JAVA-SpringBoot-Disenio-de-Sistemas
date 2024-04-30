package com.example.demo.entity.Entidad;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "estado_entidad")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class EstadoEntidad {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String nombre;
}

