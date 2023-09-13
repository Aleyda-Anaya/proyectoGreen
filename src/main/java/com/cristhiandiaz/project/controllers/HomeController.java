package com.cristhiandiaz.project.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.cristhiandiaz.project.services.UsuarioServicio;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
    
    @Autowired UsuarioServicio usuarioServicio;

    @GetMapping("/")
    public String home(){
        return "redirect:/productos";
    }  

    @GetMapping("/logout")
    public String cerrarSesion(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/aboutus")
        public String informacion(){
            return "info";
    }

    @GetMapping("/carrito")
    public String carrito(){
        return "carrito";
    }
}
