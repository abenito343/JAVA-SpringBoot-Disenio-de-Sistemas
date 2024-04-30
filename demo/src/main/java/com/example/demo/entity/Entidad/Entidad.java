package com.example.demo.entity.Entidad;

import com.example.demo.entity.Servicios.Servicio;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Entity
@Table(name = "entidades")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Entidad {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;

        @Column(nullable = false)
        private String nombre;
        @OneToOne
        @JoinColumn(name = "ubicacion_id")
        private Ubicacion ubicacion;

        // Otros métodos si es necesario

}
