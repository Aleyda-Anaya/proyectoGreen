package com.cristhiandiaz.project.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cristhiandiaz.project.models.Categoria;
import com.cristhiandiaz.project.services.CategoriaServicio;

@Controller
@RequestMapping("/categorias")
public class CategoriaController {

    @Autowired
    CategoriaServicio categoriaServicio;

    @GetMapping("/new")
    public String showCreateForm() {
        return "crudCategoria";
    }

    @PostMapping("/new")
    public String createCategory(@ModelAttribute Categoria categoria) {
        categoriaServicio.save(categoria);
        return "redirect:/";
    }
}
