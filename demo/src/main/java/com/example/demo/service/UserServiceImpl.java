package com.example.demo.service;


import com.example.demo.dto.ComunidadDto.MiembroDto;
import com.example.demo.dto.tipoDto.TipoMiembroDto;
import com.example.demo.dto.AuthenticationDto.UserDto;
import com.example.demo.entity.Authentication.Role;
import com.example.demo.entity.Authentication.User;
import com.example.demo.entity.Comunidad.Miembro;
import com.example.demo.repository.MemberRepository;
import com.example.demo.repository.RoleRepository;
import com.example.demo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private MemberRepository miembroRepository;
    private final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    @Override
    public void saveUser(UserDto userDto) {
        User user = new User();
        user.setName(userDto.getFirstName() + " " + userDto.getLastName());
        user.setEmail(userDto.getEmail());
        user.setNumero(userDto.getNumero());
        // encrypt the password using spring security
        user.setPassword(passwordEncoder.encode(userDto.getPassword()));

        Role role = roleRepository.findByName("ROLE_ADMIN");
        if(role == null){
            role = checkRoleExist();
        }
        user.setRoles(List.of(role));

        userRepository.save(user);
    }
    public User update(UserDto userDto){
        User user = userRepository.findById( userDto.getId()).orElseThrow();
        List<MiembroDto> miembrosSinPersistir = userDto.getMembresias().stream().filter(miembroDto -> miembroDto.getId() == null).toList();
        miembrosSinPersistir.forEach(miembroSinPersistirDto-> miembroRepository.save(miembroSinPersistirDto.toPersist(user)));
        return user;

    }

    @Override
    public UserDto findUserByEmail(String email) {
        return this.mapToUserDto(userRepository.findByEmail(email));
    }

    @Override
    public List<UserDto> findAllUsers() {
        List<User> users = userRepository.findAll();
        return users.stream()
                .map(this::mapToUserDto)
                .collect(Collectors.toList());
    }

    @Override
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public User findById(Long id) {
        return userRepository.findById(id).orElseThrow();
    }
    @Override
    public UserDto findUserById(Long id) {
        return mapToUserDto(this.findById(id));
    }

   @Override
    public List<UserDto> findByInteres(Long interesId, List<Long> usersIds) {
        return  userRepository.findWithInteres(interesId, usersIds).stream().map(this::mapToUserDto).toList();
    }



    private UserDto mapToUserDto(User user){
        UserDto userDto = new UserDto();
        userDto.setId(user.getId());
        String[] str = user.getName().split(" ");
        userDto.setFirstName(str[0]);
        userDto.setLastName((str.length > 1) ? str[1] : "");
        userDto.setEmail(user.getEmail());
        userDto.setNumero(user.getNumero());
        return userDto;
    }
    private MiembroDto mapToMemberDto(Miembro miembro, UserDto userDto){
        MiembroDto miembroDto = new MiembroDto();
        miembroDto.setUserId(userDto.getId());
        miembroDto.setTipoMiembroDto(new TipoMiembroDto(miembro.getTipoMiembro().getId(),miembro.getTipoMiembro().getName()));
        miembroDto.setId(miembro.getId());
        return miembroDto;
    }

    private Role checkRoleExist(){
        Role role = new Role();
        role.setName("ROLE_ADMIN");
        return roleRepository.save(role);
    }
}