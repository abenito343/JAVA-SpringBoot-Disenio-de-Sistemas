package com.example.demo.repository;

import com.example.demo.entity.Comunidad.Comunidad;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CommunityRepository extends JpaRepository<Comunidad, Long> {

    Comunidad findByName(String email);

}