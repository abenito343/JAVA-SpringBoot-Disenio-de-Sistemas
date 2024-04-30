package com.example.demo.controller;

import com.example.demo.ServiciosExternos.Notifcaciones.ServicioDeNotificacionJavaMail;
import com.example.demo.dto.AuthenticationDto.UserDto;
import com.example.demo.dto.ComunidadDto.CommunityDto;
import com.example.demo.dto.ComunidadDto.IncidenteDto.IncidenteDto;
import com.example.demo.entity.Password.*;
import com.example.demo.entity.Authentication.User;
import com.example.demo.service.CommunityService;

import com.example.demo.service.UserService;
import jakarta.validation.Valid;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;

@Controller
public class AuthController {

    private UserService userService;
    private CommunityService communityService;
    private ServicioDeNotificacionJavaMail servicioDeNotificacionJavaMail;


    public AuthController(UserService userService, CommunityService communityService, ServicioDeNotificacionJavaMail servicioDeNotificacionJavaMail) {
        this.userService = userService;
        this.communityService = communityService;
        this.servicioDeNotificacionJavaMail = servicioDeNotificacionJavaMail;
    }

    @GetMapping("index")
    public String home(){
        return "index";
    }

    @GetMapping("/login")
    public String loginForm() {
        return "login";
    }

    // handler method to handle user registration request
    @GetMapping("register")
    public String showRegistrationForm(Model model){
        UserDto user = new UserDto();
        model.addAttribute("user", user);
        return "register";
    }

    // handler method to handle register user form submit request
    @PostMapping("/register/save")
    public String registration(@Valid @ModelAttribute("user") UserDto user,
                               BindingResult result,
                               Model model){

        // es valido
        boolean isValid = new ValidPasswordManager().executeAlValidation(user.getPassword());
        if(!isValid){
            result.rejectValue("password",null,"The password is weak, please enter an stronger password");
        }
        User existing = userService.findByEmail(user.getEmail());
        if (existing != null) {
            result.rejectValue("email", null, "There is already an account registered with that email");
        }
        if (result.hasErrors()) {
            model.addAttribute("user", user);
            return "register";
        }
        userService.saveUser(user);
        return "redirect:/register?success";
    }

    @GetMapping("/users")
    public String listRegisteredUsers(Model model){
        List<UserDto> users = userService.findAllUsers();
        model.addAttribute("users", users);
        return "users";
    }
    @GetMapping("/user/{id}")
    @ResponseBody
    public String obtenerXid(@PathVariable long id) {
        System.out.println(userService.findById(id));
        return "";
    }
    @PutMapping("/user")
    @ResponseBody
    public String modify(@Valid @RequestBody UserDto user){
        return (userService.update(user) != null) ? "jajaja todo piolum" : "todo mal";
    }


    @GetMapping("/user/profile")
    public String userProfile(Model model) {
        UserDto user = getUserByContext();

        model.addAttribute("user", user);

        return "user";
    }
    @GetMapping("/communities")
    public String comunidades( Model model){
        UserDto user = getUserByContext();
        List<CommunityDto> communityDto = communityService.findAll();
        communityDto.forEach(comunidad -> {
            comunidad.setEsMiembro(comunidad.getMiembros().stream().anyMatch(miembroDto -> Objects.equals(miembroDto.getUserId(), user.getId())));
        });
        model.addAttribute("communities", communityDto);
        return "comunidades";
    }
    @GetMapping("/communities/{id}/incidente/save")
    public String newIncidents(Model model,@PathVariable long id){
        IncidenteDto incidenteDto = new IncidenteDto();
        incidenteDto.setComunidadDto(new CommunityDto(id));
        model.addAttribute("incidente", incidenteDto);
        return "creacion-incidentes";
    }
    @GetMapping("/communities/{id}/incidente/list")
    public String incidentsList(Model model,@PathVariable long id){
        model.addAttribute("community", communityService.findById(id));
        return "lista-incidentes";
    }
    @PostMapping("/communities/incidente/save")
    public String registration(@Valid @ModelAttribute("incidente") IncidenteDto incidenteDto,
                               BindingResult result){
        CommunityDto communityDto = communityService.findById(incidenteDto.getComunidadDto().getId());
        communityService.persistIncidente(incidenteDto);

        List<Long> membersIds = communityDto.getMiembros().stream().map(miembroDto -> miembroDto.getUserId()).toList();
        List<UserDto> userDtos = userService.findByInteres(incidenteDto.getServicioDto().getId(), membersIds);

        userDtos.forEach(user -> servicioDeNotificacionJavaMail.notificar(user.getEmail(),"Notificacion",incidenteDto.getObservaciones()) );



        return "redirect:/communities/" + communityDto.getId() + "/incidente/save?success";
    }

    // Método para unirse a una comunidad
    @GetMapping("/communities/{id}/join")
    public String joinCommunity(@PathVariable long id) {

        UserDto user = getUserByContext();

        // Verificar si el usuario ya es miembro de la comunidad
        if (!communityService.isUserMember(id, user.getId())) {
            // Si no es miembro, agregarlo a la comunidad
            communityService.addMember(id, user.getId());
        }

        return "redirect:/communities";
    }
    @GetMapping("/communities/{id}/exit")
    public String exitCommunity(@PathVariable long id) {

        UserDto user = getUserByContext();


        communityService.deleteMember(id, user.getId());



        return "redirect:/communities";
    }

    @GetMapping("/communities/{communityId}/incidente/{incidenteId}/close")
    public String cerrarIncidente(@PathVariable long communityId, @PathVariable long incidenteId) {
        communityService.cerrarIncidente(incidenteId);
        return "redirect:/communities/" + communityId + "/incidente/list";
    }
    private UserDto getUserByContext(){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        return userService.findUserByEmail(((UserDetails) auth.getPrincipal()).getUsername());
    }

}