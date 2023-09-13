package com.cristhiandiaz.project.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cristhiandiaz.project.models.Usuario;
import com.cristhiandiaz.project.services.UsuarioServicio;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/registrarse")
public class UsuarioController {
    
    @Autowired UsuarioServicio usuarioServicio;

    @GetMapping("")
    public String registrarUsuario(@ModelAttribute("usuario") Usuario usuario) {
        return "registro";
    }

    @PostMapping
    public String validarUsuario(@Valid @ModelAttribute("usuario") Usuario usuario, BindingResult result,
            HttpSession session) {
        Usuario unique = usuarioServicio.findByEmail(usuario.getEmail());
        if (unique != null) {
            FieldError error = new FieldError("email", "email",
                    "El email ya esta en uso");
            result.addError(error);
        }
        if (!usuario.getPassword().equals(usuario.getConfirmPassword())) {
            FieldError error = new FieldError("confirmPassword", "confirmPassword",
                    "Las Contraseñas no coinciden");
            result.addError(error);
        }
        if (result.hasErrors()) {
            return "registro";
        }
        Usuario user = usuarioServicio.registerUsuario(usuario);
        session.setAttribute("usuarioId", user.getId());
        return "redirect:/productos";
    }

}
