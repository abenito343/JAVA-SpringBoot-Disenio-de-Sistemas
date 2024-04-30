package com.example.demo.entity.Comunidad;

import com.example.demo.entity.Tipos.TipoMiembro;
import com.example.demo.entity.Authentication.User;
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
@Table(name="miembros")
public class Miembro {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name="user_id", nullable=false)
    private User user;
    @ManyToOne
    @JoinColumn(name="comunidad_id", nullable=false)
    private Comunidad comunidad;

    @OneToOne
    @JoinColumn(name = "TIPO_MIEMBRO")
    TipoMiembro tipoMiembro;

    public Miembro(User user, Comunidad comunidad, TipoMiembro tipoMiembro) {
        this.user = user;
        this.comunidad = comunidad;
        this.tipoMiembro = tipoMiembro;
    }
}
