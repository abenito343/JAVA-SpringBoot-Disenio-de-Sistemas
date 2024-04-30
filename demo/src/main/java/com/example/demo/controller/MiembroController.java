/*package com.example.demo.controller;

import com.example.demo.dto.ComunidadDto.MiembroDto;

import com.example.demo.entity.Comunidad.Miembro;
import com.example.demo.entity.Password.DefaultPasswordValidator;
import com.example.demo.entity.Password.OwaspPasswordValidator;
import com.example.demo.entity.Password.RegexPasswordValidator;
import com.example.demo.entity.Password.ValidPasswordManager;
import com.example.demo.service.MiembroService;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;
°°
        MiembroDto miembro = new MiembroDto();
        model.addAttribute("miembro", miembro);
        return "register";
    }

    // handler method to handle register miembro form submit request
    @PostMapping("/register/save")
    public String registration(@Valid @ModelAttribute("miembro") MiembroDto miembro,
                               BindingResult result,
                               Model model){

        miembroService.saveMiembro(miembro);
        return "redirect:/register?success";
    }

    @GetMapping("/miembros")
    public String listRegisteredMiembros(Model model){
        List<MiembroDto> miembros = miembroService.findAllMiembros();
        model.addAttribute("miembros", miembros);
        return "miembros";
    }
}
*/
