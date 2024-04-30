package com.example.demo.entity.Entidad;

import com.example.demo.entity.Authentication.User;
import com.example.demo.entity.Tipos.TipoLocalizacion;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "ubicaciones")
public class Ubicacion  implements Interes{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Enumerated(EnumType.STRING) // Explicitly specify the JDBC type for the enumeration
    TipoLocalizacion tipo;
    @Column(name = "nombre_ubicacion")
    String nombre;
    @OneToMany(mappedBy="ubicacion")
    List<User> interesados = new ArrayList<>();

    int latitud;

    int longitud;


    public boolean mismaZona(Ubicacion ubicacion){
        return ubicacion.getTipo() == getTipo() && ubicacion.getNombre().equals(getNombre());
    }

    @Override
    public List<User> getInteresados() {
        return null;
    }
}
