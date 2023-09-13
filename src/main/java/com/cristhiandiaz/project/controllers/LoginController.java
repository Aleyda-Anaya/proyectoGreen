package com.cristhiandiaz.project.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cristhiandiaz.project.models.Usuario;
import com.cristhiandiaz.project.services.UsuarioServicio;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired UsuarioServicio usuarioServicio;

    @GetMapping("")
    public String login(){
        return "login";
    }

    @PostMapping("")
    public String loginUsuario(@RequestParam("email") String email, @RequestParam("password") String password, Model model,
            HttpSession session) {
            // String ultimaurl = (String) session.getAttribute("ultimaurl");
        if (!usuarioServicio.authenticateUsuario(email, password)) {
            model.addAttribute("error", "Invalid credentials. Please try again");
            return "login";

        }
        Usuario usuario = usuarioServicio.findByEmail(email);
        session.setAttribute("usuarioId", usuario.getId());
        return "redirect:/productos";
    }
}
