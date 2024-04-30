package com.example.demo.service;


import com.example.demo.dto.ComunidadDto.MiembroDto;
import com.example.demo.entity.Comunidad.Miembro;

import java.util.List;

public interface MiembroService {
    void saveMiembro(MiembroDto miembroDto);

    Miembro findByUserId(Long id);

    List<MiembroDto> findAllMiembros();

    Miembro findByEmail(String email);
}