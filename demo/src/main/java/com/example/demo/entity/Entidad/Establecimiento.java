package com.example.demo.entity.Entidad;

import com.example.demo.entity.Authentication.User;
import com.example.demo.entity.Servicios.Servicio;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "establecimientos")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Establecimiento implements Interes {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String nombre;

    @OneToOne
    @JoinColumn(name = "ubicacion_id")
    private Ubicacion ubicacion;


    @OneToMany(mappedBy = "establecimiento", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Servicio> servicios;
    @OneToMany
    List<User> interesados = new ArrayList<>();



    @Override
    public List<User> getInteresados() {
        return interesados;
    }
}
