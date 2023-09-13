package com.cristhiandiaz.project.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cristhiandiaz.project.models.Categoria;
import com.cristhiandiaz.project.repositories.CategoriaRepositorio;

@Service
public class CategoriaServicio extends ServicioBase<Categoria>{

    private final CategoriaRepositorio categoriaRepositorio;

    public CategoriaServicio(CategoriaRepositorio categoriaRepositorio) {
        super(categoriaRepositorio);
        this.categoriaRepositorio = categoriaRepositorio;
    }

    public List<Categoria> findByNombreCategoria(String nombreCategoria){
        return categoriaRepositorio.findByNombreCategoria(nombreCategoria);
    }
    
}
