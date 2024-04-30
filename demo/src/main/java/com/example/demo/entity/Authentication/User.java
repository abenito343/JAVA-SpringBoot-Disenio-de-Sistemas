package com.example.demo.entity.Authentication;

import com.example.demo.entity.Comunidad.Miembro;
import com.example.demo.entity.Entidad.Establecimiento;
import com.example.demo.entity.Entidad.Ubicacion;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.security.core.GrantedAuthority;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@SqlResultSetMapping(
        name = "UserIdAndNameMapping",
        classes = {
                @ConstructorResult(
                        targetClass = User.class,
                        columns = {
                                @ColumnResult(name = "id", type = Long.class),
                                @ColumnResult(name = "name", type = String.class),
                                @ColumnResult(name = "email", type = String.class),
                                @ColumnResult(name = "numero", type = String.class)
                        }
                )
        }
)
@Entity
@ToString
@Table(name="users")
public class User
{
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable=false)
    private String name;

    @Column(nullable=false, unique=true)
    private String email;

    @Column(nullable=false)
    private String numero;


    @Column(nullable=false)
    private String password;

    @OneToMany(mappedBy="user")
    private Set<Miembro> membresias;


    @ManyToMany(fetch = FetchType.EAGER, cascade=CascadeType.ALL)
    @JoinTable(
            name="users_roles",
            joinColumns={@JoinColumn(name="USER_ID", referencedColumnName="ID")},
            inverseJoinColumns={@JoinColumn(name="ROLE_ID", referencedColumnName="ID")})
    private List<Role> roles = new ArrayList<>();


    public User(String email, String password, Collection<? extends GrantedAuthority> grantedAuthorities) {
        this.email = email;
        this.password = password;

    }

    @ManyToOne
    @JoinColumn(name = "ubicacion_id")
    private Ubicacion ubicacion = null;
    @ManyToOne
    @JoinColumn(name = "establecimiento_interes")
    private Establecimiento establecimiento = null;




}