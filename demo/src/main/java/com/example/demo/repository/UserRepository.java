package com.example.demo.repository;

import com.example.demo.entity.Authentication.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {

    User findByEmail(String email);

    @Query(nativeQuery = true,value = "SELECT u.* FROM login_system.servicios s join login_system.establecimientos_interesados ei on s.establecimiento_id = ei.establecimiento_id join login_system.users u on u.id = ei.interesados_id where s.id = :id and u.id in :usuarios")
    List<User> findWithInteres(@Param("id") long id,@Param("usuarios") List<Long> usuariosId );

}
