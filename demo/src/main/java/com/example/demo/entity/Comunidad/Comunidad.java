package com.example.demo.entity.Comunidad;


import com.example.demo.entity.Authentication.User;
import com.example.demo.entity.Comunidad.Incidente.Incidente;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="comunidades")
public class Comunidad {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable=false)
    private String name;

    @OneToMany(mappedBy="comunidad", cascade = {CascadeType.ALL},  orphanRemoval = true)
    private Set<Miembro> membresias = new HashSet<>();

    @OneToMany(mappedBy = "comunidad", cascade={CascadeType.ALL})
    List<Incidente> incidente = new ArrayList<>();

    public Comunidad(Long comunidad) {
        this.id = comunidad;
    }

    public List<Incidente> getIncidentes() {
        return incidente;
    }
    public void aregarIncidente(Incidente incidente){
        this.incidente.add(incidente);
    }

   public void agregarUsuario(Miembro usuariosDeComunidad){
        this.membresias.add(usuariosDeComunidad);

      // this.membresias.remove(usuariosDeComunidad);
    }
    public void sacarMiembro(Miembro miembro){
        this.membresias.remove(miembro);

    }

    public Miembro obtenerMiembroPorUsuario(User usuario) {
        return membresias.stream()
                .filter(miembro -> miembro.getUser().equals(usuario))
                .findFirst()
                .orElse(null);
    }

}
