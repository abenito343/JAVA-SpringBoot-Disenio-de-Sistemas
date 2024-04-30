package com.example.demo.repository;


import com.example.demo.entity.Comunidad.Miembro;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<Miembro, Long> {



}
