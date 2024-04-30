package com.example.demo.service;


import com.example.demo.dto.ComunidadDto.CommunityDto;
import com.example.demo.dto.ComunidadDto.IncidenteDto.IncidenteDto;
import com.example.demo.dto.ComunidadDto.MiembroDto;
import com.example.demo.dto.ServiciosDto.ServicioDto;
import com.example.demo.dto.tipoDto.TipoIncidenteDto;
import com.example.demo.dto.tipoDto.TipoMiembroDto;
import com.example.demo.dto.tipoDto.TipoServicioDto;
import com.example.demo.entity.Authentication.User;
import com.example.demo.entity.Comunidad.Comunidad;
import com.example.demo.entity.Comunidad.Incidente.Incidente;
import com.example.demo.entity.Comunidad.Miembro;
import com.example.demo.entity.Tipos.TipoMiembro;
import com.example.demo.repository.CommunityRepository;
import com.example.demo.repository.UserRepository;
import jakarta.transaction.Transactional;
import lombok.SneakyThrows;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.crossstore.ChangeSetPersister;
import org.springframework.stereotype.Service;


import java.util.List;
import java.util.Optional;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
public class CommunityServiceImpl implements CommunityService {
    @Autowired
    private CommunityRepository communityRepository;
    @Autowired
    private UserRepository userRepository;





    @Override
    public void persistIncidente(IncidenteDto incidenteDto) {
        Comunidad comunidad = communityRepository.findById(incidenteDto.getComunidadDto().getId()).orElseThrow();
        Incidente incidente = incidenteDto.toPersist();
        comunidad.aregarIncidente(incidente);
        communityRepository.save(comunidad);

    }

    @Override
    public List<CommunityDto> findAll() {
        List<Comunidad> comunidades = communityRepository.findAll();
        return comunidades.stream()
                .map(this::mapToComunidadDto)
                .collect(Collectors.toList());
    }

    @Override
    public CommunityDto findCommunityByName(String communityName) {
        return this.mapToComunidadDto(communityRepository.findByName(communityName));
    }

    @Override
    public CommunityDto findById(long id) {
        Optional<Comunidad> comunidad = this.communityRepository.findById(id);
        return this.mapToComunidadDto(comunidad.orElseThrow());
    }

    private CommunityDto mapToComunidadDto(Comunidad comunidad){
        // TODO: TERMINAR el mapeo
        CommunityDto communityDto = new CommunityDto();
        List<MiembroDto> miembroDtos = comunidad.getMembresias().stream().map(miembro -> new MiembroDto(miembro.getId(), miembro.getUser().getId(),new TipoMiembroDto(miembro.getTipoMiembro().getId(), miembro.getTipoMiembro().getName()))).toList();
        communityDto.setId(comunidad.getId());
        communityDto.setNombre(comunidad.getName());
        communityDto.setMiembros(miembroDtos);
        List<IncidenteDto> incidenteDtos = comunidad.getIncidente().stream().map(mapIncidentToDto()).toList();
        communityDto.setIncidente(incidenteDtos);
        return communityDto;

    }

    @NotNull
    private static Function<Incidente, IncidenteDto> mapIncidentToDto() {

        return (incidente) -> new IncidenteDto(
                incidente.getId(),
                new ServicioDto(incidente.getServicioAfectado().getId(),
                        incidente.getServicioAfectado().getNombre(),
                        incidente.getServicioAfectado().getEsHabitual(),
                        new TipoServicioDto(
                                incidente.getServicioAfectado().getTipoServicio().getId(),
                                incidente.getServicioAfectado().getTipoServicio().getName())),
                incidente.getObservaciones(),
                new TipoIncidenteDto(incidente.getTipoIncidente().getId(), incidente.getTipoIncidente().getName()),
                new CommunityDto(incidente.getComunidad().getId()),
                incidente.getHoraDeApertura(),
                incidente.getHoraDeCierre());
    }


    @Override
    public boolean isUserMember(long communityId, long userId) {
        Comunidad comunidad = communityRepository.findById(communityId).orElseThrow();
        return comunidad.getMembresias().stream().anyMatch(miembro -> miembro.getUser().getId() == userId);
    }

    @Override
    public void addMember(long communityId, long userId) {
        Comunidad comunidad = communityRepository.findById(communityId).orElseThrow();
        User user = userRepository.findById(userId).orElseThrow();
            // TipoMiembroDto tipoMiembro = new TipoMiembro(1,"asda");// Obtén el tipo de miembro según tus necesidades, puede ser un tipo predeterminado o buscar en la base de datos
            // Miembro miembro = new Miembro(user, comunidad, tipoMiembro);
        Miembro miembro = new Miembro(user, comunidad, TipoMiembro.MIEMBRO_COMUN);
        comunidad.agregarUsuario(miembro);
        communityRepository.save(comunidad);
    }
    @Override
    public void deleteMember(long communityId, long userId) {
        Comunidad comunidad = communityRepository.findById(communityId).orElseThrow();
        comunidad.getMembresias().forEach(member -> {
            if(member.getUser().getId() == userId){
                comunidad.sacarMiembro(member);
            }
        });
        communityRepository.save(comunidad);
    }



    @Override
    @Transactional
    public void cerrarIncidente(long incidenteId) {
        Incidente incidente = obtenerIncidentePorId(incidenteId);
        incidente.cerrarIncidente();  // Método cerrar() podría realizar lógica adicional si es necesario
    }

    @SneakyThrows
    @Override
    public Incidente obtenerIncidentePorId(long incidenteId) {
        List<Comunidad> comunidades = communityRepository.findAll();

        for (Comunidad comunidad : comunidades) {
            Optional<Incidente> incidenteOptional = comunidad.getIncidentes().stream()
                    .filter(incidente -> incidente.getId().equals(incidenteId))
                    .findFirst();


            if (incidenteOptional.isPresent()) {
                return incidenteOptional.get();
            }
        }


        throw new ChangeSetPersister.NotFoundException();
    }

}