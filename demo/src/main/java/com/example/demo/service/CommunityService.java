package com.example.demo.service;


import com.example.demo.dto.ComunidadDto.CommunityDto;
import com.example.demo.dto.ComunidadDto.IncidenteDto.IncidenteDto;
import com.example.demo.entity.Comunidad.Incidente.Incidente;
import jakarta.transaction.Transactional;

import java.util.List;

public interface CommunityService {
    void persistIncidente(IncidenteDto incidenteDto);

    CommunityDto findCommunityByName(String communityName);



    List<CommunityDto> findAll();

    CommunityDto findById(long id);

    boolean isUserMember(long communityId, long userId);

    void addMember(long communityId, long userId);
    void deleteMember(long communityId, long userId);

    @Transactional
    void cerrarIncidente(long incidenteId);

    Incidente obtenerIncidentePorId(long incidenteId);
}