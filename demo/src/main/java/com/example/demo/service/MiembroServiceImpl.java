/*package com.example.demo.service;


import com.example.demo.dto.ComunidadDto.MiembroDto;
import com.example.demo.entity.Authentication.Role;
import com.example.demo.entity.Comunidad.Miembro;
import com.example.demo.repository.RoleRepository;
import com.example.demo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
/public class MiembroServiceImpl implements MiembroService {
    @Autowired
    private MiembroRepository miembroRepository;
    @Autowired
    private UserRepository userRepository;


    @Override
    public void saveMiembro(MiembroDto miembroDto) {
        Miembro miembro = new Miembro();
        miembro.setName(miembroDto.getFirstName() + " " + miembroDto.getLastName());
        miembro.setEmail(miembroDto.getEmail());

        // encrypt the password using spring security
        miembro.setPassword(passwordEncoder.encode(miembroDto.getPassword()));

        Role role = .findByName("ROLE_ADMIN");
        if(role == null){
            role = checkRoleExist();
        }
        miembro.setRoles(List.of(role));

        miembroRepository.save(miembro);
    }

    private MiembroDto mapToMiembroDto(Miembro miembro){
        MiembroDto miembroDto = new MiembroDto();
        miembroDto.setUserDto(miembro.getUser();

        return miembroDto;
    }

    private Role checkRoleExist(){
        Role role = new Role();
        role.setName("ROLE_ADMIN");
     //   return roleRepository.save(role);
    }
}*/